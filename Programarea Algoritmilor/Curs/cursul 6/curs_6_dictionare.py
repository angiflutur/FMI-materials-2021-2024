#clasa dict
#Colectie indexata dupa cheie
#memoreaza perechi de forma cheie:valoare, astfel incat cautarea dupa cheie sa fie optimizata
#=> o cheie trebuie sa fie imutabila
#valoarea poate fi de orice tip

#CREARE:
#{}
d={} #dictionarul vid
d={"unu":1, "doi":[1,2]} #{cheie:valoare}, valoarea poate fi de orice tip
print(d,type(d))
d={(3,4):"punctul 1", (5,6):"punctul 2"}
print(d,type(d))
#d={[3,4]:"punctul 1", [5,6]:"punctul 2"} #TypeError: unhashable type: 'list'
#print(d,type(d))
d={"2":"doi",frozenset({4,5}):"patru cinci"}
print(d,type(d))

#dict iterabil (cheie,valoare)
ls=[(3,"valoarea 1"),(4,"valoarea 2")]
d=dict(ls)
print(d)
d=dict(unu=1,doi=2)
print(d)


#comprehension
#vocala:0
d={x:0 for x in "aeiou"}
print(d)
#frecventa numerelor dintr-o lista element:frecventa
ls=[3,5,1,2,4,5,1,3,7]
d={x:ls.count(x) for x in set(ls)}
print(d)

#dict.fromkeys(iterabil_cu_chei, valoare_default) (valoare_default -poate lipsi -este NONE)
d=dict.fromkeys("aeiou",0)  #d={x:0 for x in "aeiou"}
print(d)

#ACCESARE A UNUI ELEMENT
#d[cheie] - da eroare daca cheie nu este in dictionar
#d.get(cheie, valoare_default) - daca cheie nu este in dictionar get intoarce valoare_default
# (valoare_default poate fi de orice tip, daca nu este data intoarce None);


d={"unu":1,"doi":2}
print(d["unu"])
#print(d["trei"]) #KeyError: 'trei'
print(d.get("trei","nu exista"))

#operatorii in si not in
#x in d - cauta implicit in cheile din dictionar
if "trei" in d:
    print(d["trei"])
else:
    print("nu exista")

#ACTUALIZARE
#d[cheie]=valoare - daca exista se modifica valoare asociata cheii, altfel se insereaza
#d.setdefault(cheie,valoare_default) - insereaza cheia daca nu exista cu valoarea valoare_default (sau None daca nu e data)
#, daca exista nu modifica valoarea (returneaza valoarea cheii)

#Exc - determinarea frecventei caracterelor intr-un sir
d_frecv={}
sir=input("sirul:")
for c in sir:
    if c in d_frecv:
        d_frecv[c]+=1
    else:
        d_frecv[c] = 1
print(d_frecv)

#Exc - determinarea frecventei cuvintelor dintr-o propozitie (Separate prin spatiu)
d_frecv={}
sir=input("propozitie:")
for c in sir.split():
    """if c in d_frecv:
        d_frecv[c]+=1
    else:
        d_frecv[c] = 1
        """
    #sau
    d_frecv[c] = d_frecv.get(c,0)+1
print(d_frecv)

#STERGEREA unei chei
#del d[cheie] - daca nu exista => eroare
#d.pop(cheie,valoare_daca_nu_exista) - returneaza valoarea asociata cheii
# sau valoare_daca_nu_exista in cazul in care cheia nu este in dictionar
# (daca este specificata, altfel da eroare)

d={"unu":1,"doi":2,"trei":3}
del d["unu"]
print(d)

#parcurgerea unui dictionar
#implicit - for x in d: - itereaza dupa chei

for x in d:
    print(x,"-",d[x])
#d.keys() - "multimea" cheilor
#d.items() - "lista" de perechi (cheie,valoare)
#d.values() - "lista" de valori
print(d.keys(),type(d.keys()))
print(d.items(),type(d.items()))
print(d.values(),type(d.values()))

for t in d.items():
    print(t[0], "/", t[1])

for x,y in d.items():
    print(x, "/", d[x])


d={"unu":1,"doi":2,"trei":3}
d2={"altul":1,"doi":2,"trei":3}
print(d.keys()&d2.keys()) #operatii cu multimi