"""7.	Se citește un șir de caractere și un număr natural k.
Să se șteargă din s caracterul de pe poziția k (pozițiile numerotate de la 0) și să se afișeze șirul nou obținut.
"""
s = input("cuvant=")
k = int(input("k="))
s = s[:k]+s[k+1:]
print(s)