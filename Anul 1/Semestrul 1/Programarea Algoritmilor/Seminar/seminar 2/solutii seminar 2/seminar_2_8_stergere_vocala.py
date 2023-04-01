"""7.	Se citește un șir de caractere și un număr natural k.
Să se șteargă din s caracterul de pe poziția k (pozițiile numerotate de la 0) și să se afișeze șirul nou obținut.
"""
s = input("cuvant=")
for i in range(len(s)):
    if s[i].lower() in "aeiou":
        s = s[:i]+s[i+1:]
        #s = s.replace(s[i], "" , 1)
        break
print(s)