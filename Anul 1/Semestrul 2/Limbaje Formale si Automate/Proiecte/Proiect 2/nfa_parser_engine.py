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
            y=int(line[2])
            if line[1] in E:
                if m[x][y]==0:
                    m[x][y]=line[1]
                else:
                    m[x][y] = m[x][y] + line[1]
            else:
                validation = False #verific daca literele din tranzitii fac parte din alfabet
                break
f.close()
if indexS != 1: #daca nu avem stare initiala, este invalid
    validation = False
if validation == True:
    print('Valid NFA')
else:
    print('Invalid NFA')
