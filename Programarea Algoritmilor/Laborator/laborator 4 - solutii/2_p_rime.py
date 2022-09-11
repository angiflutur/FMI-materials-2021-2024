p=int(input())
d={}
f=open("rime.in")
for linie in f:
    for x in linie.split():
        d.setdefault(x[-p:],[]).append(x)
f.close()
ls =sorted(d.items(), key = lambda x:len(x[1]),reverse=True)
g=open("rime.out","w")
for x in ls:
    x[1].sort(reverse=True)
    g.write(" ".join(x[1]))
    g.write("\n")
g.close()
