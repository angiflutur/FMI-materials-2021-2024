"""
3.	Se dă o listă de numere naturale. Să se șteargă din listă toate zerourile    
"""
ls=[0,0,45,0,0,12,7,80,11,0]

#varianta 1
while 0 in ls:
    ls.remove(0) #sterge prima aparitie a elementului 0
print(ls)

#varianta 2
ls=[0,0,45,0,0,12,7,80,11,0]
print(id(ls))
ls[:]=[x for x in ls if x!=0]
#ls=[x for x in ls if x!=0] #nu se modifica obiectul memorat in ls, ci ls arata catre un nou obiect, se modifica id(ls)
print(ls)
print(id(ls))

#cu generator
ls=[0,0,45,0,0,12,7,80,11,0]
ls[:]=(x for x in ls if x!=0)
print(ls)

"""
t=(x for x in ls if x!=0)
ls[:]=t
print(ls)
print("generator",list(t)) #lista vida
"""



#ls[:]="abdc"

#varianta 3 - cu index si pop/del
try:
    ls=[0,0,45,0,0,12,7,80,11,0]
    poz=0
    while True:
        poz=ls.index(0,poz)
        ls.pop(poz) #del ls[poz]
    print(ls)
except:
    pass



