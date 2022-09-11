#coada de prioritati 
#- la extragere  - este extras elementul cel mai mic/cel mare -O(log(n))

#modul heapq
#coada de prioritati min-heap -memoreaza ca un vector cu o proprietate particulara
import heapq
h=[] 
ls=[4,1,7,8,2]
for x in ls:
    heapq.heappush(h,x) #O(log(n))
while len(h)>0:
    print(h)
    x=heapq.heappop(h) #-O(log(n))
    print(x)