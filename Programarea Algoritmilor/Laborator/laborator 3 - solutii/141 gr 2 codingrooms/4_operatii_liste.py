"""
4.	Se dă o listă de numere naturale și un număr natural k. Să se elimine din listă subsecveța de lungime k de sumă minimă (dacă sunt mai multe se va elimine prima = cea mai din stânga) – fără a folosi liste suplimentare 
"""
k=3
ls=[10,3,1,4,2,1,3,7,2,2,2,1,1] #=>[10,3,1,4,7,2,2,2]


#varianta 1 - suma secventei care incepe pe pozitia i - calculata de fiecare data, cu sum

#ls=[int(x) for x in input("Sirul este ").split()]
#k= int(input("K este "))

j=0
i=1
min1=sum(ls[:k])

while i+k<=len(ls): #merge si for i in range(len(ls)-k+1)
    if sum(ls[i:i+k])< min1:
        min1=sum(ls[i:i+k])
        j=i
    i+=1
#ls[:]=ls[:j]+ls[j+k:]
del ls[j:j+k]

print(ls)

#varianta 2 - suma secventei care incepe pe pozitia i - calculata 
#in functie de suma subsecventei care incepe pe pozitia i-1

#ls=[int(x) for x in input("Sirul este ").split()]
#k= int(input("K este "))

k=3
ls=[10,1,3,1,4,2,1,3,7,2,2,2,1,10]

j=0
i=1

s=min1=sum(ls[:k])

while i+k<=len(ls): #merge si for i in range(len(ls)-k+1)
    s=s-ls[i-1]+ls[i+k-1] #sum(ls[i:i+k])
     
    if s< min1:
        min1=s
        j=i
    i+=1
#ls[:]=ls[:j]+ls[j+k:]
del ls[j:j+k]

print(ls)
