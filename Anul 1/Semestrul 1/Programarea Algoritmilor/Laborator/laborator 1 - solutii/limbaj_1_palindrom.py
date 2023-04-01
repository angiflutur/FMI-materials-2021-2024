n=int(input())
inv=0
aux=n
while aux:
    inv=inv*10+aux%10
    aux//=10

print("da" if inv==n else "nu")