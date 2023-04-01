#reprezentam solutia x0,...,xn-1 si fiecare xk ia valori 1...n
#cond de continuare - xk sa fie diferit de x0,..,xk-1

def back(k):
    if k==n:
        print(*x)
    else:
        #luam pe rand valorile posibile pt xk:
        for i in range(1,n+1):
            x[k]=i
            #test x[k] nu este printre x[0],...,x[k-1]
            if x[k] not in x[:k]: #test "manual" - cu for(0,k) sua cu index(x[k],0,k)
                back(k+1)



n=int(input())
x=[0 for i in range(n)]
back(0)