ls=[1,1,2,2,2,2,3,3,4,5,5]
n=len(ls)
i=0
while i<len(ls):
    j=i+1
    while j<len(ls) and ls[j]==ls[j-1]:
        j+=1
    ls[i:j]=[ls[i]]
    i=i+1
print(ls)
