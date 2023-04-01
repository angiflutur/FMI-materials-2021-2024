n,m=[int(x) for x in input("dimensiuni:").split()]

a=[[int(x) for x in input().split()] for i in range(n)]
print(a)

trans=[[a[i][j] for i in range(n)] for j in range(m)]
print(trans)

trans=[[linie[j] for linie in a] for j in range(m)]
print(trans)