from scapy.all import *
import socket


sourceFile = open("blocked.txt", 'w')
blocked_domains = {}


def main():
    simple_udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, proto=socket.IPPROTO_UDP)
    simple_udp.bind(('127.0.0.1', 53))


    while True:
        request, adresa_sursa = simple_udp.recvfrom(65535)
        packet = DNS(request)
        dns = packet.getlayer(DNS)

        if dns is not None and dns.opcode == 0:  # dns QUERY
            print(packet.summary())
            allowName = not isOnBlackList(dns.qd.qname.decode('utf-8'))
            if allowName:
                dns_real_response = dns_real_query(dns.qd.qname)
                dns_answer = dns_real_response.an
            else:
                print('BLOCAT')
                dns_answer = DNSRR(
                    rrname=dns.qd.qname,
                    ttl=330,
                    type="A",
                    rclass="IN",
                    rdata='0.0.0.0'
                )

            dns_response = DNS(
                id=packet[DNS].id,
                qr=1,
                aa=0,
                rcode=0,
                qd=packet.qd,
                an=dns_answer
            )
            print('response:')
            print(dns_response.summary())
            simple_udp.sendto(bytes(dns_response), adresa_sursa)

    simple_udp.close()


def dns_real_query(hostname):
    ip = IP(dst='8.8.8.8')
    transport = UDP(dport=53, sport=RandShort())

    dns = DNS(rd=1)
    dns_query = DNSQR(qname=hostname)
    dns.qd = dns_query

    answer = sr1(ip / transport / dns, timeout=2, verbose=False)
    return answer[DNS]


def isOnBlackList(hostname):
    print(hostname)
    with open('adservers.txt', 'r') as file:
        for line in file:
            if line.strip().startswith('0.0.0.0'):
                domain = line.strip().split()[1]
                if domain in hostname:
                    print(domain, file=sourceFile)
                    if 'google' in domain or 'facebook' in domain:
                        print(domain)
                    if domain in blocked_domains:
                        blocked_domains[domain] += 1
                    else:
                        blocked_domains[domain] = 1
                    analyze_blocked_domains()
                    return True

    return False


def analyze_blocked_domains():
    google_count = 0
    facebook_count = 0
    domain_counts = {}

    for domain in blocked_domains:
        if 'google' in domain:
            google_count += 1
        if 'facebook' in domain:
            facebook_count += 1

        if domain in domain_counts:
            domain_counts[domain] += 1
        else:
            domain_counts[domain] = 1

    sorted_domains = sorted(domain_counts.items(), key=lambda x: x[1], reverse=True)

    with open("statistics.txt", 'w') as output:
        output.write("Număr de domenii blocate care conțin 'google': {}\n".format(google_count))
        output.write("Număr de domenii blocate care conțin 'facebook': {}\n".format(facebook_count))
        output.write("Cele mai frecvente companii blocate:\n")
        for domain, count in sorted_domains:
            output.write("{} - {}\n".format(domain, count))


main()
