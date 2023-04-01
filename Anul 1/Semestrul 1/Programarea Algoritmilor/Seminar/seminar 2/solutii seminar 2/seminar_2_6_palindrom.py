"""6.	Se citește un cuvânt s.
Să se verifice dacă s este palindrom sau semipalindrom (format din două jumătăți egale)"""
s=input()
if s==s[::-1]:
    print("palindrom")
if (len(s)%2==0) and (s[:len(s)//2]==s[len(s)//2:]):
    print("semipalindrom")
