def pozitiv(x):
    return x>0

def filtreaza(*lista, functie = None):
    if functie == None:
        return list(lista)
    return [x for x in lista if functie(x)]

l = filtreaza(3,-1,6,8,-3,pozitiv)
print(l)
a=filtreaza("ana","are","10","mere", functie=str.isalpha)
print(a)
a = filtreaza(3,-1,6,8,-3,functie=pozitiv)
print(a)
a = filtreaza(3,-1,6,8,-3)
print(a)
a = filtreaza("ana","are","10","mere",functie=str.isalpha)
print(a)




def filtreaza(*lista, functie=None):
    if functie == None:
        return (x for x in lista)
    return (x for x in lista if functie(x))


a = filtreaza(3,-1,6,8,-3,functie=pozitiv)
print(a)
print(*a)
print(sum(a))
print(*filter(pozitiv,[3,-1,6,8,-3]))
print(*filter(None,[3,-1,6,8,-3]))
print(list(map(abs,[3,-1,6,8,-3])))
