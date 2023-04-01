#FISIERE TEXT

"""se deschid cu open, se inchid cu close
f=open(nume_fisier,mod_de_deschidere) mod_de_deschidere ("r","w","a",...)- parametru optional
#CITIRE: rezultat de tip str (siruri de caractere), sfarsitul de linie este reprezentat prin \n
f.read() => returneaza tot continutul fisierului ca str
f.readlines() => returneaza o lista de siruri, un sir reprezentand o linie din fisier (!include \n daca nu este ultima linie)
f.readline() => returneaza linia curenta ca str
f este iterabil
Fisierul se poate deschide intr-un bloc with... as : - se inchide automat cand se termina blocul
"""
f = open("cuvinte.in") #c:\\numar.in
s = f.read()
print(repr(s))
f.close()


f = open("cuvinte.in") #c:\\numar.in
s = f.readlines()
print(repr(s))
#pentru a elminia \n - se poate folosi rstrip("\n")
for i in range(len(s)-1):
    s[i]=s[i].rstrip("\n")
print(repr(s))
f.close()

#citire linie cu linie
f = open("cuvinte.in") #c:\\numar.in
s = f.readline()
while s!="":
    print(repr(s))
    s = f.readline()
print(repr(s))
f.close()

#este iterabil
with open("cuvinte.in") as f:
    for linie in f:
        print(repr(linie))

with open("cuvinte.in") as f:
    print(f.closed)
print(f.closed)



#SCRIEREA IN FISIER
"""
scriu siruri de caractere
nu adauga implicit nimic (nici sfarsit de linie)
f.write(un_sir) 
f.writelines(un iterabil cu elemente de tip str) - scriem o lista de siruri in fisier (!!!nu adauga sfarsit de linie dupa fiecare sir)
"""
ls=[5,1,3]
with open("lista.out","w") as f:
    for x in ls:
        f.write(str(x)+" ")
        #f.write(f"{x} ")
    f.write("\n")
    f.write("\n".join((str(x) for x in ls)))
    ls_cuv=["abc","def","hji"]
    f.writelines(ls_cuv) #lipite, nu adauga sfarsit de linie


