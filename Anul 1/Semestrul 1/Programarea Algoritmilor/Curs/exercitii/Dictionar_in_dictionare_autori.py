# nume_fisier=input("fisier")
# f=open(nume_fisier)
f=open("fisier1.in")
# ls=f.readline().split()
# n=int(ls[0])
# m=int(ls[1])
n,m=[int(x) for x in f.readline().split()]
d={}
for rand in range(n):
    ls=f.readline().split(maxsplit=1)
    cod_autor=int(ls[0])
    #print(cod_autor)
    d[cod_autor]=(ls[1].strip(),{})
print(d)
for rand in range(m):
    ls=f.readline().split(maxsplit=4)
    cod_autor=int(ls[0])
    codul_cartii=int(ls[1])
    an_aparitie=int(ls[2])
    nr_pagini=int(ls[3])
    titlu=ls[4].rstrip('\n')
    #d_carti=d[cod_autor][1]
    #d_carti[codul_cartii]=[an_aparitie,nr_pagini,titlu]
    d[cod_autor][1][codul_cartii]=(an_aparitie,nr_pagini,titlu)
print(d)
# Sa scrie o functie care sa stearga toate informatiile despre o carte al carei cod este transmit ca paramentru
def sterge_carte(d,cod_carte):
    for i in d:
        if cod_carte in d[i][1]:
            del d[i][1][cod_carte]
            return d[i][0]
#print(sterge_carte(d,132))
#print(d)
def cheie(x):
    return x[0],-x[1],x[2]
def carti_autori(d,cod_autor):
    lista=[]
    if cod_autor not in d:
        return None,lista

    #print(d[cod_autor][1].values())
    lista=list(d[cod_autor][1].values())
    return d[cod_autor][0], sorted(lista,key=cheie)
nume,carti=carti_autori(d,11)
print(nume)
if len(carti)>0:
    for x in carti:
         #print(*x)
        print(x[2],x[0],x[1])
else:
    print("cod inexistent")
