"""3.	Se citesc un număr natural n și următoarele informații despre n elevi:
nume (fără spații), prenume (fără spații), grupa, o lista de note (numere naturale).
Informațiile despre fiecare student se dau pe linii separate:
6
Marineanu Maria 22 10 9 5
Zica Mariana 22 10 9 10 10
Mihaliu Dan 22 4 5 10 4
Alecu Dana 22 4 5 10 10
Aiton Ion 22 4 5 10 10
Podaru Ilie 21 10 10 8 8
a) Citiți datele despre studenți și memorați-le ca listă de tupluri.
"""
n=int(input())
studenti=[]
for i in range(n):
   ls= input().split(maxsplit=3)
   #print(ls)
   studenti.append([ls[0],ls[1],int(ls[2]),[int(x) for x in ls[3].split()]])
print(studenti)


"""
b) Adăugați la fiecare student situația sa școlară: promovat (True) sau nepromovat (False). Pentru a fi considerat promovat, un student trebuie să aibă toate notele mai mari sau egale cu 5.
"""
for i in range(n):
    if min(studenti[i][3])>=5:
        studenti[i].append(True)
    else:
        studenti[i].append(False)
print(studenti)
"""
c) Afișați studenții ordonați pe grupe crescător, iar în cadrul fiecărei grupe ordonați alfabetic.
"""
def grupe_nume(x):
    return x[2],x[0],x[1]
rez=sorted(studenti,key=grupe_nume)
print(rez)
"""
d) Afișați studenții ordonați pe grupe crescător, 
iar în cadrul fiecărei grupe se vor afișa întâi studenții promovați ordonați descrescător după medie (și în caz de egalitate după nume), apoi cei nepromovați ordonați  crescător după numărul de note mai mici decât 5 (de restanțe)  și în caz de egalitate după nume.
"""
def grupe_nume(x):
    if x[4]:
        return x[2],0,-sum(x[3])/len(x[3]),x[0],x[1]
    else:
        return x[2], 1, len([a for a in x[3] if a<5]), x[0], x[1]
rez=sorted(studenti,key=grupe_nume)
for student in rez:
    print(*student)

"""
e) Determinați studenții promovați cu  media maximă folosind funcția max care are și ea parametrul key
"""
def medie(x):
    return  sum(x[3])/len(x[3])
print("nota maxima",max(studenti,key=medie))