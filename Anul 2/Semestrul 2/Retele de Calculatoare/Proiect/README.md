# Proiect Rețele 2022-2023

## Sumar

Pentru proiect trebuie să rezolvați următoarele 

### 4 probleme:
- [Traceroute (2.5p)](#trace)
- [Server DNS Add Blocker (2.5p)](#dns)
- [ARP Spoofing (2p)](#arp)
- [TCP Hijacking (2p)](#tcp)

### Reguli:
- echipe de maxim 3 persoane (muncă în echipă înseamnă că fiecare coleg poate explica munca celorlalți)
- codul copiat de la alți colegi din alte echipe se punctează cu 0
- echipele pot fi formate doar din colegi care sunt in aceeasi serie
- orice cod preluat de pe internet trebuie citat (menționat la început de fișier) și înțeles întru totul
- veți fi punctați pe baza întrebărilor pe care le primiți
- întrebările nu vor tine cont de partea la care ati lucrat cel mai mult
- proiectul trebuie să ruleze în timpul prezentării
- **termen limită:** 12 iunie

<a name="trace"></a> 
## Traceroute (2.5p)
Traceroute este o metodă prin care putem urmări prin ce noduri (routere) trece un pachet pentru a ajunge la destinație.
În funcție de IP-urile acestor noduri, putem afla țările sau regiunile prin care trec pachetele.
Înainte de a implementa tema, citiți explicația felului în care funcționează [traceroute prin UDP](https://www.slashroot.in/how-does-traceroute-work-and-examples-using-traceroute-command). Pe scurt, pentru fiecare mesaj UDP care este în tranzit către destinație, dar pentru care TTL (Time to Live) expiră, senderul primește de la router un mesaj [ICMP](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Header) de tipul [Time Exceeded TTL expired in transit](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Time_exceeded).

1. Modificați fișierul `src/traceroute.py` și implementați o aplicație traceroute complet funcțională.
1. Folosiți un API sau o bază de date care oferă informații despre locația IP-urilor (de ex. [ip-api](https://ip-api.com), [ip2loc](https://ip2loc.com), [ipinfo](https://ipinfo.io) etc.) și apelați-l pentru fiecare IP public pe care îl obțineți.
1. Afișați locațiile din lume pentru rutele către mai multe site-uri din regiuni diferite: din Asia, Africa și Australia căutând site-uri cu extensia .cn, .za, .au. Folositi IP-urile acestora.
1. Afișați: Orașul, Regiunea și Țara (acolo unde sunt disponibile) prin care trece mesajul vostru pentru a ajunge la destinație.
1. Executați codul din mai multe locații: facultate, acasă, rețea publică și salvați toate rutele obținute într-un fișier pe care îl veți prezenta
1. (opțional) Afișați țările pe o hartă folosind [geoplotting](https://geopandas.org/en/stable/gallery/plotting_with_geoplot.html)


<a name="dns"></a> 
## Server DNS Add Blocker (2.5p)
În cadrul acestei teme, veți avea de implementat un blocker de reclame și tracking după modelul [pi-hole](https://pi-hole.net/).

1. Citiți despre DNS în [secțiunea de curs](https://github.com/senisioi/computer-networks/tree/2023/capitolul2#dns).
1. Scrieți codul unei aplicații de tip DNS server. Puteți urmări un tutorial [în Rust aici](https://github.com/EmilHernvall/dnsguide/tree/master) și puteți folosi ca punct de plecare [codul în python disponibil în capitolul 6](https://github.com/senisioi/computer-networks/tree/2023/capitolul6#scapy_dns).
1. Utilizați o listă deja curatoriată de domenii asociate cu [reclame și tracking](https://github.com/anudeepND/blacklist) cu scopul de a bloca acele domenii. De fiecare dată când vine o cerere către serverul vostru pentru domenii din lista respectivă, serverul trebuie să [returneaze IP-ul](https://superuser.com/questions/1030329/better-to-block-a-host-to-0-0-0-0-than-to-127-0-0-1) `0.0.0.0`.
1. Creați o orchestrație docker compose (pe modelul `simple_flask.py` făcut la curs) care să pornească codul vostru în python și să pornească serverul DNS pe localhost.
1. Setați serverul să fie DNS-ul principal pentru calculatorul vostru:
    - [Linux](https://www.linuxfordevices.com/tutorials/linux/change-dns-on-linux)
    - [Windows & MacOS](https://www.hellotech.com/guide/for/how-to-change-dns-server-windows-mac)
1. Dacă accesați un site cu multe reclame (ex. https://www.accuweather.com/) ar trebui să apară curat în browser.
1. Salvați într-un fișier toate cererile pe care le blocați pe parcursul unei zile de navigat pe internet. Încercați să adunați minim 100 de nume blocate.
1. Obțineți o statistică pentru a verifica câte din numele blocate conțin 'google', 'facebook' și care sunt cele mai frecvente companii pe care le blocați.


<a name="arp"></a> 
## ARP Spoofing și TCP Hijacking (4p total)


## Structura containerelor
Partea asta se rezolvă folosind aceeași structură de containere ca în capitolul3. Pentru a construi containerele, rulăm `docker compose up -d`.
Imaginea este construită pe baza fișierul `docker/Dockerfile`, dacă facem modificări în fișier sau în scripturile shell, putem rula `docker-compose build --no-cache` pentru a reconstrui imaginile containerelor.


### Observații
1. E posibil ca tabelel ARP cache ale containerelor `router` și `server` să se updateze mai greu. Ca să nu dureze câteva ore până verificați că funcționează, puteți să le curățați în timp ce sau înainte de a declanșa atacul folosind [comenzi de aici](https://linux-audit.com/how-to-clear-the-arp-cache-on-linux/) `ip -s -s neigh flush all`
2. Orice bucată de cod pe care o luați de pe net trebuie însoțită de comments în limba română, altfel nu vor fi punctate.
3. Atacurile implementante aici au un scop didactic, nu încercați să folosiți aceste metode pentru a ataca alte persoane de pe o rețea locală.





## ARP Spoofing (2p)
[ARP spoofing](https://samsclass.info/124/proj11/P13xN-arpspoof.html) presupune trimiterea unui pachet ARP de tip reply către o țintă pentru a o informa greșit cu privire la adresa MAC pereche pentru un IP. [Aici](https://medium.com/@ismailakkila/black-hat-python-arp-cache-poisoning-with-scapy-7cb1d8b9d242) și [aici](https://www.youtube.com/watch?v=hI9J_tnNDCc) puteți urmări cum se execută un atac de otrăvire a tabelei cache ARP stocată pe diferite mașini.

Arhitectura containerelor este definită aici, împreună cu schema prin care `middle` îi informează pe `server` și pe `router` cu privire la locația fizică (adresa MAC) unde se găsesc IP-urile celorlalți. 


```
            MIDDLE------------\
        subnet2: 198.7.0.3     \
        MAC: 02:42:c6:0a:00:02  \
               forwarding        \ 
              /                   \
             /                     \
Poison ARP 198.7.0.1 is-at         Poison ARP 198.7.0.2 is-at 
           02:42:c6:0a:00:02         |         02:42:c6:0a:00:02
           /                         |
          /                          |
         /                           |
        /                            |
    SERVER <---------------------> ROUTER <---------------------> CLIENT
net2: 198.7.0.2                      |                           net1: 172.7.0.2
MAC: 02:42:c6:0a:00:03               |                            MAC eth0: 02:42:ac:0a:00:02
                           subnet1:  172.7.0.1
                           MAC eth0: 02:42:ac:0a:00:01
                           subnet2:  198.7.0.1
                           MAC eth1: 02:42:c6:0a:00:01
                           subnet1 <------> subnet2
                                 forwarding
```

Fiecare container execută la secțiunea command în `docker-compose.yml` un shell script prin care se configurează rutele. [Cient](https://github.com/retele-2023/proiect/blob/main/src/client.sh) și [server](https://github.com/retele-2023/proiect/blob/main/src/server.sh) setează ca default gateway pe router (anulând default gateway din docker). 

În plus, adaugă ca nameserver 8.8.8.8, dacă vreți să testați [DNS spoofing](https://networks.hypha.ro/capitolul6/#scapy_dns_spoofing). 

[Middle](https://github.com/retele-2023/proiect/blob/main/src/middle.sh) setează `ip_forwarding=1` și regula: `iptables -t nat -A POSTROUTING -j MASQUERADE` pentru a permite mesajelor care sunt [forwardate de el să iasă din rețeaua locală](https://askubuntu.com/questions/466445/what-is-masquerade-in-the-context-of-iptables). 


Rulati procesul de otrăvire a tabelei ARP din diagrama de mai sus pentru containerele `server` și `router` în mod constant, cu un time.sleep de câteva secunde pentru a nu face flood de pachete. (Hint: puteți folosi două [thread-uri](https://realpython.com/intro-to-python-threading/#starting-a-thread) pentru otrăvirea routerului și a serverului).


Pe lângă print-urile și mesajele de logging din programele voastre, rulați în containerul middle: `tcpdump -SntvXX -i any` iar pe `server` faceți un `wget http://old.fmi.unibuc.ro`. Dacă middle este capabil să vadă conținutul HTML din request-ul server-ului, înseamnă că atacul a reușit. Altfel încercați să curățați cache-ul ARP al serverului.

<a name="tcp"></a> 
## TCP Hijacking (2p)

Modificați `tcp_server.py` și `tcp_client.py` din repository `src` și rulați-le pe containerul `server`, respectiv `client` ca să-și trimită în continuu unul altuia mesaje random (generați text sau numere, ce vreți voi). Puteți folosi time.sleep de o secundă/două să nu facă flood. Folosiți soluția de la exercițiul anterior pentru a vă interpune în conversația dintre `client` și `server`.
După ce ați reușit atacul cu ARP spoofing și interceptați toate mesajele, modificați conținutul mesajelor trimise de către client și de către server și inserați voi un mesaj adițional în payload-ul de TCP. Dacă atacul a funcționat atât clientul cât și serverul afișează mesajul pe care l-ați inserat. Atacul acesta se numeșete [TCP hijacking](https://www.geeksforgeeks.org/session-hijacking/) pentru că atacatorul devine un [proxy](https://en.wikipedia.org/wiki/Proxy_server) pentru conexiunea TCP dintre client și server.


### Indicații de rezolvare

1. Puteți urmări exemplul din curs despre [Netfilter Queue](https://networks.hypha.ro/capitolul6/#scapy_nfqueue) pentru a pune mesajele care circulă pe rețeaua voastră într-o coadă ca să le procesați cu scapy.
2. Urmăriți exemplul [DNS Spoofing](https://networks.hypha.ro/capitolul6/#scapy_dns_spoofing) pentru a vedea cum puteți altera mesajele care urmează a fi redirecționate într-o coadă și pentru a le modifica payload-ul înainte de a le trimite (adică să modificați payload-ul înainte de a apela `packet.accept()`).
4. Verificați dacă pachetele trimise/primite au flag-ul PUSH setat. Are sens să alterați `SYN` sau `FIN`?
5. Țineți cont de lungimea mesajului pe care îl introduceți pentru ajusta `Sequence Number` (sau `Acknowledgement Number`?), dacă e necesar.
6. Încercați întâi să captați și să modificați mesajele de pe containerul router pentru a testa TCP hijacking apoi puteți combina exercițiul 1 cu metoda de hijacking.
7. Scrieți pe teams orice întrebări aveți, indiferent de cât de simple sau complicate vi se par.
