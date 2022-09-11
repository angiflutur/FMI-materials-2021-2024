"""
1. Se dau două liste l1 si l2 de lungime n. Să se înlocuiască elementele de pe poziții pare din l1 cu cele de pe poziția corespunzătoare din l2 folosind feliere (slice); 
pozitiile se numeroteaza de la 1
"""
l1=[int(x) for x in input().split()] #l1=[2,4,5,7]
l2=[int(x) for x in input().split()] #l2=[8,1,6,2]  =>l1=[2,1,5,2]
l1[1::2]=l2[1::2]
print(l1)