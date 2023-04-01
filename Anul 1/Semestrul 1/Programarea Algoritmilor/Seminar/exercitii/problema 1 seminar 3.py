#a
s=input("s=")
rez= s.translate(str.maketrans(".,;:!?","      "))
rez=rez.split()
rez.sort()
rez=" ".join(rez)
print(rez)

#b
sir=input("sir=")
s=input("s=")
t=input("t=")
ls=sir.split()
sir=""
ls=[t if x==s else x for x in ls]
sir= " ".join(ls)
print(sir)
#doar daca sunt separate prin spatiu