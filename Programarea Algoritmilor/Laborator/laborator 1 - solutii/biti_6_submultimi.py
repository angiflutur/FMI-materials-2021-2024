n = int(input("n="))
p2n = 1 << n #2 la puterea n - numarul de submultimi
for x in range(p2n): #x=0,1,...,2**n-1 - reprezentarea binara a lui x codifica o submultime astfel: pozitiile bitilor egali cu 1 sun elementele submultimii
    elem = 1 #pozitia bitului curent

    while x > 0:
        if x & 1 == 1: #interogam ultimul bit din x
            print(elem, end=" ") #afisam pozitia bitului egal cu 1
        elem = elem + 1 #crestem numarul bitului la care am ajuns (pozitia)
        x = x >> 1 #stergem ultimul bit din x
    print()