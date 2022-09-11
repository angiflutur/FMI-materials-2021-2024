f=open("traseu.in")
n,m=[int(x) for x in f.readline().split()]
matrix=[]
for linie in f:
    matrix.append([int(x) for x in linie.split()])
#t=[[int(x) for x in linie.split()] for linie in f]
print(matrix)
f.close()
smatrix=[[None for i in range(m)] for j in range(n)]
traseu=[]
def smax(i,j):
    ret=0
    if i>=n or j>=m or i<0 or j<0:
         ret=0
    elif smatrix[i][j] !=None: #daca subpb e deja calculata - nu mai apelez recursiv
        ret=smatrix[i][j]
    else:
        smatrix[i][j]=matrix[i][j]+max(smax(i,j+1),smax(i+1,j))
        ret=smatrix[i][j]
   
    
    return ret        

print(smax(0,0))
print(smatrix)

def traseu(i,j):
    if i>=n or j>=m or i<0 or j<0:
        return 0
    print(i+1,j+1)
    if j+1< m and i+1<n and smatrix[i][j+1]>smatrix[i+1][j]:
            traseu(i,j+1)
    elif  i+1<n:
        traseu(i+1,j)
    else:
        traseu(i,j+1)
print("traseu")
traseu(0,0)



