import time
nr_concatenari = 10000

ls=list(range(50))

start = time.time()
lista=[]
for i in range(nr_concatenari):
    lista.extend(ls)
stop = time.time()
print("Extend: ", stop - start, "secunde")

start = time.time()
lista = []
for i in range(nr_concatenari):
    lista+=ls
stop = time.time()
print("Operatorul +=: ", stop - start, "secunde")

start = time.time()
lista = []
for x in range(nr_concatenari):
 lista = lista + ls
stop = time.time()
print(" Operatorul +: ", stop - start, "secunde")
