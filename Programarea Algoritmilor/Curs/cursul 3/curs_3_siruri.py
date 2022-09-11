#SIRURI DE CARACTERE - str

#CREARE:

s="un sir"
s='un sir'
s="""Un sir
pe mai multe linii"""
print(s)
s='''Un sir
pe mai multe linii'''

#conversie cu str()
x=5
y=7
sx=str(x)
sy=str(y)
print(x+y,sx+sy) #adunare de int, concatenare

#secvente escape \n, \t -tab
s="Programarea\talgoritmilor"
print(s)
#s="sirul "abc"" #pb - dc pun " in interiorul unui sir delimitat de ""
#solutia 1
s="sirul \"abc\""
print(s)
s='sirul "abc"' #folosim alt delimitator
print(s)


#accesarea elementelor, parcugere s[0], s[-1], s[i:j], for c in s
#!!!Sirurile sunt imutabile, nu putem modifica valoarea lor, nu s[0]='a'
#operatori in, not in, relationali >, >=,
#concatenare +, *n


#functii uzuale: min, max, len
#functii la nivel de caracter ord, chr
c="b" #c='b'
if 'a'<=c<'z':
    print("urmatoarea litera dupa",c,"este",chr(ord(c)+1))

#Metode:
#CAUTARE: count, index -cele comune + find, rfind, rindex
#s.find(x,i,j) - ca si index, cauta subisrul x in s; dar daca nu gaseste x returneaza -1; x poate avea lungime mai mare ca 1
#s.rfind - ultima aparitie
s="Programarea algoritmilor"
print("Pozitiile pe care aparea a")
p = s.find('a')
while p!=-1:
    print(p, end=" ")
    p=s.find('a',p+1)
print()

#test de prefix, sufix: s.startwith(x,i,j), s.endwith s[-p:]==w[-p:] s.endwith(w[-p:])
print(s.startswith("Progr"))
s="abc"
print(s.startswith(("a","e","i"))) #un tuplu de prefixe ("a","e","i")
s="xy"
print(s.startswith(("a","e","i"))) #un tuplu de prefixe ("a","e","i")

#!!!Sirurile sunt imutabile, nu putem modifica valoarea lor, nu s[0]='a'
#MODIFICARE => un sir de caractere nou (un obiect nou, nu se modifica s
#s=s.metoda_care_modifica()

#s.replace(cuv1, cuv2, nr_max) inlocuieste cuv1 cu cuv2;
# daca este specificat nr_max, inlocuieste primele nr_max aparitii, altfel inlocuieste toate aparitiile
s="Programarea algoritmilor"
s=s.replace("a","",1) #sterge prima aparitie a lui a
print(s)
s=s.replace('a','aa')
print(s)
s=s.replace('ea','ele')
print(s)
#maketrans -seminar
#s.lower(), s.title(), s.capitalize() ....
s=s.lower()
print(s)
#center, strip, rstrip:
s="Programarea"
s=s.center(20)
print(s)
s="  Progr amarea  "
s=s.strip() #elimina caracterele albe de la ambele capete ale sirului
# pana intalneste un caracter care nu este alb
print(s)
#s="Programarea"
s=s.center(20,"*") #caracter de umplere
print(s)
s="*Progra*!marea!*!!*x"
s=s.rstrip("!*x") #elimina fiecare dintre caracterele date ca al doilea parametru din dreapta rstrip
#pana intalneste un caracter care nu este printre cele date ca parametru
print(s)

#DIVIZARE, CONCATENARE DE SIRURI
#impartirea unui sir in functie de un unic separator -split()
#s.split("separator",maxsplit) => o lista de cuvinte (nu modifica sirul)
# #implicit separator- caractere albe (daca nu specific separator)
#implicit- imparte tot sirul dupa separator, daca nu este specificat maxsplit, altfel face cel mult maxspilt impartiri
s="cursul de   Progr  alg se termina"
ls=s.split()
print(ls)
#print(s) #s nu se modifica
ls=s.split(" ")
print(ls)
s="ana,,are, 2 mere"
ls=s.split(",")
print(ls)

s="cursul de   Progr  alg se termina"
ls=s.split(maxsplit=2)
print(ls)
"""
#citirea unui sir de numere pe aceeasi linie => suma
ls = input("introduceti numere pe o linie ").split()
print(ls)
s=0
for x in ls:
    s=s+int(x) #!!convertim
print("suma numerelor",s)

"""
"""
#-----curs 4
#lipirea unei liste de siruri
ls=input("dati o propozitie cu cuvinte separate cu spatii ").split(" ")
s=",".join(ls) #cuvintele lipite inapoi cu, in loc de spatiu
print(s)
"""

#formatarea unui sir - metoda format, f-stringuri
x=24
y=2
#x*y=y*x=rezultat 24*2=2*24=48
#template.format(parametri) - in template putem avea campuri de inlocuire cuprinse intre {},
# care vor fi inlocuite cu parametrii ai metodei format
s="{}*{}={}*{}={}".format(x,y,y,x,x*y) #prin pozitie
print(s)
s="{0}*{1}={1}*{0}={2}".format(x,y,x*y) #prin indice
print(s)
s="{p1}*{p2}={p2}*{p1}={p3}".format(p1=x,p2=y,p3=x*y) #prin nume
print(s)

#f-stringuri - in interiorul campurilor{} se pot pune expresii
s=f"{x}*{y}={y}*{x}={x*y}" #prefixam sirul cu f pentru a arata ca este f-string
print(s)
#in campurile de formatare - putem specifica si modalitati de formatare:
#0dimnesiunea_pe_care_sa_afiseze.numarul_de_zecimale tipul_expresiei
#0-caracterul de umplere
#tipul : f (real), b(binar)...

s=f"{x:5}*{y}={y}*{x}={x*y:.2f}" #prefixam sirul cu f pentru a arata ca este f-string
print(s)

x=2
y=7
print(f"{x:08b} & {y:08b} = {x&y:08b}")

"""
ls = input("introduceti numere pe o linie ").split()
print(ls)
s=0
for x in ls:
    s=s+int(x) #!!convertim
print(f"{' + '.join(ls)} = {s}")
"""

"""
#formatari in vers 2
print("%4d * %d " % (x,y)) #% in loc de format
"""

#String interning - bazat pe faptul ca sirurile sunt imutabile
#anumite siruri - sunt memorate in string pool (pentru a nu se crea obiecte noi de cate ori avem un sir in program
#cand se intalneste o valoare memorabila in pool - se cauta acolo, nu se creeaza obiect nou

ls =[1,3]
ls1=[1,3] #un obiect nou, sunt obiecte mutabile
print(ls==ls1, ls is ls1)

s = "abc"
s1 = "abc" #cauta un obiect cu valoarea "abc" in pool
print(s==s1, s is s1)

s = "abc"
s1 = "ab" + "c" #rezultatul este cautat in pool
x = "c"
s2 = "ab" + x #expresia nu se poate evalua la compilare => obiect nou
print(s==s1, s==s2, s1==s2)
print(s is s1, s is s2, s1 is s2)
