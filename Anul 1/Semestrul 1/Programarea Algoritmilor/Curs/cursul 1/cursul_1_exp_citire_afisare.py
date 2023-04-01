#variabile, afisare

x = 1
print(x,type(x)) #default: separa cu spatiu + endl la sfarsit

x="abc"
print(x,type(x))

x=2
y=3
print(x,'*',y,"=") #implicit end - este endl \n
print(x*y)

print(x,'*',y,"=",end="")  #am setat alt end=>nu mai trece la linie noua
print(x*y)

print(x, y,sep=" * ",end="=") # * separator intre x si y, iar = se pune la final
print(x*y)

print(x,y,x+y,sep="*",end="=")
print(3,0,sep="")

#citire

#input(mesaj optional) => un sir de caractere, citeste pana la sf liniei
x = input("x=") #intoarce un sir
print(x,type(x))

x = int(x)
print(x,type(x))

if x>0:
    print("ok")
else:
    print("nu e ok")
    print(zz)
