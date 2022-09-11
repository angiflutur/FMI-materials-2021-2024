ls=[1, 3, 4, 0, 5,6,7,0,12,18,0,9]
if ls.count(0)>1:
    i=ls.index(0)
    j=ls.index(0,i+1)
    del ls[i:j+1] #ls[i:j+1]=[]
    print(ls)
