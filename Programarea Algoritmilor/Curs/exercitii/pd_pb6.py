from tkinter import N


m=10
v=[0,1,4,5,6]
a=[[0 for i in range(m+1)]for j in range( len(v))]
print(a)
a[0][0]=1
for i in range(1,len(v)):
    for j in range(m+1):
        a[i][j]=a[i-1][j]    #cazul in care nu luam v[i] pt a obtine suma j
        if v[i]<=j and  a[i-1][j-v[i]]:
           a[i][j]=1
print(a)
n=len(v)-1 #am inserat un 0 la inceputul lui v
if a[n][m]==1:
    print("Se poate")
i=n
j=m

while(i>0 and j>0):
    if a[i][j]==a[i-1][j]:
        i-=1
    else:
        print(v[i])
        j-=v[i]
        i-=1




