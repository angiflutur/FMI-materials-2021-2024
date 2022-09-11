"""Anagrame
"""

# test preliminar - trebuie sa aiba aceleasi lungimi

"""
Varianta 1 - Cautam fiecare litera din sirul a in sirul b; 
daca o gasim, atunci o stergem din b,
altfel a si n nu sunt anagrame 
- Complexitate O(n^2)
"""


def anagrame1(a, b):
    if len(a) != len(b):
        return False
    ok = False
    for x in a:
        poz = b.find(x)
        if poz == -1:
            break
        b = b[:poz] + b[poz + 1:]
    else:
        ok = True
    return ok


"""
Varianta 2 - determinam frecventele literelor care apar in a si in b si verificam daca sunt egale
Pentru aceasta putem proceda astfel
2a) - luam pe rand literele din a si determinam frecventa lor in b - Complexitate O(n^2)
2b) - folosim vector de frecvente - Complexitate O(n)
2c) - folosim dictionar de frecvente - Complexitate O(n) mediu
"""


# 2a) - luam pe rand literele din a si determinam frecventa lor in b - Complexitate O(n^2)
def anagrame2_a(a, b):
    if len(a) != len(b):
        return False
    ok = False
    # if set(a)==set(b):
    for x in a:  # suficient in set(a) + am fi putut pretesta set(a) == set(b)
        if b.count(x) != a.count(x):
            break
    else:
        ok = True
    return ok


# 2b) - folosim vector de frecvente - Complexitate O(n)
def anagrame2_b(a, b):
    if len(a) != len(b):
        return False
    nr_litere = ord('z') - ord('a') + 1
    fa = [0] * nr_litere
    fb = [0 for i in range(nr_litere)]  # TEMA - folosind doar fa, nu si fb
    for x in a:
        fa[ord(x) - ord('a')] += 1
    for x in b:
        fb[ord(x) - ord('a')] += 1  # Sugestie pentru Tema - scad cu 1 fa[ord(x) - ord('a')]
    ok = (fa == fb)
    return ok


# 2c) - folosim dictionar de frecvente - Complexitate O(n) mediu
def anagrame2_c(a, b):
    if len(a) != len(b):
        return False
    # diverse modalitati de a calcula dictionarul de frecvente asociat lui a

    # metoda 1 - folosind operatorul in
    d1 = {}
    for x in a:
        if x in d1:
            d1[x] += 1
        else:
            d1[x] = 1
    print("d1 = ", d1)

    # metoda 2 - cu get(x,0) pentru a nu mai testa daca valoarea x este deja cheie in s
    d2 = {}
    for x in a:
        d2[x] = d2.get(x, 0) + 1
    print("d2 = ", d2)

    # metoda 3 - initializand cu 0 valoarea pentru fiecare cheie posibila, adica pentru fiecare litera din a
    d3 = {x: 0 for x in set(a)}
    # SAU: d3=dict.fromkeys(set(s),0)
    for x in a:
        d3[x] = d3[x] + 1
    print("d3 = ", d3)

    db = {}
    for x in b:
        db[x] = db.get(x, 0) + 1
    print(db)

    ok = (d1 == db)
    return ok
    """
    #varianta - folosind comprehensiune - complexitate mai mare
    da = {litera: a.count(litera) for litera in set(a)}
    db = {litera: b.count(litera) for litera in set(b)}
    ok = (da == db)
    """


"""Varianta 3 - sortam ambele cuvinte (literele din ele) si testam daca obtinem acelasi cuvant
Complexitate - O(nlog n) (se poate si O(n) cu sortare prin numarare)"""


def anagrame3(a, b):
    if len(a) != len(b):
        return False
    ok = (sorted(a) == sorted(b))
    return ok


# programul principal

a = input()
b = input()
print(anagrame1(a, b))
print(anagrame2_a(a, b))
print(anagrame2_b(a, b))
print(anagrame2_c(a, b))
print(anagrame3(a, b))
