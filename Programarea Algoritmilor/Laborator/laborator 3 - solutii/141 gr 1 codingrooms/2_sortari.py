"""
Se citește un vector de numere naturale (cu elementele date pe o linie, separate prin spațiu). Să de ordoneze elementele din vector crescător după suma cifrelor, iar în caz de egalitate, descrescător după valorile lor v = [11, 45, 20, 810, 179, 81, 1000] => v = [1000, 20, 11, 810, 81, 45, 179]
"""

"""
v.sort(reverse=True/False, key = cheie_element) =>Se modifica v
v_ord=sorted(v,reverse=True/False, key = cheie_element) =>nu se modifica v
"""
def cheie_suma(element):
    s=sum([int(c) for c in str(element)]) #suma cifrelor
    return s


v = [11, 45, 20, 810, 179, 81, 1000]
v.sort(key = cheie_suma) #cresc dupa suma, in caz de egalitate - se pastreaza ordinea initiala (sortare stabila)
print(v)

def cheie_suma_valoare(element):
    #mai multe criterii - returnam un tuplu
    s=sum([int(c) for c in str(element)]) #suma cifrelor
    return (s, element)


v = [11, 45, 20, 810, 179, 81, 1000]
v.sort(key = cheie_suma_valoare) #cresc dupa suma, in caz de egalitate - se pastreaza ordinea initiala (sortare stabila)
print(v)

def cheie_suma_valoare_descr(element):
    #mai multe criterii - returnam un tuplu
    s=sum([int(c) for c in str(element)]) #suma cifrelor
    return s, -element


v = [11, 45, 20, 810, 179, 81, 1000]
v.sort(key = cheie_suma_valoare_descr) #cresc dupa suma, in caz de egalitate - se pastreaza ordinea initiala (sortare stabila)
print(v)
