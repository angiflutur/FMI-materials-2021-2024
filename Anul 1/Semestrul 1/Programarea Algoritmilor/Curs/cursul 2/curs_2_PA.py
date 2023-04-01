x=5
y=7
x,y=y,x
print(x,y)
x=12
print(x,y)

print(range(1,10))
print(*range(1,10))

#primul divizor propriu al lui n, mesaj daca nu exist
n=int(input("n="))
for d in range(2,n//2+1):
    if n%d == 0:
        print(d)
        break
else: #daca nu am terminat for-ul cu break
    print("nu are divizori propri")

s="programare"
print(s[5:2])
print(s[5:2:-1])
print(s[5::-1])

from sys import exit #merge si fara, e importat in genere implicit site care contine exit
x=3 #x=4
if x==3:
    exit()

print("nu am iesit")
