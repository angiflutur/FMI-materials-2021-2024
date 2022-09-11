"""5.	Scrieți un program care să înlocuiască într-o propoziție toate aparițiile unui cuvânt 𝑠 cu un cuvânt 𝑡
(!cuvânt, nu subșir). Rezolvați cerința pentru cazul în care în propoziție cuvintele
sunt separate printr un singur spațiu, apoi pentru cazul în care cuvintele pot fi
separate prin mai multe semne de punctuație uzuale (spațiu, virgula, punct și virgulă).
"""

#a)
#variata 1 - cu split -merge si cu mai multe spatii
propozitie=input("propozitie: ")
s=input("cuvant de inlocuit: ")
t=input("cu ce cuvant:")
ls=[ x if x!=s else t for x in propozitie.split(" ")] #list nu are replace
# for i in range(len(ls)):
#     if ls[i] == s:
#         ls[i] = t
rezultat=" ".join(ls)
print("cu split ", rezultat)





# varianta 2 - inlocuire manuala - merg din spatiu in spatiu
rezultat = " " + propozitie + " "
poz = rezultat.find(" ")
while poz != -1:

    poz1 = rezultat.find(" ", poz + 1)
    if poz1 != -1 and rezultat[poz + 1:poz1] == s:
        rezultat = rezultat[:poz + 1] + t + rezultat[poz1:]
        poz = poz+len(t)
    else:
        poz=poz1
rezultat=rezultat[1:-1]
print("din spatiu in spatiu ",rezultat)

# varianta 3 - inlocuire manuala - caut cuvantul si testez daca este incadrat de spatii
rezultat = propozitie
poz = rezultat.find(s)
lung_s=len(s)
while poz != -1:
    if (poz == 0 or rezultat[poz-1].isalpha() == False) and \
            (poz+lung_s == len(rezultat) or rezultat[poz+lung_s].isalpha() == False):
        rezultat = rezultat[:poz] + t+rezultat[poz+lung_s:]
    poz = rezultat.find(s, poz+len(t))

print("\nSirul dupa inlocuiri:")
print(rezultat)



#varianta 4 -adaugam" " la inceputul propozitiei si inlocuim " "+s+" " cu " "+t+" "
rezultat=" "+propozitie+" "
rezultat=rezultat.replace(" "+s+" "," "+t+" ") #!!!pb cu aparitii consecutive
rezultat=rezultat.replace(" "+s+" "," "+t+" ")
rezultat = rezultat[1:-1]
print("cu doua replace ",rezultat)

"""
#mai multi separatori -caut litera cu separator inainte - inceputul cuvantului, apoi separator pt finalul cuvantului??
import re
propozitie = "ana   sas anas.. ana,. dfs"
print(re.split("[ .,]",propozitie))
#print(re.split("[ .,]+",propozitie))
print(re.sub(s,t,propozitie))
propozitie =" "+propozitie
print(re.sub(f"(?<=[ .,]){s}(?=[ .,])",t,propozitie))
"""


