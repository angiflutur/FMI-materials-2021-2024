"""Se dă un număr natural n.
Sa se afișeze o descompunere a lui n ca sumă de termeni distincți din șirul lui Fibonacci care nu conține ca termeni două numere Fibonacci consecutive.
Există mereu o astfel de descompunere? Justificați
"""

n = int(input("n="))
f1 = 1
f2 = 1
while f2 <= n:
    f1, f2 = f2, f1 + f2

while n > 0:
    if f1 <= n:
        print(f1)
        n = n - f1
    f1, f2 = f2 - f1, f1


"""
Justificare existenta descompunere: inductie dupa n
Notam F_{k} al k-lea termen din sir
- Pentru n=1,2,3,4 -se verifica: 1,2,3 sunt numere Fibonacci, 4=3+1
Fie n>4
- Presupunem afirmatia adevarata pentru numere mai mici decat n
- Fie  k astfel încât F_{k} <= n < F_{k+1} (incadram n intre doua numere Fibonacci).
 
Daca n = F_{k}, atunci n admite o descompunere cu un singur termen.

Altfel avem 
    n - F_{k} < F_{k+1} - F_k = F_{k-1}
Aplicam ipoteza de inductie pentru n - F_{k} => 
 n - F_{k} are o descompunere ca sumă de termeni distincți din șirul lui Fibonacci; 
 deoarece n- F_{k} <F_{k-1}, aceasta descompunere va contine termeni mai mici strict decat F_{k-1}. 

Adaugand F_k la aceasta descompunere a lui n-F_{k} obtinem o descompunere a lui n in numere Fibonacci neconsecutive
"""