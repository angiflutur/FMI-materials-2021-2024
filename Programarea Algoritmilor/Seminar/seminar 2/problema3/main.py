n=int(input("n="))


x=0
y=1

while y<=n :
      x,y=y,x+y
n=n-x
print(x)
while n!=0:
    if y<=n :
        print(y)
        n=n-y
    x,y=y-x,x
