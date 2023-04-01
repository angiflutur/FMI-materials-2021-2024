n=int(input())
e_prim=[True]*(n+1)
e_prim[0]=e_prim[1]=False
ls=[]
for i in range(2,n+1):
    if e_prim[i]:
        ls.append(i)
        for j in range(2*i,n+1,i):
            e_prim[j]=False

print(ls)
