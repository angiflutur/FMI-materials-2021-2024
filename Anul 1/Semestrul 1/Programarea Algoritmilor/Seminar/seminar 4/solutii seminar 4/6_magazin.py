f=open("magazin.in"); cod=0; d={}
for linie in f:
    ls=linie.split()
    if ls[0]=="Magazin":
        cod=int(ls[1]); nume_magazin=" ".join(ls[2:])
        d[cod]=(nume_magazin, {})
    else:
        cantitate=float(ls[0]);    nume_produs=" ".join(ls[1:])
        d[cod][1][nume_produs]=cantitate
f.close()
print(d)
cod_magazin=221; nume_produs="asd"
print(d[cod_magazin][1].get(nume_produs,"nu exista produsul"))
cod_magazin=221; nume_produs="asd"
cantitate=3.5
if d[cod_magazin][1].get(nume_produs,0)>=cantitate:
     d[cod_magazin][1][nume_produs]=d[cod_magazin][1][nume_produs]-cantitate
     if d[cod_magazin][1][nume_produs]==0:
         d[cod_magazin][1].pop(nume_produs)
else:
    print("stoc indisponibi")
lista_valori=d.values()
print(sorted(lista_valori, key=lambda x: (sum(x[1].values()),x[0])))
s=set()
for magazin in d.values():
    s1=magazin[1].keys()
    s=s|s1
print(s)
