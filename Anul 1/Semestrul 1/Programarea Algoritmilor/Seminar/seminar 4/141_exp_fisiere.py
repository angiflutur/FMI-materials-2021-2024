f=open("propozitii.in") #citire
#!!!la citire se returneaza siruri de caractere care includ si
# delimitatorul de sfarsit de linie reprezentat prin \n
#tot fisierul ca un sir
s=f.read()
print(repr(s))
print(s)
f.close()
print("varianta 2 - linie cu linie cu readline")
#linie cu linie - cu readline() sau se poate itera
f=open("propozitii.in")
linie=f.readline() #citeste o linie (include si \n la sfarsit daca nu este ultima linie
print(linie)
while linie!="":
    print(repr(linie))
    linie=f.readline()
f.close()

print("varianta 3 - iteram")
f=open("propozitii.in")
for linie in f:
    print(repr(linie))
f.close()
