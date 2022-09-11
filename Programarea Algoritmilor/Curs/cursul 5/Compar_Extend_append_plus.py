#lista de la 0,1.. la nr_elemente
nr_elemente = 100_000
import time
start = time.time()
lista = [x for x in range(nr_elemente)]
stop = time.time()
print(" Comprehensiune: ", stop - start, "secunde")

start = time.time()
lista = []
for x in range(nr_elemente):
  lista.append(x)
stop = time.time()
print("Metoda append(): ", stop - start, "secunde")

start = time.time()
lista = []
for x in range(nr_elemente):
  lista += [x]
stop = time.time()
print(" Operatorul +=: ", stop - start, "secunde")

start = time.time()
lista = []
for x in range(nr_elemente):
  lista = lista + [x]
stop = time.time()
print(" Operatorul +: ", stop - start, "secunde")
