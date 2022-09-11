s = [int(x) for x in input().split()]
k = int(input())
suma = suma_min = sum(s[:k])
poz = 0
for i in range(k, len(s)):
    suma = suma + s[i] - s[i - k]
    if suma < suma_min:
        suma_min = suma
        poz = i - k + 1
s[poz:poz + k] = []
print(s)
