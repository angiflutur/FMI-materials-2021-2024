"""Se citește un cuvânt w, un număr natural nenul p, un număr natural n și un șir format din n cuvinte,
date fiecare pe o linie.
Să se afișeze toate cuvintele care sunt p-rime cu w
(adică ultimele p caractere din cuvânt coincid cu ultimele p caractere ale lui w)
și au lungime cel puțin p+2.
De exemplu, pentru w = "mere", p = 2 , n=4 și cuvintele "pere", "teste", “are” și "programare",
trebuie să fie afișate cuvintele "pere" și "programare"
(“are” rimează cu “mere”, dar are lungime mai mică decât p+2
"""
w = input("cuvant=")
p = int(input("p="))
n = int(input("n="))
sufix_w = w[-p:]

rez = ""
for i in range(n):
    s = input()
    if (len(s) > p + 1) and (s[-p:] == sufix_w):
        # putem testa egalitatea de sufixe folosind si metoda endswith
        # if (len(s)>p+1) and s.endswith(sufix_w):
        rez = rez + s + " "
print(rez[:-1])  # fara ultimul spatiu
