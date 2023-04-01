def suma(n, *, f=int): #valoare default (implicit calculeaza sum i=1,n)
    s=0
    for x in range(n):
        s=s+f(x)
    return s

print(suma(10))
from math import sqrt
print(suma(10,f=sqrt))
import math
print(suma(10,f=math.sqrt))
def f(x):
    return x**0.5
print(suma(10,f=f)) #merge


def suma(*numere, f=int):  # valoare default (implicit calculeaza sum i=1,n)
    s = 0
    for x in numere:
        s = s + f(x)
    return s
print(suma(2,3,4,5)) #are valoare default
ls=[3,1,7]
print(suma(*ls))
#print(suma(ls)) #EROARE
from math import sqrt
print(suma(4,9,16,f=sqrt))
import math
print(suma(4,9,16,f=math.sqrt))
def f(x):    return x**0.5
print(suma(4,9,16,f=f))
print(suma(f=f))#MERGE< da 0
#print(suma(3,sqrt))

f=open("numere.txt")
ls=(int(x) for x in f.read().split())
print(ls)
print(suma(*ls,f=lambda x:x*x))
f.close()