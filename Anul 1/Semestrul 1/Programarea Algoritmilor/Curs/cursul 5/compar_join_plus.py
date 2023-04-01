import time
nr_concatenari = 10000
s="a"*500
start = time.time()
lista=[]
for i in range(nr_concatenari):
    lista.append(s)
rez="".join(lista)
stop = time.time()
print("Join: ", stop - start, "secunde")


start = time.time()
rez = ""
for i in range(nr_concatenari):
    rez=rez + s
stop = time.time()
print("Operatorul +: ", stop - start, "secunde")
