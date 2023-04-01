"""3.	a) Scrieți o funcție generică de căutare având următorul antet:
cautare(x, L, cmpValori)
Funcția trebuie să returneze indexul ultimei apariții a valorii x în lista L sau None dacă valoarea x nu se găsește în listă.
Funcția comparator cmpValori se consideră că returnează True dacă valorile aflate la indecșii primiți ca parametrii sunt egale sau
False în caz contrar.
Spre exemplu, dacă avem o listă de tupluri ls=[(1,3),(4,5),(4,8),(5,1)] si dorim sa cautam daca exista in lista
b) Scrieți o funcție care să afișeze, folosind apeluri utile ale funcției cautare, mesajul DA în cazul în care o listă L formată din n numere întregi este palindrom sau mesajul NU în caz contrar. O listă este palindrom dacă prin parcurgerea sa de la dreapta la stânga se obține aceeași listă.
De exemplu, lista L=[101,17,101,13,5,13,101,17,101] este palindrom."""


def cautare(x,L,cmpValori):
    for i in range(len(L)-1,-1,-1):
        if cmpValori(L[i],x):
            return i

def cmpTuplu(t1,t2):
    if (t1==t2) or (t1[::-1]==t2):
        return True
    return False

l_pairs=[(3,4),(1,3),(7,8),(3,1),(4,7)]
print(cautare((1,3),l_pairs,cmpTuplu))

def cmpModul(x,y):
    return abs(x)==abs(y)
def modul_palindrom(L):
    n=len(L)
    for i in range(n//2):
        print(i)
        #print("*",cautare(L[i],L[:n-i],cmpModul),i,n-1-i)
        if cautare(L[i],L[:n-i],cmpModul)!=n-1-i:
            return False
    return True
L=[101,17,-101,13,5,-13,101,17,-101]
print(modul_palindrom(L))
