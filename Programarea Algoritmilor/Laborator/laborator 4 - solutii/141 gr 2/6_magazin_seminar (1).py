"""Magazin 123 magazin1
5 mere
7 pere
2 prune
Magazin 221 magazin 2
3.5 pere
10 banane

d[123][pere]

d={123:[(5,mere),(7,pere),(2,prune)]} magazinul 123, pere d[123] => caut pere in lista

d={123:("magazin1", {mere:5,pere:7,prune:2})} magazinul 123, pere d[123][pere] banane in d[123]
t=(3,[4,5])
t[1].append(6)
t[1]=[3,5,7]
"""
def actualizare(d, cod, nume, cantitate):
    try:
        if cantitate<=d[cod][1][nume]:
            d[cod][1][nume]-=cantitate
            if d[cod][1][nume]==0:
                del d[cod][1][nume]
        else:
            return False
    except:
        return False
def citire():

    d={}
    f = open('produse.in')
    for linie in f:
        if linie[0]=='M':
            magazin={}
            linie=linie.split(maxsplit=2)
            cod=int(linie[1])
            nume=linie[2].rstrip('\n')
            d[cod]=(nume,{}) #d[cod]=(nume,[])
        else:
            linie=linie.split()
            cantitate=float(linie[0])
            numeProdus=linie[1]
            d[cod][1][numeProdus]=cantitate #d[cod][1].append((numeProdus,cantitate))
    f.close()
    return d
 
d=citire()
actualizare(d, 123, 'pere', 3)
print(d)
"""
actualizare(d, 123, 'pere', 4)
print(d)
print(actualizare(d, 123, 'pere', 4))
"""

multime=set()
for magazin in d:
    #print(d[magazin][1].keys())
    #print(d[magazin][1].values())
    multime|=d[magazin][1].keys() #| operatorul de reuniune, & intersectie
print(multime)

#b) - tema
