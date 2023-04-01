n,m=[int(x) for x in input("dimensiuni:").split()]

a=[[int(x) for x in input().split()] for i in range(n)]
print(a)

trans=[[a[i][j] for i in range(n)] for j in range(m)]
print(trans)

trans=[[linie[j] for linie in a] for j in range(m)]
print(trans)

"""

#transpusa
t=[[0 for j in range(m)] for i in range(n)]
for i in range(n):
    for j in range(m):
        t[i][j]=a[j][i]

print(t)

t=[]
for i in range(n):
    ls=[]
    for linie in a:
        ls.append(linie[i])
    t.append(ls)
print(t)

t=[]
for i in range(n):
    t.append([linie[i] for linie in a])
print(t)

t=[[linie[i] for linie in a] for i in range(n)]
"""