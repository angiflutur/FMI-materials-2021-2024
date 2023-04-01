f=open("traseu.in")
n,m=[int(x) for x in f.readline().split()]
t=[]
for linie in f:
    t.append([int(x) for x in linie.split()])
#t=[[int(x) for x in linie.split()] for linie in f]
print(t)
f.close()
#t=[[1, 2, 3,5], [1, 3, 2, 1], [1, 1, 1, 4 ]]
#n=len(t)
#m=len(t[0])

s=[[0 for i in range(m)] for j in range(n)]

#s[i][j]= traseul optim care incepe pe pozitia (i,j)
 

for i in range(n-1, -1, -1):
    for j in range(m-1, -1, -1):

        #s[i][j]=t[i][j]+max{s[i+1][j], s[i][j+1]}
        if (i==n-1) and (j==m-1):
            s[i][j]=t[i][j]
        elif i==n-1:
            s[i][j] = t[i][j]+ s[i][j+1]
        elif j==m-1:
            s[i][j] = t[i][j]+ s[i+1][j]
        else:
            s[i][j]=t[i][j]+max(s[i+1][j], s[i][j+1])

for i in range(0, n):
    for j in range(0, m):
        print(t[i][j], end=' ')
    print()
print()
for i in range(0, n):
    for j in range(0, m):
        print(s[i][j], end=' ')
    print()

#afisare traseu nerecursiv
i=0
j=0
while i != n and j != m:
    print(i+1, j+1)
    #aceleasi cazuri ca atunci cand am calculat s[i][j]
    if i==n-1:
        j+=1
    elif j==m-1:
        i+=1
    elif s[i+1][j]>s[i][j+1]:
        i += 1
    else:
        j += 1

#afisare traseu recursiv
def afis(i,j):
    if i != n and j != m:
        print(i+1, j+1)
        if i==n-1:
            afis(i,j+1)
        elif j==m-1:
            afis(i+1,j)
        elif s[i+1][j]>s[i][j+1]:
            afis(i+1,j)
        else:
            afis(i,j+1)
afis(0,0)
 



