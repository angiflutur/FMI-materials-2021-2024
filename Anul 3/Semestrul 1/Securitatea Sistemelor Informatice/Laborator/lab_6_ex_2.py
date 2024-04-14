from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import pad, unpad
key = b'O cheie oarecare'
data = b'testtesttesttesttesttesttesttesttesttesttesttest'

cipher = AES.new(key, AES.MODE_ECB)
rez = cipher.encrypt(data)

# a) Executați secvența de mai sus. Ce obțineți?
print("a) ", rez)
print()
# b) Ce mod de operare este folosit? Ce observați?
#    Algoritmul folosit este ECB
#    Secventa returneaza o codare identica

# c) Ați recomanda folosirea modului de operare de la b)? De ce? De ce nu?
#    Nu recomand folosira modului de operare de la b deoarece nu este sigur atunci cand avem
#    acelasi text, indiferent de lungimea lui, iar atacatorul poate sa sparga cu usurinta codul.

# d) Care este dimensiunea cheii? Dar a blocului?
#    Dimensiune cheie = 16
#    Dimensiune cheie = 48

# e) Modificați codul astfel încât să funcționeze dacă se înlocuiește valoarea data
# cu data=b'test'.
data=b'test'
# adaugam padding
data = pad(data, 16)
cipher = AES.new(key, AES.MODE_ECB)
print("e) ", cipher.encrypt(data))
print()

# f) Refaceți codul, schimbând modul de operare cu un alt mod de operare pe care
# îl considerați mai potrivit.
# folosim modul CCM ce suporta blocuri de orice dimensiune
# modificam cu CCM
cipher = AES.new(key, AES.MODE_CCM)
print("f) ", cipher.encrypt(data))




