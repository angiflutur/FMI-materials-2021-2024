"""2.	Se dă o listă de numere naturale. Să se șteargă din listă subsecvența delimitată de primele două zerouri din listă (inclusiv zerourile)
"""
ls = [1,0,3,4,5,0,19,7,0,24,0] #=>[1,19,7,0,24,0]

#ls = [1,10,3,4,5,10,19,7,0,24,10]

try:
    poz1=ls.index(0)
    poz2=ls.index(0,poz1+1)
    ls[poz1:poz2+1]=[] #del ls[poz1:poz2+1]
    print(ls)
except:
    print("lista nu contine doua zerouri") 
