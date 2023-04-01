"""2.	Se citește un vector de numere naturale
(cu elementele date pe o linie, separate prin spațiu).
Să de ordoneze elementele din vector crescător după suma cifrelor,
iar în caz de egalitate, descrescător după valorile lor """
#v = [11, 45, 20, 810, 179, 81, 1000] => v = [1000, 11, 20, 45, 81, 810, 179]

def cifre(x):
    s=0
    cx=x
    while cx>0:
        s+=cx%10
        cx//=10
    return s,-x

v = [11, 45, 20, 810, 179, 81, 1000]
v.sort(key=cifre)
print(v)