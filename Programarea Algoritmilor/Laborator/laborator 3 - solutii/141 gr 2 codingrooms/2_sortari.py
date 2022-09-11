"""
2.	Se citește un vector de numere naturale (cu elementele date pe o linie, separate prin spațiu). Să de ordoneze elementele din vector crescător după suma cifrelor, iar în caz de egalitate, descrescător după valorile lor 
v = [11, 45, 20, 810, 179, 81, 1000] => v = [1000, 20, 11, 810, 81, 45, 179]
"""
v = [11, 45, 20, 810, 179, 81, 1000]

#v.sort(reverse=True/False, key=functie) #modifica lista -doar pt liste
#sorted(v,reverse=True/False, key=functie) => returneaza o lista noua ordonata

def cheie(elem):
    #criteriu -suma cifrelor - 
    s=sum([int(cifra) for cifra in str(elem)])
    
    return s 

v.sort(key=cheie) 
print(v) #in cazul in care numerele au aceeasi suma a cifrelor se pastreaza ordinea din sirul initial


def cheie(elem):
    #primul criteriu -suma cifrelor -> primul element din tuplu
    s=sum([int(cifra) for cifra in str(elem)])
    #al doilea criteriu - valoarea crescator -> al doilea primul element din tuplu
    return s,elem

v.sort(key=cheie)
print(v)

def cheie(elem):
    #primul criteriu -suma cifrelor -> primul element din tuplu
    s=sum([int(cifra) for cifra in str(elem)])
    #al doilea criteriu - valoarea crescator -> al doilea primul element din tuplu
    return s,-elem

v.sort(key=cheie)
print(v)

