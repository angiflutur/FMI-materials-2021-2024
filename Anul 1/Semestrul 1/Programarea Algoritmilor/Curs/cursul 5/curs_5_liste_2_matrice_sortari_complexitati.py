#LISTE - Partea 2
#MATRICE - lista de liste => tablouri multidim
#Citirea unei matrice de la tastatura, cu elementele unei linii date pe o linie separate prin spatiu
#in:
#2 3
#1 5 7
#7 10 12

"""

m,n=[int(x) for x in input().split()]

a=[]
for i in range(m):
    a.append([int(x) for x in input().split()]) #citim linia i
print(a)

a=[[int(x) for x in input().split()] for i in range(m)]
print(a)

for linie in a:
    for x in linie:
        print(f"{x:4}",end="")
    print()
"""

#Intializam o matrice cu 0 2x3
m=2
n=3
a=[[0 for i in range(n)] for j in range(m)]
print(a)
a[0][0]=3
print(a)
print("varianta 2")
a=[[0]*n]*m
print(a)
a[0][0]=3
print(a) #!!se modifica primul element de pe toate liniile

for linie in a:
    for x in linie:
        print(f"{x:4}",end="")
    print()

for i in range(m):
    for j in range(n):
        print(f"{a[i][j]:4}",end="")
    print()

#+operatori si functii uzuale:len,max,min, *,+, >, count, index
#complexitate - lista - intern vector
# l[i] => O(1)
#ad la sfarsit - O(1)
#adaugare la inceput - O(n)
# del l[0], insert(i,x) => O(n) - cu deplasari
