"""Se dă o listă de numere reale (toate elementele sale se vor da pe o linie separate prin spațiu). Să se insereze câte un 0 după fiecare element negativ (fără a folosi liste suplimentare)
"""
#inserare in lista pe pozitia poz a unui element x:
#ls[poz:poz]=[x]
#ls.insert(poz,x)

ls = [3,5,-1,-7,5,-8,1,-4,-5,-6,5]

"""
#solutia cu for - considera doar atatea elemente cat era lungimea initiala a listei

#range(len(ls)) => range(0,8) [0,1,2,3,4,5,6,7]
for i in range(len(ls)): #n=len(ls) for (i=0;i<n;i++)  
    if ls[i]<0:
       ls.insert(i+1,0)
       i=i+1
    i=i+1
print(ls)
"""

ls = [3,5,-1,-7,5,-8,1,-4]
i=0
while i<len(ls):
    if ls[i]<0:
       ls.insert(i+1,0) #ls[i+1:i+1]=[0]
       i=i+1
    i=i+1
print(ls)

