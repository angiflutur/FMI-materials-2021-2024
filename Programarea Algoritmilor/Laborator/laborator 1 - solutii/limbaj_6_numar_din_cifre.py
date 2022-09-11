n=int(input("n:"))
#numarul maxim - iau cifrele descrescator si le calculez frecventa
#se putea si cu vector de frecvente
m=0
for i in range(9,-1,-1):#!!!sa il ia si pe 0
    cn=n
    while cn>0:
        if cn%10==i:
            m=m*10+i
        cn=cn//10
print(m)


#numarul minim
m=0
p=1
#formam numarul minim fara cifra 0
for i in range(1,10):
    cn=n
    while cn>0:
        if cn%10==i:
            m=m*10+i
            p=p*10
        cn=cn//10
#inseram zerouri dupa prima cifra a lui m - ne trebuie o putere a lui 10 = nr cifre a lui m
p=p//10 #pt a izola prima cifra
p0=1
cn=n
while cn > 0:
    if cn % 10 == 0:
        p0 = p0 * 10
    cn = cn // 10
m=m//p*p0*p+m%p #!!p0*p - pun p0 zerouri dupa prima cifra, apoi alte p cate cifre avea de fapt dupa prima cifra
print(m)
