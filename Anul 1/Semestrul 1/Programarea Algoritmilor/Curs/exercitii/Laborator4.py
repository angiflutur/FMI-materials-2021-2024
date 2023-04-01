def frecvente_fisiere(*nume_fisiere):
    d={}
    for nume_fisier in nume_fisiere:
        f=open(nume_fisier)
        for linie in f:
            for cuvant in linie.split():
                if(cuvant in d):
                    d[cuvant]+=1
                else:
                    d[cuvant]=1
        f.close
    return d
#a,b
d=frecvente_fisiere("fisier1.in","fisier2.in")
print(d)
print(sorted(d.values()))
print(sorted(d.keys()))
print(*sorted(d.keys()))
#c
d=frecvente_fisiere("fisier2.in")
print(d.items())
def cheie(x):
    return x[1]
print(sorted(d.items(),key=cheie,reverse=True))
# d
print(max(d.items(),key=cheie)[0])
# e
d1=frecvente_fisiere("fisier1.in")
d2=frecvente_fisiere("fisier2.in")
s=0
for cuvant in d1.keys() & d2.keys():
    s+=d1[cuvant]*d2[cuvant]
n1=0
n2=0
for cuvant in d1:
    n1+=d1[cuvant]**2
for cuvant in d2:
    n2+=d2[cuvant]**2
import math
n1=math.sqrt(n1)
n2=math.sqrt(n2)
print(f"{s/(n1*n2):.2f}")
#print(f"[{x} -{y}]")
#print(f"{x:.2f}"
