def gen_patrate_pana_la(n):
    for k in range(n):
        yield k ** 2 # producem, nu returnam
#(to yield = a produce, to return = a returna)

print(gen_patrate_pana_la(10))
for x in gen_patrate_pana_la(10):
    print(x,end=" ")
print("\n---")
t = gen_patrate_pana_la(10)
print(next(t))
print(next(t))
print(list(t))
print("---")
t = gen_patrate_pana_la(12)
for x in t:
    print(x)
print(next(t))#eroare StopIteration