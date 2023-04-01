n=int(input())
triunghi=[[0 for i in range(j+1)] for j in range(n)]

for i in range(n):
    triunghi[i][0]=triunghi[i][-1]=1 #primul si ultimul element sunt 1

for i in range(2,n):
    lung = len(triunghi[i])
    for j in range(1,lung-1):
        triunghi[i][j] = triunghi[i-1][j] +triunghi[i-1][j-1]

print(triunghi)
nr_max=triunghi[n-1][(n-1)//2] #valoarea maxima=mijlocul ultimei linii
nr_cifre=len(str(nr_max))+1

for linie in triunghi:
    for x in linie: print(f"{x:{nr_cifre}}",end="",sep="") #!!!woooow
    print()
for linie in triunghi:
    ls=[f"{x:{nr_cifre}}" for x in linie]
    print("".join(ls))
ls="\n".join(["".join([f"{x:{nr_cifre}}" for x in linie]) for linie in triunghi])

