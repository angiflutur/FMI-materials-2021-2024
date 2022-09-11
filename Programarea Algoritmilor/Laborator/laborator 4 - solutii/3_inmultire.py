with open("test.in") as f, open("test.out","w") as g:
    pct=1
    for linie in f:
        g.write(linie.strip(" \n"))#!!
        p,rez=linie.split("=")
        x,y=(int(a) for a in p.split("*"))

        if x*y==int(rez):
            g.write(" Corect\n")
            pct+=1
        else:
            g.write(f" Gresit {x*y}\n")
    g.write(f"Nota {pct}")