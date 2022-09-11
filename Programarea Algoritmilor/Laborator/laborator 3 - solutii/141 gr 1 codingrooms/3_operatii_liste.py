"""
3.	Se dă o listă de numere naturale. Să se șteargă din listă toate zerourile    
"""

#varianta 1 
#ls.remove(element) - sterge prima aparitie a elementului
ls=[0,0,0,3,1,0,0,5,0,0,7,8,0,0]
while 0 in ls: #parcurgere lista de mai multe ori
    ls.remove(0)
print(ls)

#varianta 2 - cautam cu index toate aparitiile lui 0

try :
    ls=[0,0,0,3,1,0,0,5,0,0,7,8,0,0]
    poz=0
    while True :
        poz=ls.index(0,poz)
        del ls[poz] #ls.pop(poz)
except :
    print(ls)

#varianta 3 - cu comprehensiune
ls=[0,0,0,3,1,0,0,5,0,0,7,8,0,0]
ls[:]=[x for x in ls if x!=0]
print(ls)

ls=[0,0,0,3,1,0,0,5,0,0,7,8,0,0]
ls[:]=(x for x in ls if x!=0)
print(ls)

ls=[0,0,0,3,1,0,0,5,0,0,7,8,0,0]
t = (x for x in ls if x!=0) #nu e tuplu, e generator
print(t,type(t))
ls[:] = t
print(list(t))
print(ls)