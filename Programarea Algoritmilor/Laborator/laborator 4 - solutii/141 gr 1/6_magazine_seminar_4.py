"""
Magazin 123 magazin1 
5 mere 
7 pere 
2 prune 
Magazin 221 magazin 2 
3.5 pere 
10 banane
"""
"""
v1: [(123, mere, 5), (123,pere,7), (221,pere, 3.5)...]
v2: {123: [(mere,5), (pere,7),(prune,2)]}  d[cod_magazin] -> lista de produse O(1), cautarea unui produs in lista de produse din magazin - liniara
v3: {123: {mere:5, pere:7,prune:2}} - d[cod_magazin][produs]
    {123: "magazin1", 221:"magazin 2"}
"""

def read(dictionary_products, dictionary_name, filename):
    file = open(filename)
    for line in file:
        line=line.split(maxsplit = 2)
        if line[0] == "Magazin":
            cod_magazin = int(line[1])
            nume_magazin = line[2].rstrip("\n")
            dictionary_products[cod_magazin] = {} #varianata 2- cu un sigur dictionar- atasam si numele({},nume_magazin)
            dictionary_name[cod_magazin]= nume_magazin
            
        else:
            cantitate = float(line[0])
            produs = line[1]
            dictionary_products[cod_magazin][produs] = cantitate
    file.close()
            
def update(dictionary_products, cod_magazin, nume_produs, cantitate):
    try:
        if(dictionary_products[cod_magazin][nume_produs] >= cantitate):
            dictionary_products[cod_magazin][nume_produs] -= cantitate
            if dictionary_products[cod_magazin][nume_produs] == 0:
                del dictionary_products[cod_magazin][nume_produs]
            return 1
        else:
            return 0
    except:
        return 0

filename = "produse.in"
dictionary_products={}
dictionary_name={}
read(dictionary_products, dictionary_name, filename)
# print(dictionary_products)
update(dictionary_products, 221, "banane", 1)
print(dictionary_products)

produse = set()
for magazin in dictionary_products:
    produse |= dictionary_products[magazin].keys()
print(*produse)

list = []
for magazin in dictionary_products:
    cantitate = sum( dictionary_products[magazin].values())
    list.append((cantitate, dictionary_name[magazin]))
list.sort()
print(*list)
            