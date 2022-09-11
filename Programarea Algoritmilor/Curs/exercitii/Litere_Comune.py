s=input("s=")
rezultat=None
for cuvant in s.split():
    s=set(cuvant)
    if rezultat != None:
        rezultat.update(s)
    else:
        rezultat=s
   # print(rezultat)
print(rezultat)
#ora dae informatica
