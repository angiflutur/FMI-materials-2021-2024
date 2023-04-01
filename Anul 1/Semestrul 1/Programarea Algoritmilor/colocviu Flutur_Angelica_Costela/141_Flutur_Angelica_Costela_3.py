# Flutur Angelica-Costela
# Grupa 141

# a
dict={}
f=open("cinema.in")

for linie in f:
    cuvinte=linie.split(' %')
    ore=cuvinte[2].split()
    if cuvinte[0] not in dict:
        dict[cuvinte[0]]=[[cuvinte[1].strip(' '),ore]]
    else:
        dict[cuvinte[0]].append([cuvinte[1].strip(' '),ore])

f.close()