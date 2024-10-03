E=set()
Q=set()
S=set()
F=set()

l={'Sigma:','States:','#','Transitions:','End'}
f=open('dfa_config_file.in')
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
if len(S)!=1:
    print("AFD nu este valid")
elif len(Q)==0 or len(E)==0:
    print("AFD nu este valid")
else:
    nr=len(Q)
    m=[[0 for i in range(nr)] for j in range(nr)]
    f=open('dfa_config_file.in')
    for line in f:
        line=line.split(',')
        line=" ".join(line)
        line=line.rstrip().split()
        if set(line).intersection(l)==set():
            if len(line)==3:
                x=int(line[0])
                y=int(int(line[2]))
                m[x][y]=line[1]
    f.close()


    cuv=input('Cuvant: ')
    # verificam daca cuvantul apartine alfabetului
    ok=0
    for i in range(len(cuv)):
        if cuv[i] not in E:
            ok=1
            print('Cuvantul nu este valid')
    lista_stari=[]
    for x in S:
        lista_stari.append(x)
    i=0
    indice=0
    if ok==0:
        while indice<len(cuv):
            for j in range(len(m[i])):
                aux=0
                if cuv[indice]==m[i][j]:
                    aux=1
                    indice+=1
                    i=j
                    lista_stari.append(j)
                    break
            #verificam daca litera din cuvant ne poate duce dintr-o stare in alta stare valida
            if aux==0:
                break
        if lista_stari[len(lista_stari)-1] in F: #verificam daca ultima stare este finala
            print('Cuvant valid')
        else:
            print('Cuvant invalid')
