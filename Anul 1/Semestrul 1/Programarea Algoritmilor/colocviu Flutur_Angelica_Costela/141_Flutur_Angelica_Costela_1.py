# Flutur Angelica-Costela
# Grupa 141

def cheie(x):
    return -x[1],x[0]
f=open("numere.in")
numere=[]
for linie in f:
    for numar in linie.split():
        #cautam pozitia punctului
        index=numar.find(".")
        i=0
        while i<index:
            j=index+1
            while j<len(numar):
                if numar[i]==numar[j]:
                    numar=numar.replace(numar[j],'')
                    # numar=numar.replace(numar[i],'')
                else:
                    j+=1
            i+=1
        numar=numar.replace('.','')
        numere.append((numar,len(numar)))
f.close()

numere=sorted(numere,key=cheie)

print(numere)

g=open("numere.out","w")
index=8
for numar in numere:
    if numar[1]!=index:
        if(index!=8):
            g.write('\n')
        g.write(str(numar[1])+" cifre:")
        g.write('\n')
        index-=1
    g.write(numar[0])
    g.write(", ")
g.close()
