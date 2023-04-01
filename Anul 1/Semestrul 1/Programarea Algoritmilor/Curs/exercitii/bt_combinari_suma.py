def back(k):
    if k==n:
        if sum(x[:n])==s:
            print(*x)
    else:
        if k==0:
            start=1
            stop=9
        else:
            start=0
            stop=x[k-1]
        for i in range(start, stop+1):
            x[k] = i
            if sum(x[:k+1])<=s:
                back(k + 1) 

s=10
n=3
x=[0 for i in range(n)]
back(0)