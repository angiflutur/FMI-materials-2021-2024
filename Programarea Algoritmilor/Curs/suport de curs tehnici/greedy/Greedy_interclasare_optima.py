from heapq import *
ls=[20,10,40,50,30,80,45]
i=0
h=[]
for x in ls:
    i=i+1
    heappush(h,(x,str(i)))
for j in range(len(ls)-1):
    s1=heappop(h)
    s2=heappop(h)
    print(s1,s2)
    i = i + 1
    #heappush(h,(s1[0]+s2[0],i))
    heappush(h,(s1[0]+s2[0],f"interclasare({s1[1]},{s2[1]})"))
print(h)

