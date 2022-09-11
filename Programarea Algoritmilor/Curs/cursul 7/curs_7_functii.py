"""
def f(x,y): #antet - parametri formali
    corpul functiei
f(1,3) - apelul se face cu parametri actuali (efectivi)

O functie poate retura oricate valori, de orice tip
Daca nu returneaza nu nimic explict -returneaza None
ls=[35,1,6]
print(sorted(ls))
print(ls.sort())
Daca returneaza mai multe valori poate fi apelata folosind tuple assignment
"""
def f(x,y):
    return x+y,x*y,x-y #grupate ca tuplu

t = f(3,4)
print(t)
a,b,c = f(3,4)
print(a,b,c)
#suplimentar * pt impachetare/despachetare
a,*b = f(3,4)
print(a,b,type(b))

"""
O functie are mai multe tipuri de parametri: 
- obligatorii
- cu valoare implicita (default) - li se atribuie o valoare in antet, pot sa lipseasca la apel si atunci si atunci este folosita valoarea default
- numar variabili de parametri (parametru care grupeaza in el mai multe valori)
"""

"""
Parametri obligatori - le coresp obligatoriu param actuali la apelul functiei
La apel ei pot fi specificati 
-prin pozitie f(3,4)  - tb sa respecte ordinea din antet (si numarul)
-prin nume f(y=4,x=3) - nu este obligatoriu sa respecte ordinea
-si combinat, dar intai cei dai prin pozitie 
"""
def f(x,y,z):
    print(f"x={x},y={y},z={z}")

f(4,3,1)
f(z=10,x=3,y=1)
f(1,z=5,y=3)

ls = [7,8,1]
#f(ls) -eroare, parametrilor y si z nu le coresp valori la apel (param actuali)
f(*ls)
print(*ls)

#Suplimentar -
# putem forta ca parametri sa fie dati doar prin pozitie f(x,y,z,/) positional only arg
# sau doar prin nume f(*,x,y,z) keyword arg


"""
Parametri cu valoare default - li se atribuie in antet o valoare, 
pot sa nu primeasca valoare la apel si atunci se foloseste valoarea default
- se pun in antet dupa parametrii obligatorii
"""
def suma(x,y,val_init=0):
    return x+y+val_init
print(suma(3,4)) #parametrului val_init nu ii coresp o valoare la apel => este folosita valoarea default
print(suma(3,4,2))

"""
Numar variabil de parametri - un parametru prefixat cu * 
- aduna in el sub forma de tuplu un numar variabil de vaori date la apel
"""

def suma(*numere):
    print(numere,type(numere))
    s = 0
    for x in numere:
        s +=x
    return s
print(suma(1,5,7,8,4))
print(suma(3,4))

#functia poate avea si alti parametri - cei de dupa parametrul cu * tb sa fie apelati obligatoriu prin  nume
def suma(k,*numere,val_init):
    print(numere, type(numere))
    s = val_init
    for x in numere:
        s += k*x
    return s
#print(suma(2,1,5,7,8,4,100)) =>eroare, TypeError: suma() missing 1 required keyword-only argument: 'val_init'
print(suma(2,1,5,7,8,4,val_init=100))

def suma(k,*numere,val_init=0):
    print(numere, type(numere))
    s = val_init
    for x in numere:
        s += k*x
    return s
print(suma(2,1,5,7,8,4,100)) #- nu mai da eroare, dar 100 este inclus in numere si val_initi foloseste valaorea default
print(suma(2,1,5,7,8,4,val_init=100))

#TRANSMITEREA PARAMETRILOR
"""
prin atribuire (prin valoare referinta) - v.tabla
singurele modificari care se reflecta in exterior sunt cele ale valorii parametrilor actuali mutabili
"""
def modific(y):
    y = 12
    print(y)

x = 10
modific(x)
print(x)

def modific(y):
    y.append( 12)
    print(y)

x = [10,11]
modific(x)
print(x)

#VIZIBILITATE - var globala, var locala
"""
o variabila se creeaza cand i se atribuie prima data o valoare
in functie de spatiul unde i se atribuie prima data valaore => globala (in afara oricarei functii), locala (in functie)
la accesarea valorii unei variabile - variabila este cauta dupa regula LEGB (L - local, E - enclosing - daca functia in care am facut 
atribuirea este inclusa in alta functie, G- global, B-builtin
la atribuire (modificarea valorii) - var este cautata (implicit) doar in domeniul (spatiul) curent; daca nu exista se creeaza; 
                                   putem schima domeniul in care cauta variabila cu instructiunea global nume_var
"""
print("la accesare - cautare LEGB:")
def f():
    print(x) #LEGB
x=20
f()


print("la atribuire")
def f():
    y = 11 #creeaza o variabila locala, pt ca y nu exista in local
    print(y) #y din local
    print("y din global", globals()["y"])
y=20
f()
print(y)

print("la atribuire cu global")
def f():
    global y
    y = 11 #nu mai creeaza o variabila locala, modifica y din global
    print(y) #y din global

y=20
f()
print(y)

"""
#eroare - y este in local UnboundLocalError: local variable 'y' referenced before assignment
def f():
    print(y)
    y = 11
y=20
f()
print(y)
"""

#Functii recursive
def fact(n):
    if n==0:
        return 1
    return n*fact(n-1)
print(fact(10))
print(fact(900))
import sys
sys.setrecursionlimit(1010)
print(fact(1000))#RecursionError: maximum recursion depth exceeded in comparison




