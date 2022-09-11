"""
6.	Se dă o listă de numere reale (toate elementele sale se vor da pe o linie separate prin spațiu). Să se insereze câte un 0 după fiecare element negativ (fără a folosi liste suplimentare)

Inserare pe pozitia i:
ls.insert(i,0)
ls[i:i]=[0]
"""
ls=[1,-3,7,-9,-5,12,-8]
i=0
while i<len(ls): #for i in range(len(s)) => i in [0,1,2,3,4,5,6]
    if ls[i]<0:
        ls.insert(i+1,0) #ls[i+1:i+1]=[0]
        i+=1
    i+=1
print(ls)
