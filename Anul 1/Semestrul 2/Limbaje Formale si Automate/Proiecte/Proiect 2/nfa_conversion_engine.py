E=set()
Q=set()
F=set()
indexS = 0
validation = True
S = 0
l={'Sigma:','States:','#','Transitions:','End'}
f=open('nfa_config_file')
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
                    S = x
                    indexS += 1
                elif len(line)>1 and 'F' in line:
                    F.add(x)
f.close()
E = sorted(E)
nr=len(Q) #nr de stari
m=[[0 for i in range(nr)] for j in range(nr)]
f=open('nfa_config_file')
for line in f:
    line=line.split(',')
    line=" ".join(line)
    line=line.rstrip().split()
    if set(line).intersection(l)==set():
        if len(line)==3:
            x=int(line[0])
            y=int(int(line[2]))
            if line[1] in E:
                if m[x][y]==0:
                    m[x][y]=line[1]
                else:
                    m[x][y] = m[x][y] + line[1]
            else:
                validation = False #verific daca literele din tranzitii fac parte din alfabet
                break
f.close()
if indexS != 1:
    validation = False

if validation == False:
    print('Invalid NFA')
else:
    print(' AFN = ' , m)

    i = S
    x = 0
    noile_stari = {}
    for k in range(len(E)): # literele alfabetului
        aux = ''
        for j in range(len(m[i])):
            o = str(m[i][j])
            if E[k] in o:
                aux = str(aux) + str(j)
                aux = ''.join(sorted(aux))
                noile_stari[E[k]] = aux
    Qprim = {}
    Qprim[str(S)] = noile_stari
    keys = [str(S)] #noile stari adaugate, cheile primului dictionar
    for l in range(len(Qprim[keys[0]])):
        if Qprim[keys[0]][E[l]] not in keys:
            keys.append(Qprim[keys[0]][E[l]])
    ok = 0
    for key in range(len(keys)):
        ok = 1
        for k in range(len(E)): # cheile pt 01, 2
            noile_stari = {}
            for u in range(len(E)):
                aux = ''
                for l in range(0, len(Qprim[str(keys[key])][E[k]])):
                    i = Qprim[str(keys[key])][E[k]][l] # iau fiecare cifra in parte
                    i = int(i)
                    for j in range(len(m[i])):
                        o = str(m[i][j])
                        if E[u] in o:
                            if str(j) not in aux:
                                aux = str(aux) + str(j)
                                aux = ''.join(sorted(aux))
                    noile_stari[E[u]] = aux
                    Qprim[Qprim[str(keys[key])][E[k]]] = noile_stari
                    if aux not in keys and aux != '':
                        keys.append(aux)
print(' AFD = ',Qprim)
starile_finale = []
for x in range(len(keys)):
    p = str(keys[x])
    for y in range(len(p)):
        if int(p[y]) in F:
            starile_finale.append(p)
print(' starile finale = ', starile_finale)
