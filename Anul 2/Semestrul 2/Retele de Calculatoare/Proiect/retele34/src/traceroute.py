import socket
import traceback
import requests
import json

MAX_HOPS=16
port = 33434
keyIpInfo = "1ae9085262f497"

trace_list = []

fake_HTTP_header = {
                        'referer': 'https://ipinfo.io/',
                        'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36'
                    }

# socket de UDP
udp_send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, proto=socket.IPPROTO_UDP)

# socket RAW de citire a raspunsurilor ICMP
icmp_recv_socket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_ICMP)
# setam timout in cazul in care socketul ICMP la apelul recvfrom nu primeste nimic 

icmp_recv_socket.bind(("",port))
icmp_recv_socket.settimeout(3)


def main():
    dest_addr = socket.gethostbyname("microsoft.com")
    print("tracing {0} ...".format(dest_addr))
    done = False
    for ttl in range(1, MAX_HOPS):
        succes = traceroute(dest_addr,ttl )
        if succes:
            if(trace_list[len(trace_list)-1] == dest_addr):
                done = True
        if done:
            break

def traceroute(ip,TTL):
 
    # setam TTL in headerul de IP pentru socketul de UDP
 
    udp_send_sock.setsockopt(socket.IPPROTO_IP, socket.IP_TTL, TTL)

    # trimite un mesaj UDP catre un tuplu (IP, port)
    udp_send_sock.sendto(b'', (ip, port))

    # asteapta un mesaj ICMP de tipul ICMP TTL exceeded messages
    # in cazul nostru nu verificam tipul de mesaj ICMP
    # puteti verifica daca primul byte are valoarea Type == 11
    # https://tools.ietf.org/html/rfc792#page-5
    # https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Header
    try:
        data, addr = icmp_recv_socket.recvfrom(2512)
        ip_current = addr[0]
        
        if ip_current == ip or (len(trace_list)>0 and ip_current == trace_list[len(trace_list)-1]):
            done = True
        trace_list.append(ip_current)
        dump_ip_info(ip_current)
        return True
            
    except Exception as e:
        print("Socket timeout ", str(e))
        print(traceback.format_exc())
        return False

    return False


def dump_ip_info(ip):
    url = "https://ipinfo.io/{0}?token={1}".format(ip,keyIpInfo)
    hostName = ""
    try:
        responseInfo = requests.get(url, headers=fake_HTTP_header)
        if responseInfo.status_code == 200:
            response = responseInfo.content.decode("utf-8")
            response_object = json.loads(response)
            if 'bogon' in response_object:
                hostName = 'bogon'
            if 'hostname' in response_object:
                hostName = response_object['hostname']
            if 'city' in response_object:
                hostName = "{0} city:{1}".format(hostName, response_object['city']);
            if 'region' in response_object:
                hostName = "{0} region:{1}".format(hostName, response_object['region']);
            if 'country' in response_object:
                hostName = "{0} country:{1}".format(hostName, response_object['country']);
    
    except Exception as e:
        print("error reading ip info", str(e))
        print(traceback.format_exc())
        return
    print("rt - {0} -{1}".format(ip,hostName))



main()