a = int(input())
b = int(input())

for i in range(5,100,5):
    if i < a or i > b:
        print(i,sep=" ",end=" ")

print()

if a%5!=0:
    c=a//5*5
else:
    c=a//5*5-5
for i in range(95,b,-5):
  print(i,sep=" ",end=" ")
for i in range(c,4,-5):
    print(i,sep=" ",end=" ")