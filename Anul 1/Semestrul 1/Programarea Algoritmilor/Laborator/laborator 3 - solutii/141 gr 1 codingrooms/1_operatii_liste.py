"""
1.	Se dau două liste l1 si l2 de lungime n. Să se înlocuiască elementele de pe poziții (numerotate de la 1) pare din l1 cu cele de pe poziția corespunzătoare din l2 folosind feliere (slice) 
"""
l1 = [int(x) for x in input().split()] #l1=[1,2,5,6]
l2 = [int(x) for x in input().split()] #l2=[8,12,11,15] =>l1=[1,12,5,15]
l1[1::2]=l2[1::2]
print(l1)
