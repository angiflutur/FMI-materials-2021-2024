from Cryptodome.Cipher import DES

def generate_key(x):
    return (x * 16).to_bytes(1, byteorder="little") + b'\x00\x00\x00\x00\x00\x00\x00'

crypted = dict()
plain_text = "Provocare MitM!!"

# generam chei
# criptam textul nostru cu fiecare din aceste chei cu modul ECB
# retinem textul criptat si cheia intr-un dictionat
# pentru a gasi cheile potrivite pentru textul nostru
for nr in range(16):
    key = generate_key(nr)
    cipher = DES.new(key, DES.MODE_ECB)
    ciphertext = cipher.encrypt(plain_text.encode("utf-8"))
    crypted[ciphertext] = key

encrypted_text = b"G\xfd\xdfpd\xa5\xc9'C\xe2\xf0\x84)\xef\xeb\xf9"

# generam din nou 16 chei
# decriptam textului de mai sus
# cu cheia curenta generata

# cautam o decriptare care coincide cu
# o criptare facuta mai sus
for nr in range(16):
    key = generate_key(nr)
    cipher = DES.new(key, DES.MODE_ECB)
    ciphertext = cipher.decrypt(encrypted_text)
    if ciphertext in crypted:
        first_key = crypted[ciphertext]
        print("Prima cheie: ", first_key)
        print("A doua cheie: ", key)

