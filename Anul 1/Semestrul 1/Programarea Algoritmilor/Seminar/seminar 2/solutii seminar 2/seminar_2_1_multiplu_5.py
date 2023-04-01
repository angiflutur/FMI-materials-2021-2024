"""1.	Se citesc două numere naturale a și b cu cel mult două cifre.
Să se afișeze toate numerele naturale pozitive de cel mult două cifre care se divid cu 5  și nu se află în intervalul
[a,b] (numerele se vor afișa pe aceeași linie, ordonate crescător, apoi descrescător)."""

# AFISARE CRESCATOR
# Varianta 1 - for cu pasul 5
a = int(input("a="))
b = int(input("b="))
if a > b:
    a = a ^ b
    b = a ^ b
    a = a ^ b
for i in range(5, a, 5):  # exclusiv a
    print(i, end=" ")
b5 = (b // 5 + 1) * 5  # primul multiplu de 5 mai mare decat b
# sau - alta metoda de a calcula b5
#b5 = b + 5 - b % 5  # primul multiplu de 5 mai mare decat b
for i in range(b5, 100, 5):
    print(i, end=" ")

print()

# varianta 2 - multiplul este de forma 5*i, cu for dupa i
if a % 5 == 0:
    a -= 1

for i in range(1, a // 5 + 1):
    print(i * 5, end=" ")

for i in range(b // 5 + 1, 20):
    print(i * 5, end=" ")
print()

# AFISARE DESCRESCATOR
# Varianta 1 - for cu pasul -5
for i in range(95,b,-5):
    print(i,end=" ")
a5=a//5*5
if a5==a: #excusiv a
    a5-=5
#sau - alta metoda de a calcula a5
#a5=a-a%5
for i in range(a5,1,-5):
    print(i,end=" ")
print()

# varianta 2 - multiplul este de forma 5*i, cu for dupa i

for i in range(19, b // 5 , -1):
    print(i * 5, end=" ")

if a % 5 == 0:
    a -= 1
for i in range(a // 5, 0, -1):
    print(i * 5, end=" ")


print()