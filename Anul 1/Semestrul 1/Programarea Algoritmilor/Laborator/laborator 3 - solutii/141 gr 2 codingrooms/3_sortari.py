"""
3.	Se citesc un număr natural n și următoarele informații despre n elevi: nume (fără spații), prenume (fără spații), grupa, o lista de note (numere naturale). Informațiile despre fiecare student se dau pe linii separate:
3
Marineanu Maria 22 10 10 10
Mihaliu Dan 22 4 5 10 10
Podaru Ilie 21 10 10 8 8
a) Citiți datele despre studenți și memorați-sub forma:
[['Marineanu', 'Maria', 22, [10, 9, 5]], ['Mihaliu', 'Dan', 22, [4, 5, 10, 10]], ['Podaru', 'Ilie', 21, [10, 10, 8, 8]]]
"""
#varianta 1 - cu maxsplit
n=int(input())
studenti=[]
for i in range(n):
    ls=input().split(maxsplit=3) #=>4 cuvinte
    #print(ls)
    lista_note=[int(x) for x in ls[3].split()]
    studenti.append([ls[0],ls[1],int(ls[2]),lista_note])
print(studenti)

"""
#varianta 2 - fara maxsplit
n=int(input())
studenti=[]
for i in range(n):
    ls=input().split() 
    lista_note=[int(x) for x in ls[3:]]
    studenti.append([ls[0],ls[1],int(ls[2]),lista_note])
print(studenti)
"""

"""
e) Determinați studenții cu media maximă folosind funcția max care are și ea parametrul key
"""
def cheie_maxim(elem): #0-nume, 1-prenume, 2-grupa, 3-lista de nota
    return sum(elem[3])/len(elem[3])

print(max(studenti,key=cheie_maxim))

