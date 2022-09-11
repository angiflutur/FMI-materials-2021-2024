"""O metodă simplă(dar nesigură!!!) de criptare a unui text o reprezintă cifrul lui Cezar,
prin care fiecare literă dintr - un text dat este înlocuită cu litera aflată peste 𝑘 poziții
la dreapta în alfabet în mod circular.
Valoarea 𝑘 reprezintă cheia secretă comună pe care trebuie să o cunoască atât expeditorul,
cât și destinatarul mesajului criptat.
Decriptarea unui text constă în înlocuirea fiecărei litere din textul criptat cu litera
aflată peste 𝑘 poziții la stânga în alfabet în mod circular.
Scrieți un program care să realizeze criptarea sau decriptarea unui text folosind cifrul lui Cezar.
Indicație de rezolvare: se va utiliza formula
𝑒𝑘(𝑥) = (𝑥 + 𝑘) mod 26 pentru criptarea unui caracter 𝑥 folosind cheia secretă 𝑘,
respectiv formula
𝑑𝑘(𝑥) = (𝑥 − 𝑘)mod 26 pentru decriptare.
De asemenea, se vor utiliza funcțiile ord și chr pentru manipularea caracterelor."""

#CRIPTAREA


#Varianta 1 - parcurg caracter cu caracter sirul si aplic trasnformarea pentru fiecare litera
#caracterele rezultate le memoram intr-o lista, pe care o transformam in final in sir folosind join
#!!nu putem modifica direct sirul s cu atribuiri de genul s[i]=transforma(s[i])
s=input()
s1=s
k=int(input())
ls=[]
nr_litere=ord('z')-ord('a')+1
for x in s:
    if x.isalpha():
        c=(ord(x)-ord('a')+k)%nr_litere #a cata litera este dupa mutare cu k pozitii la dreapta
        ls.append(chr(c+ord('a'))) #litera a c-a din alfabet
    else:
        ls.append(x)
s="".join(ls)
print(s)

#Varianta 1 cu comprehensiune #!!!!!PRESUPUNEM DOAR LITERE MICI - tema pt orice litere
s=s1
ls=[chr(ord('a')+(ord(x)-ord('a')+k)%nr_litere) if x.isalpha() else x for x in s ]
s="".join(ls)
print(s)

#Varianta 2 - folosind maketrans
#cream un tabel de inlocuri pentru fiecare litera din alfabet

import string
s=s1
#avem mai multe variante de a crea o lista cu literele mici din alfabet:

litere_mici=[chr(x+ord('a')) for x in range(nr_litere)]
print(litere_mici)

litere_mici = [chr(x) for x in range(ord('a'), ord('z') + 1)]
print(litere_mici)

litere_mici = list(string.ascii_lowercase) #este str, o puteam folosi direct
print(litere_mici)

#cream o lista cu literele translatate cu k la dreapta
litere_mici_transf=[chr(ord('a')+(ord(x)-ord('a')+k)%nr_litere)  for x in litere_mici]
print(litere_mici_transf)

#folosim maketrans pentru crearea tabelului de inlocuire litere_mici->Litere_mici_transf
tabel=str.maketrans("".join(litere_mici),"".join(litere_mici_transf))
s=s.translate(tabel)
print(s)

#DECRIPTAREA - cu -k in oricare dintre variante
ls=[chr(ord('a')+(ord(x)-ord('a')-k)%nr_litere) if x.isalpha() else x for x in s ]
s="".join(ls)
print(s)
