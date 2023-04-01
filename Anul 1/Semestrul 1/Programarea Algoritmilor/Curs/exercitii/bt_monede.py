v=[1,5,10]
n=len(v)
x=[0 for i in range(n)]
s=20
def back(k):
    if k==n:
        if sum( [x[i]*v[i]  for i in range(n) ])==s:
            print(*x)
    else:
        for i in range(s//v[k]+1):
            x[k]=i
            if sum( [x[i]*v[i]  for i in range(k+1) ])<=s:
                print(*x[:k+1])
                back(k+1)
back(0)





            
        