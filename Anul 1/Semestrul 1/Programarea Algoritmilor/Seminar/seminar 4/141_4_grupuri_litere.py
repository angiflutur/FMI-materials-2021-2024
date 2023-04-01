#d={multime_litere:lista de cuvinte care au acea multime de litere}
d={}
f=open("cuvinte.in")
for linie in f:
    for cuv in linie.split(): #dupa caractere albe, include si \n ca separator
        litere_cuv=frozenset(cuv)
        if litere_cuv in d:
            d[litere_cuv].append(cuv)
        else:
            d[litere_cuv]=[cuv] #lista cu un cuvant
        #d.setdefault(litere_cuv,[]).append(cuv)
print(d)
def cheie(x):
    return len(x),x
for multime in sorted(d,key=len,reverse=True):
    #d[multime] este lista cu cuvintele din grup
    print(*sorted(d[multime],key=cheie))