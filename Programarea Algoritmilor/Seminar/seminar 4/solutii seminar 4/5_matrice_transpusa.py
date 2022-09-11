import random
def afis(a,g):
    for linie in a:
        str_linie=" ".join([f'{x:4} ' for x in linie])
        g.write(str_linie)
        g.write("\n")

f=open("matrice.in","w")
n,m=(int(x) for x in input().split())
f.write(f'{n} {m}\n')
for i in range(n):
    for j in range(m):
        x=random.randint(1,100)
        f.write(f'{x} ')
    f.write('\n')
f.close()
f=open("matrice.in")
n,m=(int(x) for x in f.readline().split())

a=[[int(x) for x in linie.split()] for linie in f]
"""a=[]
for linie in f:
    a.append([int(x) for x in linie.split()])"""
print(a)

#ordonare dupa ultima coloana
aord = sorted(a,key=lambda linie:linie[-1])
g=open("matrice.out","w")
afis(aord,g)
transpusa=[[linie[j] for linie in a] for j in range(m)]
transpusa=[[a[i][j] for i in range(n)] for j in range(m)]
afis(transpusa,g)
