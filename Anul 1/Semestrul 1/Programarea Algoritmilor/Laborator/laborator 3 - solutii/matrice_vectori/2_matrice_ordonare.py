"""
2.	Se citesc m, n și o matrice cu m linii si n coloane
(numerele sunt date câte unul pe linie).
Să se ordoneze crescător elementele de pe prima coloana
prin interschimbări de linii și să se afișeze matricea obținută
(fiecare element se va afișa pe 5 caractere)."""

m=5
n=3
a=[[4,1,2],[1,6,7],[10,6,9],[2,9,1],[2,7,4]]


a.sort()
for linie in a:
    for x in linie:
        print(f"{x:4}",end="")
    print()
"""
for i in range(m):
    for j in range(i+1,m):
        if a[i][0]>a[j][0]:
            a[i],a[j]=a[j],a[i]
for linie in a:
    for x in linie:
        print(f"{x:4}",end="")
    print()

"""