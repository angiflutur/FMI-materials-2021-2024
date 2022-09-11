f = open("numere_comune.in", "r")

s = f.readline()

rez = set((int(x) for x in s.split())) #nu cu multimea vida
s = f.readline()
while s != "":  # sir vid cand s-a terminat fisierul
    M = set((int(x) for x in s.split())) #generator
    #rez &= M # intersectie de seturi # echivalent cu: M1.intersection(M2)
    rez.intersection_update(M)
    s = f.readline()
f.close()
f2 = open("comune.txt", "w") #pt scriere
for x in rez:
    f2.write(f'{x} ') #NU merge direct WRITE(X), TB STR
f2.write("\n")
f2.write(" ".join([str(x) for x in rez]))
f2.write("\n")
#
f2.write(" ".join([str(x) for x in sorted(rez)]))
f2.close()
