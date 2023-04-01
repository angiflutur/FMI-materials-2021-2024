"""Se citesc un număr natural n și următoarele informații despre n elevi: nume (fără spații), prenume (fără spații), grupa, o lista de note (numere naturale). Informațiile despre fiecare student se dau pe linii separate: 
3 
Marineanu Maria 22 10 9 5 
Mihaliu Dan 22 4 5 10 10 
Podaru Ilie 21 10 10 8 8 
a) Citiți datele despre studenți și memorați-sub forma: [['Marineanu', 'Maria', 22, [10, 9, 5]], ['Mihaliu', 'Dan', 22, [4, 5, 10, 10]], ['Podaru', 'Ilie', 21, [10, 10, 8, 8]]]
"""
"""
n=int(input())
studenti=[]
for i in range(n):
    ls=input().split() #=> ['Marineanu', 'Maria', '22', '10', '9', '5'] 
    note=[int(x) for x in ls[3:]]
    studenti.append([ls[0],ls[1],int(ls[2]),note])
print(studenti)
"""
n=int(input())
studenti=[]
for i in range(n):
    ls=input().split(maxsplit=3) #=> ['Marineanu', 'Maria', '22', '10 9 5'] 
    note=[int(x) for x in ls[3].split()]
    studenti.append([ls[0],ls[1],int(ls[2]),note])
print(studenti)
#e)Studentii cu media maxima
#Determinați studenții cu media maximă folosind funcția max care are și ea parametrul key
def medie(x):
    return sum(x[3])/len(x[3])
print(max(studenti,key=medie))

