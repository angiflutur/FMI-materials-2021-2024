import random
"""
gen un numar natural cu cel mult 2 cifre
"""
x=random.randrange(0,100) #exclusiv 100, ex si randint
print(x)

"""
gen parola: 3 litere (mici sau mari) + 4 cifre
"""
import string
parola="".join(random.choices(string.ascii_letters, k=3))+"".join(random.choices(string.digits, k=4))
print(parola) #=>lista