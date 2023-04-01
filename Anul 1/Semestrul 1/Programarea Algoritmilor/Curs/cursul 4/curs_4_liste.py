#LISTE - clasa List

#memorare -array - accesari O(1), stergeri, inserari - cu deplasare

#CREARE:

ls = [2, 4, 5]
ls = [1, "ab"] #pot fi neomogene - cu elemente de tipuri diferite
#ls = [ls1=[1,2], ls2=[3,4]] #imbricate
ls = [[1,2], [3,4]] #imbricate

#ls = [ls1:=[1,2], ls2:=[3,4]] #imbricate + atribuire in expresii
#print(ls1,ls2)

#cu ajutorul metodei list(iterabil)
ls = list("abc")
print(ls) #lista de litere

#lista vida
ls=[]
ls=list()

#Secvente de initializare (comprehensiune: list comprehension)

#[expresie for x in iterabil]

#1. crearea unui vector cu toate elementele 0
ls = [0 for i in range(10)]
"""
ls=[]
for i in range(10):
    #ls + = [0]
    ls.append(0)
"""
print(ls)

#2. lista primelor 10 patrate perfecte
ls = [i*i for i in range(10)]
print(ls)

#3. citirea unui vector de numere intregi cu elementele date pe o linie separate cu spatiu
ls1 = input("dati vectorul ").split() #lista cu numerele date, dar de tip str
print(ls1)
ls1= [int(x) for x in ls1]
print(ls1)

#sintaxa condensata:
ls = [int(x) for x in input("dati vectorul ").split()]
print(ls)

#comprehensiune conditionata - cu if dupa for:
#[expresie for x in iterabil if conditie]

#functionare:
"""
ls=[]
for x in iterabil:
    if conditie:
        ls.append(expresie)
"""

#1. filtrarea elementelor unei lsite dupa un criteriu - exp: elemente pozitive, cuvinte care incep cu o vocala...
ls = [3, -2, 7, -10, 8]
ls_pozitive=[x for x in ls if x>0]
print(ls_pozitive)

#afisarea elementor pozitive citite de pe o linie:
ls = [int(x) for x in input("dati numerele ").split() if int(x)>0]
"""
ls=[] 
for x in input("dati numerele ").split():
    if int(x)>0:
        ls.append(int(x))
"""

#ls = [y for x in input("dati numerele ").split() if (y:=int(x))>0]

"""
ls=[] 
for x in input("dati numerele ").split():
    if (y:=int(x))>0:
        ls.append(int(x))
"""
print(f"lista numerelor pozitive introduse {ls}")

#intersectia a doua liste
ls1 = [3, 5, 1, 8, 10]
ls2 = [7, 10, 20, 1]
ls_intersectie = [x for x in ls1 if x in ls2]
print(ls_intersectie)

#inlocuirea unor elemente cu altele - folosind operatorul if..else:

ls = [3, -2, 7, -10, 8]
ls = [x if x>0 else 0 for x in ls] #inlocuim cu 0 elementele negative
print(ls)

#pot fi mai multe for-uri in secv de intializare
ls=[(x,y) for x in range(1,5) for y in range(1,5) if x!=y]
print(ls)

#ACCESARE, MODIFICARE
#ls[i] - timp constant , feliere ls[i:j], ls[i:j:k]
#putem modifica lista prin atribuiri de genul:
#ls[i] = x
#ls[i:j]=iterabil
#ls[i:j:k]=iterabil (cu acelasi numar de elemente)

ls=[2,4,8,1,5,2,7,8]
i=3
#actualizarea elementului de pe pozitia i:
ls[i] = 15
print(ls)
#actualizarea unei subsecvente
ls[3:6] = [0,0,0,0,0] #nu tb neaparat sa aiba aceeasi lungime
print(ls)
ls[1:6:2] = [-1,-2,-3] #aceeasi lungime
print(ls)
#stergerea elementului de pe pozitia i:
ls[i:i+1]=[]
print(ls)
ls[i]=[] #nu sterge, inlocuieste elementul de pe pozitia i cu []
print(ls)
#alternativa
del ls[i]
print(ls)
#adaugare la finalul listei
ls[len(ls):]=[20,40]
print(ls)

#stergerea unei subsecvente se poate face si cu del:
del ls[3:6]
print(ls)

ls[0:3]="abcnbnbmnbm" #itereaza prin sir element cu element
print(ls)

#Metode pentru actualizarea listei:
#ls.append(element) - adauga un element la finalul listei
#ls.extend(iterabil) - adauga elementele unui iterabil la sfarsitului listei +=
# !!! de preferat ls.extend(ls1) in loc de ls = ls +ls1 (creeaza un obiect nou + copiere)
#ls.insert(i,x) - insereaza elementul x pe pozitia i
#ls.pop(i) - sterge elementul de pe pozitia i si il returneaza; daca nu este dat i, implicit i este -1, deci sterge ultimul element
#ls.remove(x) - sterge prima aparitie in lista a elementului x, ValueError daca nu exista
#ls.clear()
ls=[3,1]
ls.append(10)
ls.append("abc") #un singur element
ls.extend("xyz")
print(ls)
ls.insert(2,"el nou")
print(ls)
print(f"am eliminat ultimul element {ls.pop()} si am obtinut lista {ls}")
i=2
print(f"am eliminat elementul de pe pozitia {i} care era {ls.pop(i)} si am obtinut lista {ls}")
print(ls)

x=111
try:
    ls.remove(x)
    print(ls)
except:
    print("nu exista")

x=1
try:
    ls.remove(x)
    print(ls)
except:
    print("nu exista")

#copierea - ls.copy()  copiere superficiala (se copiaza doar referintele, nu valorile recursiv))
ls=[1,3,4,5]
ls1=ls #- nu copiaza, ls si ls1 vor referi acelasi obiect
ls1[0]=897
print(ls1)
print(ls)

ls=[1,3,4,5]
ls1=ls.copy()
ls1[0]=897
print(ls1)
print(ls)

ls = [[1,2],[3,4]]
ls1=ls.copy()
ls1[0][0]=89 #modificarea valorii obiectului de la adresa ls1[0] care este aceeasi cu ls[0]
print(ls)
print(ls1)

ls = [[1,2],[3,4]]
ls1=ls.copy()
ls1[0]=[7,8] #modificarea referintei ls1[0]
print(ls)
print(ls1)

#modulul copy functia deepcopy(ls)
import copy
ls = [[1,2],[3,4]]
ls1=copy.deepcopy(ls)
ls1[0][0]=89
print(ls)
print(ls1)

#-------------curs5
#obs: si la adaugare -copiere superficiala
ls=[3,4]
ls1=[5]
ls1.append(ls)
print(ls1)
ls1[1].append(12)
print(ls1)
print(ls)
