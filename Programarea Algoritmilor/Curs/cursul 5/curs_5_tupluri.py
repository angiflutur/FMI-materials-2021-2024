#TUPLURI tipul(clasa) tuple
# secvente imutabile (Similare listelor, dar nu putem atribui unui element o valoare
#operatori, metode - cele comune secventelor (count, index, in, not in, <,>=...),
# t[-1], t[1:5]

#Creare

t = (1,3,4) #incadrat de ()
x=4;y=5;z=7
t =(x,y,z)
print(t,type(t))

t= x,y,z #parantezele pot lipsi
print(t,type(t))

t=()
print(t,type(t))

#DIFERENTA!! - tuplul cu un element
t=(2) #t=2
print(t,type(t)) #t este int
t=(2,) #tuplu cu un element
print(t,type(t))

#tuple(iterabil)
t=tuple("Abc")
print(t)
t=tuple(range(4))
print(t)

#COMPREHENSIUNE - nu - este generator !!DIFERENTE
t=(i*i for i in range(1,10))  #formula(regula) de generare
print(t)
print(next(t)) #a generat primul element
print(t)
print(sum(t)) #genereaza in continuare toate elementele din t
print(sum(t)) #t ramane gol, s-au generat deja toate elementele => suma da 0

ls=[20]
ls[1:]=(i*i for i in range(1,10))
print(ls)
ls=[20]
ls[1:]=[i*i for i in range(1,10)]
print(ls)

#IMUTABIL
t=(3,6,7)
#t[0] = 5 #NU se poate

t=([3,5],6,7)
t[0][1] = 12 #se poate, nu modific referinta t[i], ci valoarea obiectului
print(t)




#atriburie de tupluri
x=5;y=7
x,y =y,x

x,y,z,t = 1,7,8,9
print(x,y,z,t)

x,*y=1,7,8,9 #* - impachetare
print(x,y,type(y)) #y - lista

ls=[1,2,3,4]
print(ls)
print(*ls)

print(range(5))
print(*range(5))


#functie care returneaza mai multe valori
def f(x,y,z):
    return x+y, x+z, y+z #pot lipsi paranteleze => tuplu

t = f(3,4,5)
print("rezultat = ",t,type(t))
s1,s2,s3=f(3,4,5)
print(s1,s2,s3,type(s1))

s1,*s2=f(3,4,5)
print(s1,s2)

ls=[5,7,8]
#f(ls) - NU
t=f(*ls)
print(t)

