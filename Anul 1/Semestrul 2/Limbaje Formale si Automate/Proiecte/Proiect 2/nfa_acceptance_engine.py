E=set()
Q=set()
F=set()
indexS = 0
validation = True
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
            y=int(line[2])
            if line[1] in E:
                if(m[x][y]==0):
                    m[x][y]=line[1]
                else:
                    m[x][y] = m[x][y] + line[1]
            else:
                validation = False
f.close()
if indexS != 1:
    validation= False
if validation == False:
    print('Invalid NFA')
else:
    cuv=input('Cuvant: ')
    # verificam daca cuvantul apartine alfabetului
    ok=0
    for i in range(len(cuv)):
        if cuv[i] not in E:
            ok=1
            print('Cuvant invalid')
    lista_tranzitii = []
    i = S
    indice=0
    if ok == 0:
        if indice == 0:
            aux = 0
            for j in range(len(m[i])):
                tranzitie = [S]
                o = str(m[i][j])
                if cuv[indice] in o:
                    aux = 1
                    tranzitie[0] = str(tranzitie[0]) + str(j)
                    lista_tranzitii.append(tranzitie)
            if aux == 0:
                print('Cuvant invalid')
            else:
                indice = 1
                aux = 1
                while indice < len(cuv) and aux == 1:
                    for k in range(len(lista_tranzitii)):
                        if len(lista_tranzitii[k][0]) == indice + 1:
                            i = lista_tranzitii[k]
                            i = lista_tranzitii[k][0][len(lista_tranzitii[k][0])-1]
                            i = int(i)
                            # i = ultima stare
                            tranzitie = lista_tranzitii[k]
                            contor = 0
                            for j in range(len(m[i])):
                                o = str(m[i][j])
                                if cuv[indice] in o and contor == 0:
                                    contor = 1
                                    tranzitie[0] = str(tranzitie[0]) + str(j)
                                elif cuv[indice] in o and contor == 1:
                                    lista_tranzitii.append([str((tranzitie[0])[:-1]) + str(j)])
                                    k = 0
                    indice += 1
        ok = 0
        for j in range(len(lista_tranzitii)):
            if len(lista_tranzitii[j][0])==len(cuv)+1 and int(lista_tranzitii[j][0][len(lista_tranzitii[j][0])-1]) in F:
                print('Cuvant valid')
                ok = 1
                break
        if ok == 0:
            print('Cuvant invalid')
