import copy
E=set()
Q=set()
S=set()
F=set()

l={'Sigma:','States:','#','Transitions:','End'}
f=open('dfa_minimization.in')
for line in f:
    line=line.split(',')
    line=" ".join(line)
    line=set(line.rstrip().split())
    if line.intersection(l)==set():
        for x in line:
            if x.isnumeric()==False and len(line)==1:
                E.update(x)        #adaugam literele alfabetului
            elif x.isnumeric()==True:
                x=int(x)
                Q.add(x)          #adaugam starile automatului
                if len(line)>1 and 'S' in line:
                    S.add(x)
                elif len(line)>1 and 'F' in line:
                    F.add(x)
print(E)
print(Q)
print(S)
print(F)
f.close()
stari = len(Q)

L=[[0 for i in range(len(E))] for j in range(len(Q))]
f=open('dfa_minimization.in')
for line in f:
        line=line.split(',')
        line=" ".join(line)
        line=line.rstrip().split()
        if set(line).intersection(l)==set():
            if len(line)==3:
                x=int(line[0])
                z=int(line[2])
                e=list(E)
                for i in range(len(e)):
                    if e[i]==line[1]:
                        y=i
                L[x][y]=z
f.close()

print("Lista de adiacenta este:")
for line in L:
    print('  '.join(map(str, line)))

m = [[0 for i in range(len(Q))] for j in range(len(Q))]

for i in range(len(Q)):                 #matricea completata cu 1 sau 0
    for j in range(len(Q)):
        if j <= i-1:
            if (i in F) ^ (j in F) == True:
                 m[i][j] = 1
            else:
                 m[i][j] = 0
        else:
            m[i][j] = []
print("Matrice completata cu 1 sau 0 este:")
for line in m:
    print('  '.join(map(str, line)))

ok = 1
while (ok != 0):                        #extindem pe 1 in matrice
    ok = 0
    for i in range(1,len(Q)):
        for j in range(len(Q)-1):
            if j <= i - 1:
                k = 0
                if m[i][j] == 0:
                    while (k != len(E)):
                        if m[L[j][k]][L[i][k]] == 1 or m[L[i][k]][L[j][k]] == 1:
                            m[i][j] = 1
                            ok = 1
                        k = k+1

print("Matricea extinsa cu 1 este:")
for line in m:
    print('  '.join(map(str, line)))

U = set()
u = []  #lista de perechi nemarcate
for i in range(1,len(Q)):
    for j in range(len(Q)-1):
        if j <= i - 1:
            if m[i][j] == 0:
                u.append(list((i,j)))
                U.add(i)
print("Perechile nemarcate sunt:")
print(u)

Q = Q.difference(U)

for i in range(len(L)):
    for j in range(len(E)):
        if L[i][j] not in Q:
            for p in range(len(u)):
                if u[p][0] == L[i][j]:
                    L[i][j] = u[p][1]

Lm = copy.deepcopy(L)
for i in range(len(u)):
    j = 0
    del Lm[u[i][j]]
print()
print("DFA minimizat este:")
print("Sigma:")
for x in E:
    print(x)
print("End")

print("States:")
for x in Q:
    if x in S:
        print(f"{x},S")
    elif x in F:
        print(f"{x},F")
    else:
        print(x)
print("End")

Q = list(Q)
E = list(E)
print("Transitions:")
for i in range(len(Q)):
    b = 0
    for j in range(len(E)):
        print(f"{Q[i]}, {E[j]}, {Lm[i][b]}")
        b += 1

print("End")