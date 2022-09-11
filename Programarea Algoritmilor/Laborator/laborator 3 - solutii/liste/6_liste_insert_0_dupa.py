s=[float(x) for x in input().split()]
i=0
while i<len(s):
    if s[i]<0:
        s[i+1:i+1]=[0] #nu 0
        #s.insert(i+1,0)
        i=i+1
    i=i+1
print(s)

