# a) Se citește de la tastatură un text. Se cere să se “traducă” în limba păsărească textul dat astfel: după
# fiecare vocală se adaugă litera p și încă o dată acea vocală (după a, e, i, o, u se adaugă respectiv pa,
# pe, pi, po, pu). Exemplu: “Ana are mere.” devine “Apanapa aparepe meperepe.”
# Fiind dat un astfel de text în limba păsărească, se poate obține textul original? Dacă da, faceți asta


#CODIFICARE
vocale="aeiou"
s=input()
copie_s=s
#Varianta 1 - direct - cu lista de litere
ls=[]
for c in s:
    ls+=c
    if c in vocale:
        ls += "p"+c
s="".join(ls)
print(s)



#Varianta 2 - cu replace repetat
s=copie_s
for x in vocale:
    s=s.replace(x,x+"p"+x)
print(s)

#Varianta 3 - cu translate cu dictionar
s=copie_s
dictionar = {'a':'apa', 'e':'epe', 'i':'ipi', 'o':'opo', 'u': 'upu'}
s=s.translate(str.maketrans(dictionar))
print(s)


#DEODIFICARE
copie_s=s

#Varianata 1 - direct, cu lista de litere
ls=[]
i=0
while i < len(s): #nu for
    ls+=s[i]
    if s[i] in vocale:
        i=i+2
    i=i+1
s="".join(ls)
print(s)


#Varianata 2 -replace repetat
s=copie_s
for x in vocale:
    s=s.replace(x+"p"+x, x)
print(s)


#Varianata 3 -cu translate nu merge - poate fi folosit doar pentru inlocuire de caractere

#
# b)Se citește de la tastatură un text în care cuvintele sunt despărțite în silabe cu ajutorul cratimelor. Se
# cere să se “traducă” textul dat în limba păsărească astfel: după fiecare silabă se adaugă litera p și se
# repetă ultima literă din acea silabă. Afișați traducerea și cu cratime, dar și fără.
# Exemplu: “A-na a-re mul-te me-re ro-sii si de-li-cioa-se.” devine
# “Apa-napa apa-repe mulpl-tepe mepe-repe ropo-siipi sipi depe-lipi-cioapa-sepe.” și
# “Apanapa aparepe mulpltepe meperepe roposiipi sipi depelipicioapasepe.”
# Fiind dat un astfel de text în limba păsărească (cel care conține și cratime), se poate obține textul
# original? Dacă da, faceți asta.

#codificarea
s="A-na a-re mul-te me-re ro-sii si de-li-cioa-se."
#Varianta 1 - direct, iterat cu index:
ls=[]
for i in range(len(s)):

    if s[i] =="-" or (s[i] in " ;.:!?" and s[i-1].isalpha()):
        ls += "p"+s[i-1]+s[i]
    else:
        ls += s[i]
s="".join(ls)
print(s)
print("Apa-napa apa-repe mulpl-tepe mepe-repe ropo-siipi sipi depe-lipi-cioapa-sepe.")


#decodificarea
s="Apa-napa apa-repe mulpl-tepe mepe-repe ropo-siipi sipi depe-lipi-cioapa-sepe"
ls=[]
i=0
while i< len(s):
    ls += s[i]
    if i+3>=len(s) or( s[i+3] =="-" or (s[i+3] in " ;.:!?" and s[i+2].isalpha())): #Atentie la final
        i += 2
    i += 1
s="".join(ls)
print(s)