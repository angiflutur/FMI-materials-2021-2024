""""
#Verificati daca 2 fisiere sunt anagrame(au aceleasi caracatere in afara de caracterele de end line)
def citire_fisier (nume_fisier):
    f=open(nume_fisier)
    d={}
    for linie in f:
        for caracter in linie.rstrip('\n'):
            d[caracter]=d.get(caracter,0)+1
    f.close
    return d
d1=citire_fisier("fisier1.in")
d2=citire_fisier("fisier2.in")
print(d1==d2)
"""

#Se dau 2 fiesere. Afisati intr-un al 3 lea fisier acele linii
# "i" din primul fisier, care sunt anagrame ale liniei "i" corespunzatoare din cel de-al doilea fisier.

def prelucare_linie(linie):
    d={}
    for caracter in linie.rstrip('\n'):
        d[caracter]=d.get(caracter,0)+1
    return d
f1=open("fisier1.in")
f2=open("fisier2.in")
g=open("fisier3.out","w")
linie1=f1.readline()
linie2=f2.readline()
while (linie1!="") and (linie2!=""):
    if prelucare_linie(linie1) == prelucare_linie(linie2):
        g.write(linie1)
       #g.write("\n")
    linie1=f1.readline()
    linie2=f2.readline()
f1.close()
f2.close()
g.close()
