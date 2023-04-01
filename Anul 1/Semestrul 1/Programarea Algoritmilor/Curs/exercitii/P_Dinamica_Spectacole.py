f=open('fisier1.in')
ls=[]
m=[]
for linie in f:
    ls= linie.strip().split()
    m.append((int(ls[0]),int(ls[1]),int(ls[2])))
def cheie(x):
   return x[1] #sorteaza dupa timpul de terminare(merge si dupa timpul de inceput)

m=sorted(m,key=cheie)
n=len(m)
profit=[0 for x in range(n)]
predecesor=[-1 for x in range(n)]
for i in range(n):
    for j in range(0,i):
        if m[j][1] < m[i][0]:
            if profit[j] > profit[i]:
                profit[i]=profit[j]
                predecesor[i]=j
    profit[i]+=m[i][2]
maxim=-1
for i in range(n):
    if profit[i] > maxim:
        maxim=profit[i]
        poz_max=i
print(poz_max)
while poz_max != -1:
    print(m[poz_max][0],m[poz_max][1],m[poz_max][2],poz_max)
    poz_max=predecesor[poz_max]
