#d={(1,2): "punctul 1", (1,3):"punctul 2"}
d={}
f=open("puncte.in")
for linie in f:
    ls = linie.split(maxsplit=2)
    x=int(ls[0])
    y=int(ls[1])
    eticheta=ls[2].rstrip("\n")
    #print(x,y,repr(eticheta))
    d[(x,y)] = eticheta # inserare sau actualizare
f.close()

print(d)
f=open("interogari.in")
for linie in f:
    x,y,op=[int(x) for x in linie.split()]
    #print(x,y,op)
    if op==1:
        if (x,y) in d:
            eticheta=d[(x, y)]
        else:
            eticheta="nu exista"
        print(f"({x},{y}) {eticheta}")
        #sau
        #print(f"({x},{y}) {d.get((x,y),'nu exista')}") #nu este nevoie sa cautam cheia inainte
    else:
        if (x,y) in d:
            del d[(x, y)] #da eroare daca nu exista
        #sau
        #d.pop((x, y),'nu exista') #nu este nevoie sa cautam cheia inainte
print(d)
print("puncte ramase")
for t in d: #itereaza dupa chei (d.keys()) - dupa perechi (x,y)
    print(t,":",d[t],sep="")
    #print(f"({t[0]},{t[1]}): {d[t]}")

for x,y in d: #itereaza dupa chei - dupa perechi (x,y)
    print(f"({x},{y}): {d[(x,y)]}")

print(d.items())

for t,eticheta in d.items():
    print(t, ":", eticheta, sep="")

f.close()
#exc-scriere in fisier