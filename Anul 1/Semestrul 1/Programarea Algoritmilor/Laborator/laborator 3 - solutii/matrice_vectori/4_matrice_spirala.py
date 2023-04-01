"""a) Să se genereze și afișeze o matrice de dimensiune NxN,
 cu elementele de la 1 la N*N - în ordine crescătoare, de la stânga la dreapta și de sus în jos.
b) Pentru a parcurge elementele matricei în spirală, pornind din colțul din stânga-sus
 (spre dreapta, în jos, spre stânga, în sus, …),
 să se obțină întâi o listă având elemente de tip tuplu (linie, coloană)
 care să reprezinte pozițiile care trebuie parcurse în această spirală.
c) Folosind lista de tupluri de mai sus, să se afișeze elementele din matrice aflate la acele poziții.
"""
N=5
a=[[i*N+j+1 for j in range(N)] for i in range(N)]
print(a)
y=0
a=[ [y:=y+1 for j in range(N)] for i in range(N)]
print(a)
for linie in a:
    for x in linie:
        print(f"{x:3}",end="")
    print()

ls=[]
for k in range((N+1)//2):
    ls.extend([(k,i) for i in range(k,N-k-1)])
    ls.extend([(i,N-k-1) for i in range(k,N-k)])
    ls.extend([(N-k-1,i) for i in range(N-k-2,k,-1)])
    ls.extend((i, k) for i in range(N - k - 1, k, -1))
print(ls)

for x,y in ls:
    print(a[x][y],end=" ")
