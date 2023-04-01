def citire():
    n=int(input())
    ls=[int(x) for x in input().split()]
    return n,ls

def mai_mare(s,x,i=0,j=None):
    if j is None:
        j=len(s)-1
    if i>len(s):
        i=len(s)
    for poz in range(i,j+1):
        if s[poz]>x:
            return poz
    return -1
#n,ls=citire()
print(mai_mare([5,7,8,12,9],7,3))
ls=[2,4,6,8,9,11]
n=len(ls)
for i in range(n-1):
    if mai_mare(ls,ls[i],i+1)!=i+1:
        print("NU")
        break
else:
    print("DA")
