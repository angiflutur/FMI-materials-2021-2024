def operatii_fisiere(*nume_fisiere):
    reuniune=set()
    intersectie = None
    for nume_fisier in nume_fisiere:
        f=open(nume_fisier)
        ls=set(int(x) for x in f.read().split())
        reuniune= reuniune | ls #reuniune.update(ls)
        if intersectie == None:
            intersectie=ls
        else:
            intersectie.intersection_update(ls)
        f.close()
    return reuniune,intersectie
r,i=operatii_fisiere("fisier1.in","fisier2.in")
print(r,i)
