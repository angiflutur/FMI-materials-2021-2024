ls=[]
d={}
f=open("puncte.in")
for linie in f:
    info=linie.split(" ",maxsplit=2)
    t=(float(info[0]),float(info[1])) #tuplu - punctele
    """
# varianta 1- se modifica eticheta daca exista
    d[t]=info[2].rstrip("\n")
"""
#varianta 2- ramane cu eticheta existenta
    """
    if t not in d:
        d[t] = info[2].rstrip("\n")
    #mai bine
    d.setdefault(t,info[2].rstrip("\n")) #inlocuiesc
    """
    d.setdefault(t,[]).append(info[2].rstrip("\n")) #concatenez

f.close()
print(d)
with open("interogari.in") as f,open("interogari.out","w") as g:
    for linie in f:
        x,y,op=(float(x) for x in linie.split())
        if op==1:
            g.write(f"({x},{y}) {d.get((x,y),'nu exista')}\n") 
#:.2f fara f scrie si cu e+
        else:
            #del d[(x,y)] #da eroare daca nu exista
            d.pop((x,y),0)
    g.write("punctele ramase\n")
    for p in d.items():
        g.write(f"{p[0]}: {p[1]}\n" )
