# O(n^2)
"""
def citire(fisier):
    f = open(fisier)
    n = int(f.readline())
    ls = []
    i = 1
    for s in f:
        p = [int(x) for x in s.split()]
        ls.append((p[0], p[1], i)) # (profit, termen limita, nr de ordine)
        i += 1
    return n, ls

n, t = citire("profit_maxim.txt")
a_mx=0
activitati=[]
total=0
for i in range(n,0,-1): # (i-1,i)
    mx = -1 # profit maxim pentru activitatea cu termen >= i
    for x in t:
        if x[1]>=i:
            if x[0]>mx:
                mx=x[0]
                a_mx=x
    if mx>=0:
        activitati.append(a_mx[2])
        t.remove(a_mx)
        total+=mx
print(total)
print(*activitati[::-1])
"""
# O(n log n)
def citire(fisier):
    f = open(fisier)
    n = int(f.readline())
    ls = []
    i = 1
    for s in f:
        p = [int(x) for x in s.split()]
        ls.append((p[0], p[1], i)) # (profit, termen limita, nr de ordine)
        i += 1
    return n, ls

n, t = citire("profit_maxim.txt")
def cheie(ls):
    return -ls[1]
t.sort(key=cheie) # activitati ordonate descrescator dupa termenul limita
# print(t)
a_mx=0
activitati=[]
total=0
import heapq
h=[]
j=0
for i in range(n, 0, -1): # (i-1,i)
    while j<n and t[j][1]==i:
        heapq.heappush(h,(-t[j][0],t[j][2])) # am inserat in h tuplul (profit, indice),
                                            # mai intai profitul pt a fi primul criteriu de comparare
        j+=1
    if len(h)>0:
        a_mx=heapq.heappop(h)
        activitati.append(a_mx[1])
        total-=a_mx[0]
print(total)
print(*activitati[::-1])


