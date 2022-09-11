#1. Se citește o propoziție cu cuvintele separate prin spatii (unul sau mai multe).
# Să se creeze o listă cu cuvintele care încep cu o vocală (folosind și comprehensiune)

prop = "o alta propozitie  cu o singura linie  alba "
ls = [x for x in prop.split() if x[0].lower() in "aeiou"]
print(ls)

#2.Se consideră o listă de liste (matrice) ls
# (de exemplu [[4,7, 3], [3,1,20], [5,2,11]] ). Să se creeze o listă cu toate elementele din
# ls ordonate crescător (pentru exemplu [1, 2, 3, 3, 4, 5, 7, 11, 20]).
ls= [[4,7, 3], [3,1,20], [5,2,11]]
rez=[]
for linie in ls:
    for x in linie:
       rez.append(x)
rez.sort()
print(rez)
rez=sorted([x for linie in ls for x in linie])
print(rez)

#cifrul cezar
#x -litera
k=3
nr_litere=ord('z')-ord('a')+1
text ="acesta este un  text, pe care il codificam"
#(ord(x)-ord('a')+k)%nr_litere a cata litera din alfabet este x+k
rez = "".join([chr((ord(x)-ord('a')+k)%nr_litere+ ord('a')) if 'a'<=x<='z' else x for x in text])
print(rez)

#comprehension - lista cu toate literele mici
#exista un sir de caractere format cu toate literele mici in modulul string (string.ascii_lowercase)
ls=[chr(x) for x in range(ord('a'),ord('z')+1)]
print(ls)

#pasareasca
dict={'a':'apa', 'e':'epe','i':'ipi', 'o':'opo','u':'upu'}
text="o oaie alba"
text=text.translate(str.maketrans(dict))
print(text)
text="o oaie alba"
tradus="".join([x+"p"+x if x in "aeiou" else x for x in text])
print(tradus)