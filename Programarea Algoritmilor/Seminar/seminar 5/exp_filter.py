def filtreaza(*items, functie = bool):
    ls = []
    for x in items:
        if functie(x):
            ls.append(x)
    return ls



def pozitiv(x):
    return x>0
a = filtreaza(3,-1,6,8,-3,functie=pozitiv)
print(a)
a = filtreaza(3,-1,6,8,-3)
print(a)
a = filtreaza("ana","are","10","mere",functie=str.isalpha)
print(a)

a = filtreaza(3,-1,6,0,8,-3,0)
print(a)


#filtrare cu functia filter

def paritate(x):
    return x%2==0
lista = [1,2,3,4,5,6]
a = filter(paritate,lista)
#print(list(a))
print("lista afisata cu *",*a)
ls=[3,-1,6,0,8,-3,0]
b = filter(None,ls)
print(*b)
