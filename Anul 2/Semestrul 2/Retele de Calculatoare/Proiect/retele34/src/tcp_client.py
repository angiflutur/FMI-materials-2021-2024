# TCP client
import socket
import logging
import time
import sys


port = 10001
#adresa se citeste din linia de comanda !!! (o dam ca parametru cand rulam)

#adresa = "127.0.0.1" if USE_LOCAL_MACHINE else "198.7.0.2"


def process_server_loop(sock):
    '''
    trateaza comunicarea intre client si server
    '''
    msg_counter = 0

    while True:
        #construim un mesaj
        try:
            mesaj = "C->S mesaj  #{0}".format(msg_counter)
            msg_counter = msg_counter + 1

            logging.info('[client] se trimite: "%s"', mesaj)

            #il trimitem la  server prin sock
            sock.send(mesaj.encode("utf-8"))
            logging.info('[client] mesaj trimis: "%s"', mesaj)

            #vedem mesajul primit inapoi
            data = sock.recv(1024)
            logging.info('[client] mesaj primit: "%s"', data)
            time.sleep(3)
        except Exception as error:
            logging.info("[client] error. mesaj de eroare: %s", error)
            break
    sock.close()


def main():
    logging.basicConfig(
        format="[LINE:%(lineno)d]# %(levelname)-8s [%(asctime)s]  %(message)s",
        level=logging.NOTSET,
    )

    #conectare default pe interfata de locala (daca nu am dat noi ca parametru la rulare)
    adresa = '127.0.0.1'
    if len(sys.argv)>=2:
        adresa= sys.argv[1]
    else:
        adresa = '127.0.0.1'
        
    

    server_address = (adresa, port)
    while True:
        #construim un socket si incercam sa ne conectam la server
        try:
            sock = socket.socket(
                socket.AF_INET, socket.SOCK_STREAM, proto=socket.IPPROTO_TCP
            )
            '''
            AF_INET = folosim adresare ipv4
            SOCK_STREAM = specificam ca dorim un socket care sa fol TCP
            PROTO = protocolul subadiacent pentru socket, adica TCP
            '''
            logging.info("[client] Handshake cu %s", str(server_address))
            
            #conectare
            sock.connect(server_address)
            
            logging.info("[client] conexiune realizata cu %s", str(server_address))
            
            #apelam functia, daca a reusit conectarea
            process_server_loop(sock)
        except KeyboardInterrupt:
            logging.info("[client] input keyboard. Iesire...")
            break
        except Exception as error:
            # daca nu, incercam iar conectarea, peste cateva secunde
            logging.error("[client] erroare %s", error)
            time.sleep(3)
        finally:
            logging.info("[client] closing socket")
            sock.close()


main()
