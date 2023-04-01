nume_fisier=input()
d={}
with open(nume_fisier) as f:
    for linie in f:
        ls=linie.split()
        for c in ls:
            fs=frozenset(c)
            d.setdefault(fs,[]).append(c)

g=open("litere_egale.txt","w")
#g.write(str(d))
for lista in sorted(d.values(),key=len,reverse=True):
    if len(lista)>=2:
        g.write(" ".join(sorted(lista,key=lambda x: (len(x),x))))
        g.write("\n")
g.close()
