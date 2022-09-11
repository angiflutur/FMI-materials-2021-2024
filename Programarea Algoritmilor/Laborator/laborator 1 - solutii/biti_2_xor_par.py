n = int(input("n="))
print("dati sirul, cate un numar pe linie: ")
rez = 0
while n>0:
    x = int(input())
    rez = rez ^ x
    n -= 1
print("numarul cu numar impar de aparitii este", rez)