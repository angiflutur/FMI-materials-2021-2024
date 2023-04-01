def frecvente(*nume_fisiere):
    d={}
    for nume in nume_fisiere:
        with open(nume) as f:
            for linie in f:
                for cuv in linie.split():
                    d[cuv] = d.get(cuv,0)+1
    return d
print(frecvente("cuvinte1.in","cuvinte2.in"))
print(*sorted(frecvente("cuvinte1.in","cuvinte2.in").keys()))

print( sorted(frecvente("cuvinte1.in") ))
print( sorted(frecvente("cuvinte1.in").items(), key= lambda x:x[1] , reverse=True))
print(max(frecvente("cuvinte2.in").items(), key =lambda x:(x[1],x[0]))[0])
#distanta cosinus
d1=frecvente("cuvinte1.in")
d2=frecvente("cuvinte2.in")
norm1=0
norm2=0
s=0
import math
for x in d1.keys() | d2.keys():
    s+= d1.get(x,0)*d2.get(x,0)
    norm1 += d1.get(x,0)**2
    norm2 += d2.get(x, 0) ** 2
print(f"{s/(math.sqrt(norm1)*math.sqrt(norm2)):.2}")


