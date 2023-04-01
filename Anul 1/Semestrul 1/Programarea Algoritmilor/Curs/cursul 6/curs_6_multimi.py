#oboiecte care au asociat hash-code:
s="abc"
print(hash(s))
ls=[3,4] #nu hash
#print(hash(ls)) => TypeError: unhashable type: 'list'
t=(3,4)
print(hash(t))
t=(3,[4,5])
t[1][0]=9
print(t)
#print(hash(t)) -  #are componente mutabile - nu este hashuibil
t=(3,(4,5)) #are componente mutabile - nu este hashuibil
#t[1][0]=9 - nu este actualizabil
print(t)
print(hash(t))

#____________________________________
#ALTE TIPURI DE COLECTII

#1. MULTIMI + MULTIMI IMUTABILE
#colectii cu elemente distincte

#MULTIMI
#Multimi - clasa set
#nu este o colectie indexata, nu putem scrie s[i]
#-mutabila
#!!!elem din set trebuie sa fie imutabile (hash-uibile)
#ordinea in care sunt parcurse elementele nu coincide neaparat cu cea in care sunt introduse

#CREARE
#{}
s={4,1,5}
print(s)
#s={2,[4,5]} #TypeError: unhashable type: 'list'
#print(s) - un set poate contine doar elemente hash-uibile
s={} #NU este multimea vida - este dictionarul vid, multimea vida se creeaza cu set()
print(s,type(s))

#set()
s=set() #multimea vida
s=set("alfabet") #multimea literelor (distincte) din cuvant
print(s)
s=set([2,4,1,2,4])
print(s)

#comprehension
ls = [3,4,-1,5,1,3,-7,-1,1,3]
#multimea elementelor pozitive din ls
s = {x for x in ls if x>0}
print("multimea elementelor pozitive",s)

#parcurgere - for (!!nu e neaparat sa pastreze ordinea in care au fost adaugate elementele
for x in s:
    print(x, end=" ")
print()

#functii si operatori comuni:
#min, max, sorted, len

#in, not in
#operatori ==, !=
s1={3,4,5}
s2={5,4,3}
print(s1==s2)

#operatorii relationali > ,>= - testeaza incluziuni
s1={2,4,6}
s2={6,2}
print(s2<s1)

#operatori pentru operatii cu multimi
# | reuniune, & intersectia, - diferenta, ^ diferenta simetrica
#se pot inlantui
# returneaza o noua multime
#se pot aplica doar intre set
#exista si metode asociate operatilor pe multimi: s.union(*iterabil), s.intersection(*iterabil), s.difference().. care returneaza o multime noua
#exista si metode asociate operatilor pe multimi care modifica multimea, nu returneaza una noua: s.update, s.intersection_update

s1={3,7,8,9}
s2={5,1}
s3={5,7,8,11}
s4=[9,9,3,3,12]
s=s1|s2|s3
print(s)
#s=s1|s2|s3|s4 TypeError: unsupported operand type(s) for |: 'set' and 'list'
#print(s)
s=s1.union(s2,s3,s4)
print(s)
s1.update(s2,s3,s4) #reuniune cu actualizarea obiectului s1
print(s1)

#alte metode de actualizare - adaugare/eliminarea a unui element
s1.add(2)
print(s1)
s1.remove(8) #elimina un element, da eroare daca elementul nu exista
print(s1)
s1.discard(9) #elimina un element
print(s1)
#s1.remove(8) #da eroare daca elementul nu exista
#print(s1)
s1.discard(9) #nu da eroare, desi 9 nu exista
print(s1)

#MULTIMI IMUTABILE
#clasa frozenset
s=frozenset([3,4,5])
print(s)
#operatori pe multimi -aceeasi
print(s|s1) #rezultatul este de tipul primului operator
print(s1|s)
