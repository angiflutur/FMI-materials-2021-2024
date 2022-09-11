"""4.	Se dă o sumă S și avem la dispoziție bancnote  cu valorile: 1, 5, 10, 25.
Să se determine o modalitate de a plăti suma S folosind un număr minim de bancnote.
Algoritmul propus mai funcționa și dacă aveam bancnote cu valorile 1, 10, 30, 40? Justificați.
"""

bancnote = [1, 5, 10, 25]
s = int(input("suma:"))
k = 3
while s > 0:
    if bancnote[k] < s:
        print(s // bancnote[k], "x bancnote de", bancnote[k])
        s = s % bancnote[k]
    k = k - 1

"""Demonstratie:
Inductie: pentru orice S>0 algoritmul determina o modalitate de plata cu numar minim de bancnote.
Verificare: S=1,2,3,4 - corect, nu putem plati suma decat cu bancnote de valoare 1.
Fie S o suma. Presupunem ca algoritmul este corect pentru sume mai mici strict decat S.
 
Fie D o descompunere optima pentru S (cu numar minim de bancnote). In D pot fi cel mult
- 4 bancnote de valoare 1 (altfel 1+1+1+1+1 s-ar putea plati cu bancnota 5, deci D nu ar fi optima)
- 1 bancnota de valoare 5 (altfel 5+5 s-ar putea plati cu bancnota 10, deci D nu ar fi optima)
- 2 bancnote de valoare 10 (altfel 10+10+10=30 s-ar putea plati cu doua bancnote, una de 25 si una de 5, deci D nu ar fi optima)
Mai mult, daca in solutia optima D avem bancnota 5 nu putem avea mai mult de o bancnota de 10, altfel am obtine valoarea 
5+10+10=25 care se putea plati doar cu o bancnota, deci D nu ar fi optima.
Rezulta ca 
-valoarea maxima care se poate obtine cu bancnote de valoare 1 in D este 4
-valoarea maxima care se poate obtine cu bancnote de valoare 1,5 in D este 4x1+5=9
-valoarea maxima care se poate obtine cu bancnote de valoare 1,5,10 in D este 4x1+2*10=24 (din 4X1,1X5,1X10 obtinem maxim 10+5+4=19)

Atunci, daca
-S>=5 trebuie ca D sa foloseasca bancnota 5
-S>=10 - trebuie ca D sa foloseasca bancnota 10 (din 1 si 5 obtinem maxim suma 9)
-S>=25 – trebuie ca D sa foloseasca bancnota 25 
Deci prima bancnota aleasa de greedy este in descompunerea optima D. 

Aplicam ipoteza de inductie pentru suma ramasa. Algoritmul va produce solutia optima pentru aceasta suma si, deci,
impreuna cu prima bancnota aleasa, solutia optima pentru S. 

Contraexemplu pentru bancnotele 1, 10, 30, 40:
 S=60 - algoritmul va plati cu bancnotele 40, 10, 10. Solutia optima este 30+30
 """
