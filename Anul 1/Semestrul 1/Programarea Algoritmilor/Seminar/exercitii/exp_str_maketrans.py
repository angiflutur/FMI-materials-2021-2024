#1.Inlocuim semnele de punctuatie uzuale: .,; toate cu spatiu - pt a folosi split()
#o solutie - sa folosim cate un replace pt fiecare semn de punctuatie

#o metoda pentru a inlocui simultan mai multe caractere este metoda translate -
# care se face pe baza unui tabel de traducere generat cu maketrans

propozitie="a fost odata"
#inlocuim vocalale a->b o->p
tabel = str.maketrans("ao","bp") #maketrans(sir1,sir2) unde sir1 si si2 au aceeasi lungime - inlocuieste sir1[i]->sir2[i])
print(tabel)
rez= propozitie.translate(tabel)
print(rez)

tabel = str.maketrans("ao","bp","t") #maketrans(sir1,sir2. sir3) unde sir3 este un cuvant cu caracterele pe care vrem sa le stergem din sir
rez= propozitie.translate(tabel)
print(rez)

dictionar={"1":"o","2":"doua"} #cheie:valoare cheie -un caracter, valoare - un sir
propozitie="1 ora de curs 2 ore alte 2 ore"
rez= propozitie.translate(str.maketrans(dictionar))
print(rez)

#inlocuirea separatorilor cu spatiu
propozitie = "a, .. alt cuvant ., o propozitie "
rez= propozitie.translate(str.maketrans(".,","  "))
print(rez)