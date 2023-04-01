# Jurnalul electronic al Anei conține, în fiecare zi, câte o frază cu informații despre cheltuielile
# pe care ea le-a efectuat în ziua respectivă. Scrieți un program care să citească o frază de acest tip
# din jurnalul Anei și apoi să afișeze suma totală cheltuită de ea în ziua respectivă.
# De exemplu, pentru fraza “Astăzi am cumpărat pâine de 5 RON, pe lapte am dat 10 RON,
# iar de 15 RON am cumpărat niște cașcaval. De asemenea, mi-am cumpărat și niște papuci cu 50 RON!”,
# programul trebuie să afișeze suma totală de 80 RON.
# Fraza se consideră corectă, adică toate numerele care apar în ea sunt numere naturale reprezentând
# sume cheltuite de Ana în ziua respectivă!

s = "Astăzi am cumpărat pâine de 5 RON, pe lapte am dat 4 100 RON, iar de 15 12 RON am cumpărat niște cașcaval. De asemenea, mi-am cumpărat și niște papuci cu 50 RON!"
cs=s
# Varianta 1 - parcurgem sirul litera cu litera si formam numere cu cifre alaturate
l = []
i = 0
suma = 0
while i < len(s):
    if s[i].isnumeric():
        nr = int(s[i])
        i += 1
        while (i < len(s)) and s[i].isnumeric():
            # nr = nr*10+ord(s[i]) - ord('0')
            nr = nr * 10 + int(s[i])

            i += 1
        i = i + 1
        
        suma = suma + nr
    else:
        i = i + 1

print(suma)

#Varianta 2 - inlocuim separatorii cu spatiu, folsim split, apoi int pe cei numerici
s=s.translate(str.maketrans(",.!;:","     "))
ls=[int(x) for x in s.split() if x.isnumeric()]
print(sum(ls))


#SUPLIMENTAR
# Varianta   - construim sirul in care pastram doar cifre si spatii
# -merge doar daca numerele sunt incadrate de spatii
s = [x if x.isdigit() or x == " " else "" for x in s]
s="".join(s)
#print(sum(map(int,s.split())))
print(sum([int(x) for x in s.split()]))

#Varianta  - cu expresii regulate, consideram separatori orice nu este cifra 
#\DMatches any character other than a decimal digit.
import re
s=cs
lista_numere = re.split("\D+",s) #intoarce si un cuvant vid la inceput si sfarsit, incepe cu separator
#print(sum(map(int,filter(lambda x: len(x)>0,lista_numere))))
print(sum([int(x) for x in lista_numere if len(x)>0]))