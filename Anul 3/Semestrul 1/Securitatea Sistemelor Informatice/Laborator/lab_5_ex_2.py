import hashlib
import secrets
import string

# Generează o parolă de minim 10 caractere care conține:
        # - cel puțin o literă mare,
        # - o literă mică,
        # - o cifră
        # - și un caracter special (.!$@).
# La ce poate să folosească într-o aplicație informatică această funcționalitate? Dați
# exemplu de un scenariu de utilizare
def generareParola():
    # facem cate un string pentru fiecare categorie
    litereMici = string.ascii_lowercase
    litereMari = string.ascii_uppercase
    cifre = string.digits
    caractereSpeciale = '.!$@'

    alfabet = litereMici + litereMari + cifre + caractereSpeciale

    # alegem un caracter random din fiecare categorie
    random = secrets.choice(litereMici) + secrets.choice(litereMari) + secrets.choice(cifre) + secrets.choice(caractereSpeciale)

    return random + ''.join(secrets.choice(alfabet) for _ in range(6))
print('Parola minim 10 caractere: ', generareParola())
# utilizare: generare parole random in aplicatii

# Generează un string URL-safe de (cel puțin) 32 caractere.
# La ce poate să folosească într-o aplicație informatică această funcționalitate? Dați
# exemplu de un scenariu de utilizare

print('String URL: ', secrets.token_urlsafe(32))
# utilizare: token asignat sesiunii de autentificare a utilizatorului

# Generează un token hexazecimal de (cel puțin) 32 cifre hexazecimale.
# La ce poate să folosească într-o aplicație informatică această funcționalitate? Dați
# exemplu de un scenariu de utilizare (diferit de scenariul anterior).

print('Token hexa: ', secrets.token_hex(32))
# criptarea mesajelor

# Verifică dacă 2 secvențe sunt identice sau nu, minimizând riscul unui atac de timp
# (timing attack).
print('2 secvente identice: ', secrets.compare_digest("flutur", "angi"))

# Generează o cheie fluidă binară care ulterior să poată fi folosită pentru criptarea
# unui mesaj de 100 caractere
print('Cheie binara: ', secrets.randbits(100 * 5))  #returneaza un int cu 100*5 biti

# Stochează parole folosind un modul / o librărie care să ofere un nivel suficient de
# securitate. Ce ați folosit? De ce?
def hashPassword(password):
    hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
    return hashed_password

print('Parola hashlib: ', hashPassword('angi'))
