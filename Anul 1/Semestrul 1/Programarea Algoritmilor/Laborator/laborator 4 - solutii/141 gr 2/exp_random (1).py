
"""
generarea unui numar natural de cel mult doua cifre
"""
import random
print(random.randrange(0,100)) #exclusiv 100


""" Se va scrie o funcție care generează parola - 3 litere mici și 4 cifre"""
import string
print("".join(random.choices(string.ascii_lowercase,k=3))+"".join(random.choices(string.digits,k=4)))

