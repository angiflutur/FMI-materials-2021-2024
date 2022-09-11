"""2.	Se dau nouă numere naturale a și b.
Să se afișeze cel mai mic număr Fibonacci din intervalul [a,b].
"""

a = int(input())
b = int(input())
f1 = 1
f2 = 1
while f2 < a:
    f1, f2 = f2, f1 + f2
if f2 <= b:
    print(f2)
else:
    print("nu exista")
