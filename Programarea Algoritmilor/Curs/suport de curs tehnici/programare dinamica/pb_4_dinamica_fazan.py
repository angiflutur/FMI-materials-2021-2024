f=open("date.in")
sir=f.readline().split()
f.close()
print(sir)

n=len(sir)
lung=[0 for i in range(n)]
succ=[-1 for i in range(n)]

lung[n-1]=1
for i in range(n-2,-1,-1): #i=n-2,n-3,...,0
    lung[i]=1
    for j in range(i+1,n):#cuvintele de dupa i care se potrivesc cu cuvantul i
        if sir[i][-2:] == sir[j][:2]:
            if 1+lung[j]>lung[i]:
                lung[i]=1+lung[j]
                succ[i]=j
print(lung)
print(succ)

#det poz maximului din vectorul lung
poz_max=0
for i in range(1,n):
    if lung[i]>lung[poz_max]:
        poz_max=i
print("lungimea maxima subir fazan: ",lung[poz_max])
while poz_max!=-1:
    print(sir[poz_max],end=" ")
    poz_max=succ[poz_max]