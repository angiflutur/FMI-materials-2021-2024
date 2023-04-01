def CounterFreq(nume_fisier):
    f = open(nume_fisier)
    freq = {}
    
    for linie in f:
        for c in linie:
            if c in freq:
                freq[c]+=1
            else:
                freq[c] = 1
    
    return freq

def cheie(element):
    if element.isalnum():
        return 0, element
    else:
        return 1, element

vector_frecventa_1 = CounterFreq("caractere1.in")
vector_frecventa_2 = CounterFreq("caractere2.in")

set_intersectie = vector_frecventa_1.keys() & vector_frecventa_2.keys()

for it in sorted(set_intersectie, key = cheie):
    print(repr(it), vector_frecventa_1[it] + vector_frecventa_2[it])
    

