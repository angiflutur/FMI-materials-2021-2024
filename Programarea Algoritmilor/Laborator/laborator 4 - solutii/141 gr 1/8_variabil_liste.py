"""
Scrieți o funcție care primește un număr întreg x și un număr variabil de liste nevide de numere întregi și returnează numărul de liste primite ca parametru care conțin x. Exemplu apel: 
nr = liste_x(3, [1, 5, 7], [3], [1, 8, 3], []) 
print(nr) 
b) Modificați funcția de la a astfel încât rezultatul să nu fie returnat, ci să se salveze în variabila globală rez. Exemplu apel: 
rez = None 
liste_x(3, [1, 5, 7], [3], [1, 8, 3], [4,3])
print(rez)
"""
def liste_x(x,*liste):
    #print(liste)
    nr = 0 #atribuire - se uita in local, si daca nu exista o creeaza => nr in local
    for ls in liste:
        if x in ls:
            nr+=1
    return nr


nr = liste_x(3, [1, 5, 7], [3], [1, 8, 3], []) 
print(nr)

def liste_x_rez(x,*liste):
    global rez
    rez = 0 #atribuire - se uita in global, nu in local, pt ca am specificat global x
    for ls in liste:
        if x in ls:
            rez+=1

def scrie():
    print("rez=",rez) #la interogare il cauta Local,Enclosing (fct in fct), Global, Builtin

rez = None 
liste_x_rez(3, [1, 5, 7], [3], [1, 8, 3], [4,3])
scrie()


"""
#Recapitulare:
ls=[5,3,6,2] 
print(sorted(ls)) #returneaza lista
print(ls.sort()) #returneaza None
"""

def f(*numere):
    print(numere)
f(1,3,4,9)
ls=[1,3,4,9]
f(ls)
f(*ls)
