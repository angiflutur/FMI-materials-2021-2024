#citim fisierul linie cu linie
#transformam fiecare linie in set
#facem intersectia

f=open("numere_comune.in")
rezultat = set((int(x) for x in f.readline().split()))

for linie in f:
        m = set([int(x) for x in linie.split()])
        #rezultat = rezultat & m  #& instersectie
        rezultat.intersection_update(m)

print(rezultat) #nu garanteaza o anumita ordonare
print(sorted(rezultat)) #sorted pt set => lista
print(*sorted(rezultat)) #sorted pt set => lista
f.close()