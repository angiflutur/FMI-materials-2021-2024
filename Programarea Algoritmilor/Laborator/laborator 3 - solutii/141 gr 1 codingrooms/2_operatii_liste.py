"""
2.	Se dă o listă de numere naturale. Să se șteargă din listă subsecvența delimitată de primele două zerouri din listă (inclusiv zerourile)
"""

#if ls.count(0)>1:

try:

    ls = [2,4,0,5,6,12,13,0,4,0,0,5,0,0]
    ls = [3,4]
    poz1 = ls.index(0)
    poz2 = ls.index(0,poz1+1) 
    del ls[poz1:poz2+1] # echivalent cu ls[poz1:poz2+1]=[] 
    print(ls)

    #varianata 2 - cu lista intermediara (!memorie in plus)
    ls = [2,4,0,5,6,12,13,0,4,0,0,5,0,0]

    print(ls,id(ls))
    ls=ls[:poz1]+ls[poz2+1:]  #nu a modificat lista initiala, a creat un obiect nou
    print(ls,id(ls))
    print()

    ls = [2,4,0,5,6,12,13,0,4,0,0,5,0,0]
    print(ls,id(ls))
    ls[:]=ls[:poz1]+ls[poz2+1:]  #a modificat lista initiala, a creat un obiect nou
    print(ls,id(ls))

    #v=sorted(v)
    #v.sort()
except:
    print("nu avem doua zerouri in lista")


