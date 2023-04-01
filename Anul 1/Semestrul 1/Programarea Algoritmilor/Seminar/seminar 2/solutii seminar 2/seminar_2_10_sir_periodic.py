"""10.	Sir periodic. Se citește un șir de caractere 𝑠. Să se verifice dacă există un șir t, diferit de 𝑠,
 astfel încât 𝑠 să se poată obține prin concatenarea de un număr arbitrar de ori (𝑘>1) a șirului t
 (adică să se verifice dacă șirul s este periodic).
Dacă există mai multe astfel de șiruri t se va determina cel mai lung. Exemplu: s = abbaabbaabbaabba  =>  t= abbaabba
"""
s = input()
n = len(s)
for d in range(n // 2, 0, -1):
    if n % d == 0:
        #concatenam s[:d] de n//d ori
        t = s[:d] * (n // d)
        if t == s:
            print("t = ", s[:d], "\nk = ", n // d)
            break
else:
    print("nu este periodic")

#varianta 2 -
n = len(s)
for d in range(n // 2, 0, -1):
    if n % d == 0:
        #pentru fiecare pozitie x= d, 2d.. testam daca subsecventa dintre s si x+d este s[:d]
        for x in range(d,n,d):
            if s[x:x+d]!=s[:d]:
                break
        else:
            print("t = ", s[:d], "\nk = ", n // d)
            break
else:
    print("nu este periodic")