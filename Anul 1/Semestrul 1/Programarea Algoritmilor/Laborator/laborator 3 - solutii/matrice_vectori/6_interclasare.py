a=[1, 4, 6,7,10,12,18]
b=[4,7,10,15,18,22,27]
intersect=[]
reuniune=[]
i=0
j=0
while (i<len(a)) and (j<len(b)):
    if a[i]<b[j]:
        reuniune.append(a[i])
        i+=1
    elif a[i]==b[j]:
        reuniune.append(b[j])
        intersect.append(b[j])
        j+=1
        i+=1
    else:
        reuniune.append(b[j])
        j += 1
reuniune.extend(a[i:])
reuniune.extend(b[j:])
print(reuniune)
print(intersect)