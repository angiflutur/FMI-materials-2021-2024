#SORTARI
#sorted(secventa) => o lista ordonata dupa criteriile specificate
#lista.sort() - doar pentr liste, modifica lista (returneaza None)
#sorted(ls,reverse=True/False,key=cheie de comparare) reverse implicit False -ordoneaza crescator
#ls.sort(reverse=True/False,key=cheie de comparare))

#daca nu specificam key -criteriu implicit <=:
ls=[[7,8], [2,3,12], [4,7], [4,5] ]
ls1 = sorted(ls)
print(ls) #nu s-a modificat
print(ls1)

#daca vrem sortare cu modificarea listei - ls.sort()
ls=[[7,8], [2,3,12], [4,7], [4,5] ]
ls.sort() #nu returneaza lista sortata, o modifica pe ls
print(ls)

ls=sorted("cuvant",reverse=True)
print(ls)

#criteriu propriu de comparare - key = functie
# unde functie are un singur parametru reprezantand un element din lista si returneaza
# cheia(Criteriul) dupa care se compara elementul cu celelalte

ls=["cuvant","xabc","cabc","altul"]
ls1=sorted(ls)
print(ls1)

#sortare dupa lungime
ls1=sorted(ls,key=len) #len(Sir) => lungimea
print(ls1) #sortare stabila - pentru elemente egale se pastreaza ordinea din sirul initial
#in acest caz len("xabc")=len("cabc") => "xabc" va fi inaintea lui "cabc" in sirul sortat,
#ca si in sirul initial

ls=["Cuvant","xabc","cabc","altul"]
ls1=sorted(ls,key=str.lower)
print(ls1)

#sortare dupa ultima litera

def cheie(x): #x un sir - un element din ls
    return x[-1]

ls=["Cuvant","xabc","cabc","altul"]
ls1=sorted(ls,key=cheie)
print(ls1)

"""
#suplimentar - lambda - functii fara nume
ls1=sorted(ls,key=lambda x:x[-1])
print(ls1)
"""

#sortare lista de tupluri cu 2 elemente - dupa suma elementelor cu modificarea listei
def cheie_suma(t):
    return t[0]+t[1]

ls=[(3,21),(5,7),(10,1),(5,8),(6,6)]

ls.sort(key=cheie_suma)
print(ls)

#Sortare dupa mai multe criterii

#functia de cheie va returna mai multe valori, grupate intr-un tuplu (sau lista)
#sortare lista de tupluri cu 2 elemente - dupa suma elementelor si in caz de egalitate dupa a doua componenta
def cheie_suma_2(t):
    #primul criteriu -suma t[0]+t[1]
    #al doilea criteriu - t[1]
    return (t[0]+t[1],t[1])

ls=[(3,21),(5,7),(10,1),(5,8),(6,6)]
ls.sort(key=cheie_suma_2)
print(ls)

#exp - lista cu elemente de tipul (grupa,nume,nota)
# sortare - crescator dupa grupa, in cadrul grupei descresc dupa nota, in caz de egalitate, dupa nume

def grupe(x): #x[0]=grupa, x[1]=nume, x[2]=nota
    return (x[0], -x[2], x[1]) #putem sa nu punem ()

ls=[(2,"Popa",9), (1,"Ioana", 7), (1,"Ion", 10), (2,"Ana",9), (1,"Matei",10), (1,"Dana",8)]
ls.sort(key=grupe)
print(ls)

