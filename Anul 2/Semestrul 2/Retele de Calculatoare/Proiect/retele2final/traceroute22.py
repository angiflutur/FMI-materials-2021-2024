import socket
import traceback
import requests
import json
import time

MAX_HOPS = 100
port = 33434
keyIpInfo = "72b4ef6aa15955"

trace_list = []

fake_HTTP_header = {
    'referer': 'https://ipinfo.io/',
    'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36'
}

# Socket de UDP
udp_send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, proto=socket.IPPROTO_UDP)

# Socket RAW de citire a raspunsurilor ICMP
icmp_recv_socket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_ICMP)
# Setăm timeout în cazul în care socketul ICMP la apelul recvfrom nu primește nimic
icmp_recv_socket.settimeout(3)

def main():
    sites = read_sites_from_file("siteuritraceroute.txt")
    if sites:
        for site in sites:
            dest_addr = socket.gethostbyname(site)
            print("Tracing {0} ...".format(site))
            route = traceroute(dest_addr)
            dump_route_info(route, site)
            print("Done.")
            print("Waiting for 5 seconds before next site...")
            time.sleep(5)
    else:
        print("No sites found in 'siteuritraceroute.txt' file.")

def traceroute(ip):
    route = []
    done = False
    for ttl in range(1, MAX_HOPS):
        success, ip_current = traceroute_step(ip, ttl)
        if success:
            if (route and ip_current == route[-1]) or ip_current == ip:
                done = True
        if done:
            break
        route.append(ip_current)
    return route

def traceroute_step(ip, ttl):
    # Socket de UDP
    udp_send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, proto=socket.IPPROTO_UDP)

    # Socket RAW de citire a raspunsurilor ICMP
    icmp_recv_socket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_ICMP)
    # Setăm TTL în headerul de IP pentru socketul de UDP
    udp_send_sock.setsockopt(socket.IPPROTO_IP, socket.IP_TTL, ttl)

    # Trimite un mesaj UDP către un tuplu (IP, port)
    udp_send_sock.sendto(b'mesaj', (ip, port))

    # Așteaptă un mesaj ICMP de tipul ICMP TTL exceeded messages
    try:
        attempts = 0
        success = False
        while attempts < 4 and not success:
            try:
                data, addr = icmp_recv_socket.recvfrom(63535)
                success = True
            except Exception as e:
                attempts += 1

        ip_current = addr[0]
        return success, ip_current
    except Exception as e:
        print("Socket timeout ", str(e))
        print(traceback.format_exc())
        return False, None

def dump_route_info(route, site):
    with open("res.txt", "a") as file:
        file.write(f"Route for site: {site}\n")
        for ip in route:
            dump_ip_info(ip, file)
        file.write("\n")

def dump_ip_info(ip, file):
    url = f"https://ipinfo.io/{ip}?token={keyIpInfo}"
    host_info = ""
    try:
        responseInfo = requests.get(url, headers=fake_HTTP_header)
        if responseInfo.status_code == 200:
            response = responseInfo.content.decode("utf-8")
            response_object = json.loads(response)
            if 'bogon' in response_object:
                host_info = 'bogon'
            if 'hostname' in response_object:
                host_info = response_object['hostname']
            if 'city' in response_object:
                host_info = f"{host_info} city:{response_object['city']}"
            if 'region' in response_object:
                host_info = f"{host_info} region:{response_object['region']}"
            if 'country' in response_object:
                host_info = f"{host_info} country:{response_object['country']}"
    except Exception as e:
        print("Error reading IP info:", str(e))
        print(traceback.format_exc())
        return
    file.write(f"rt - {ip} - {host_info}\n")

def read_sites_from_file(filename):
    try:
        with open(filename, "r") as file:
            return file.read().splitlines()
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
        return []

if __name__ == "__main__":
    main()

