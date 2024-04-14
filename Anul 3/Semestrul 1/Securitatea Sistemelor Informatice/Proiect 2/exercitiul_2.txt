import os
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
import hashlib

def read(file_path):
    with open(file_path, 'rb') as ppm_file:
        header = b''
        # salvez primele 3 linii din fiecare ppm
        # aceste linii reprezentand headerul
        for _ in range(3):
            header += ppm_file.readline()

        # formez string-ul de forma "P6 x y 255"
        header = header.replace(b'\n', b' ')
        header = header[0:-1]

        # hash-uiesc header-ul
        hash_header = hashlib.sha256(header).hexdigest()

        # afisez headerul in forma "P6 x y 255" si hash-ul respectiv
        print(header, hash_header)
        image_content = ppm_file.read()
    return header, image_content

def write(file_path, header, encrypted_content):
    with open(file_path, 'wb') as output_file:
        # atasez si headerele fisierelor
        output_file.write(header + encrypted_content)

def criptare_ECB(input_image, output_image):
    header, image_content = read(input_image)

    # generam o cheie random pentru fiecare imagine in parte
    key = os.urandom(16)

    # initializam criptarea AES ECB
    cipher = AES.new(key, AES.MODE_ECB)

    # adaugam padding - adaugam octeti pentru a ne asigura ca
    # lungimea este multiplu de 16
    padded_content = pad(image_content, 16)

    # criptam imaginea
    encrypted_content = cipher.encrypt(padded_content)

    write(output_image, header, encrypted_content)

files = ["1.A.ppm",
         "2.N.ppm",
         "3.G.ppm",
         "4.E.ppm",
         "5.L.ppm",
         "6.I.ppm",
         "7.C.ppm",
         "8.A.ppm"]

for file in files:
    output_ppm = "encrypted_" + file
    criptare_ECB(file, output_ppm)
