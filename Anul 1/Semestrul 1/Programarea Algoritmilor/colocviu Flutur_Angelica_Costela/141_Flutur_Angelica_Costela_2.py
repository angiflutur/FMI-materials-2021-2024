# Flutur Angelica-Costela
# Grupa 141

#a
def citire_cuvinte():
    f=open("cuvinte.in")
    matriceCuvinte=[]
    for linie in f:
        matriceCuvinte.append(linie.split())
    f.close()
    return matriceCuvinte

#b
def cuvinte_noi(matrice,*indici):
    linieNoua=[]
    for indice in indici:
        cuvant=""
        for i in range(0,len(matrice)):
            if(len(matrice[i][indice])>=2):
                cuvant+=matrice[i][indice][:2]
        linieNoua.append(cuvant)
    matrice.append(linieNoua)
    return matrice

#c
matrice=citire_cuvinte()
lungime=len(matrice)
lungime-=1
matrice=cuvinte_noi(matrice,lungime-1,lungime)

lungime+=1

for i in range(0,lungime):
    matrice[0][i]=matrice[0][i].upper()

for i in range(0,lungime+1):
    print(*matrice[i])