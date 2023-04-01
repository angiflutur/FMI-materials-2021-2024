#SECVENTE - colectii indexate de la 0
#Recapitulare:

#aceesarea unui element s[i], s[-1], feliere s[1:4:2]

#parcurgere for x in s

#Functii uzuale: len, min, max

#opertori in, not in

#operatori relationali >, >=  - comparare element cu element
print("xy">"abc") #adevarata x>a
print([3,2]>[1,4,7]) #nu se compara dupa lungime, ci element cu element 3 > 1

#concatenare: +, *
s="abc"
t="xy"
s1=s+t #obiect nou, copiaza continutul lui s apoi al lui t
print(s1, id(s1), id(s))

l1=[1,2,3]
l2=[4,5]
l_rez=l1+l2
print(l_rez)
l_rez[0]=75
print(l_rez,l1,l2) #l1 nu se modifica

l1=[[1,8],2,3]
l2=[4,5]
l_rez=l1+l2
print(l_rez)
l_rez[0]=75 #l_rez[0] - arata catre un nou obiect
print(l_rez,l1,l2) #l1 nu se modifica

l1=[[1,8],2,3]
l2=[4,5]
l_rez=l1+l2
print(l_rez)
l_rez[0][0]=87 #modifica valoarea obiectului l_rez[0], care este acelasi cu l1[0]
print(l_rez,l1,l2)

#*n => concatenare de n ori
s="abc"
print(s*10)
l1=[0]*10
print(l1)
l1[0]=4
print(l1)
l2=[[0,0]]*10
print(l2)
l2[0][0]=13
print(l2)
l2[0]=14
print(l2)

#metode de cautare in secvente

#s.count(x,i,j) i si j optionali - numara aparitiile lui x in s[i:j] (i, j optionali, daca nu se transmit numara in tot sirul,
# altfel cauta de la i la j exclusiv, ca la feliere si range))
s="Programarea algoritmilor"
print(s.count('a'),s.count('a',6),s.count('a',6,10),s.count('b'))

#s.index(x,i,j) i si j optionali - prima pozitie pe care apare x in s[i:j]
#daca nu gaseste x in s => da eroare ValueError

s="Programarea algoritmilor"
p=s.index('a')
print("prima aparitie a lui a este pe pozitia",p)
print("a doua aparitie a lui a este pe pozitia",s.index('a',p+1))

try:
    print("prima aparitie a lui b este pe pozitia",s.index('b'))
except: #daca una dintre instructiunile din try da eroare
#except ValueError:
    print("b nu apare")

s="Programarea algoritmilor"
"""
p = -1
while True:
    p = s.index('a', p + 1) #eroare => se opreste executia programului
    print(p)

"""
try:
    while True:
        p = s.index('a',p+1)
        print(p)
except:
    pass

print("continuam cu secventele")

#sorted(s,reverse,key) => o noua lista(!!!) ordonata (!!!nu modifica obiectul)

ls=[3,8,2,5]
ls1=sorted(ls,reverse=True)
print("lista initiala",ls) #nu s-a modificat
print("lista ordonata descrescator",ls1)
print( ls.sort()) #modifica ls, nu returneaza lista sortata

s="algoritm"
print(sorted(s)) #rezultatul este o lista de caractere

print("".join(sorted(s)))





