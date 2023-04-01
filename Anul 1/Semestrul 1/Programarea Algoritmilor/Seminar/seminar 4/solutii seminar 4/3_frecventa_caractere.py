#frecvente caractere fisier
def calcul_frecvente(nume_fisier):
    d={}
    with open(nume_fisier) as f:
        for linie in f:
            for c in linie:
                d[c]=d.get(c,0)+1
    return d

d=calcul_frecvente("puncte.in")
d2=calcul_frecvente("interogari.in")
print(d)
print(d2)
for x in sorted( d.keys()|d2.keys(), key=lambda x: (0,x) if x.isalnum() else (1,-ord(x))):
    print(f"{repr(x)} frecventa { d.get(x,0)+d2.get(x,0)}")
