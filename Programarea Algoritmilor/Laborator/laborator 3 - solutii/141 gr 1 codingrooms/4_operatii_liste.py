"""
4.	Se dă o listă de numere naturale și un număr natural k. Să se elimine din listă subsecveța de lungime k de sumă minimă (dacă sunt mai multe se va elimine prima = cea mai din stânga) – fără a folosi liste suplimentare 
"""
k = 3
ls = [7,1,2,0,8,9,23,8,1,1,1] #=>[7,8,9,23,8,1,1,1]
#sum(ls[:k])

k = int(input("K="))
a = [int(x) for x in input().split()]

sum = sum(a[:k])
sum_min = sum

n = len(a)
poz = 0
for i in range(k, n): #i este unde se termina secventa
    #sum=sum(a[i-k+1:i+1]) => O(k)
    sum += a[i] #=>O(1)
    sum -= a[i-k]
    if sum < sum_min:
        sum_min = sum
        poz = i-k+1
a[poz:poz+k] = []
print(a)