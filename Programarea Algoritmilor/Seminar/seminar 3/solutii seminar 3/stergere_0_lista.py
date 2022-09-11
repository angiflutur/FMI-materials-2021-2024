ls=[1, 3, 4, 0, 5,6,7,0,12,18,0,0,0,9]
print(id(ls))
while 0 in ls:
    ls.remove(0)
print(ls)
print(id(ls))

ls=[1, 3, 4, 0, 5,6,7,0,12,18,0,0,0,9]
print(id(ls))
print("try")
try:
    i=0
    while True:
        poz=ls.index(0,i)
        ls.pop(poz)
        i=poz
except:
    pass
print(id(ls))


ls=[1, 3, 4, 0, 5,6,7,0,12,18,0,0,0,9]
print(id(ls))
ls[:] =[x for x in ls if x!=0] #!!!cu generator, nu e mem sulimentara
print(id(ls))

ls=[1, 3, 4, 0, 5,6,7,0,12,18,0,0,0,9]
print(id(ls))
ls[:] =(x for x in ls if x!=0)#!!!cu generator, nu e mem sulimentara
print(id(ls))