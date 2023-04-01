n=20
m=[[0 for x in range(j+1)] for j in range(n) ]
#print(m)
m[0][0]=1
m[1][0]=1
m[1][1]=1
for linie in range(2,n):
    m[linie][0]=1
    for j in range(1,linie):
        m[linie][j]=m[linie-1][j]+m[linie-1][j-1]
    m[linie][-1]=1
max=m[n-1][(n-1)//2]
nr=len(str(max))+1
for linie in m:
    for x in linie:
        print(f"{x:{nr}}",end='',sep='')
    print()
