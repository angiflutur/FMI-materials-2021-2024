# TCP Server
 #inspiratie de aici: https://networks.hypha.ro/capitolul6/#scapy_nfqueue
import socket
import logging
import time

#port si adresa pentru server
port = 10001
#bind pe toate interfetele 
adresa = '0.0.0.0'

def process_client_loop(client):
    while True:
        #astepram primirea de date de la client 
        try:
            time.sleep(3)
            data = client.recv(1024)

            logging.info('[server] Content primit: "%s"', data)

            # trimitem mai departe acelasi mesaj dar adaugam S->C in fata
            client.send(b"S->C " + data)
            
            logging.info('[server] mesaj trimis: "%s"', data)
            
        except Exception as ex:
            logging.info('[server] eroare conexiune: "%s"', ex)
            break

def main():
    logging.basicConfig(format = u'[LINE:%(lineno)d]# %(levelname)-8s [%(asctime)s]  %(message)s', level = logging.NOTSET)

    #creem un socket

    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, proto=socket.IPPROTO_TCP)

    '''
    AF_INET = folosim adresare ipv4
    SOCK_STREAM = specificam ca dorim un socket care sa fol TCP
    PROTO = protocolul subadiacent pentru socket, adica TCP
    '''

    #daca se inchide, nu vrem sa asteptam pana il elobereaza SO-ul
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    
    #facem bind pe portul setat
    server_address = (adresa, port)
    sock.bind(server_address)
    logging.info("[server] a pornit pe %s si  portul %d", adresa, port)
    sock.listen(1)

    while True:
        try:
            logging.info('[server] Asteptam conexiune...')
            #asteptam o cerere de la client si o acceptam
            client, address = sock.accept()
            logging.info('[server] Conexiune realizata cu %s', address)
            #apelam functia petntru clientul nostru
            process_client_loop(client)
            client.close()
        except KeyboardInterrupt:
            logging.info('[server] input keyboard. Iesire...')
            break
    sock.close()

main()