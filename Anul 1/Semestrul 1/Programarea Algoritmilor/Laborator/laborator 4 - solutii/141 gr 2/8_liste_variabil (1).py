"""
Scrieți o funcție care primește un număr întreg x și un număr variabil de liste nevide de numere întregi și returnează numărul de liste primite ca parametru care conțin x. Exemplu apel: 
nr = liste_x(3, [1, 5, 7], [3], [1, 8, 3], []) 
print(nr) 
b) Modificați funcția de la a astfel încât rezultatul să nu fie returnat, ci să se salveze în variabila globală rez. Exemplu apel: 
rez = None 
liste_x(3, [1, 5, 7], [3], [1, 8, 3], [4,3])
print(rez)
"""

def liste_x(x,*liste,y):
    print(liste,y) #tuplu
    
    nr=0 #creeaza o var nr in local
    for lista in liste:
        if x in lista:
            nr+=1
    return nr
     
def print_nr_global():
    print(nr) #la interogare - cauta in local, apoi global (LocalEnclosinbGlobalBuiltin)

nr = liste_x(3, [1, 5, 7], [3], [1, 8, 3], [],y="abc")  #y - doar pt exp, tb dat prin nume, ca si k de la random.choices
#print(nr) 
print_nr_global()



#v=[5,6,3]
#print(sorted(v))
#print(v.sort())

"""
def liste_x(x,*liste ):
    rez=0  #prima atribuire - creare in local a var rez (nu cauta decat in spatiul local in cazul atribuirii)
    for lista in liste:
        if x in lista:
            rez+=1
    #se va act doar rez din local, in main va afisa tot None

rez = None 
liste_x(3, [1, 5, 7], [3], [1, 8, 3], [4,3])
print(rez)
"""

def liste_x(x,*liste ):
    global rez #rez- din global
    rez=0  #actualizeaza var din global
    for lista in liste:
        if x in lista:
            rez+=1
     
rez = None 
liste_x(3, [1, 5, 7], [3], [1, 8, 3], [4,3])
print(rez)
