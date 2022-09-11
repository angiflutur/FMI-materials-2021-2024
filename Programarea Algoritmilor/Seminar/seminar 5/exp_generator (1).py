def pozitiv(x):
    return x>0
def filtreaza(*items, functie = None):
    if functie is None:
        ls = [x for x in items ]
    else:
        ls = [x for x in items if functie(x) ]
    return ls

a = filtreaza(3,-1,6,8,-3,functie=pozitiv)
print(a)
print(sum(a))

def filtreaza_g(*items, functie = None):
    if functie is None:
        ls = (x for x in items )
    else:
        ls = (x for x in items if functie(x))
    return ls

a = filtreaza_g(3,-1,6,8,-3,functie=pozitiv)
print(a)
print(sum(a))
print(*a)
print(sum(a))

def genereaza_patrate(n):
    for k in range(1,n+1):
        yield k*k

for x in genereaza_patrate(5):
    print(x, end=" ")

print()
t=genereaza_patrate(10)
print(next(t))
print(next(t))
print(list(t))
print(sum(t))

