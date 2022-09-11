#Componenta echipei:Ion Melania-Victorita, Monete Andreea-Maria, Flutur Angelica-Costela

import sys
def sectiune(nume,ls): #functie pt a face o lista cu contnutul fiecarei sectiunii
    ls_sectiune = []
    val=False

    for linie in ls:
        if linie==nume+':' :  #luam fiecare sectiune in parte
            val=True
            continue
        if linie=="End":       #sectiunea s-a terminat
            val=False
        if val==True:                 #daca sectiunea nu s-a terminat
            ls_sectiune.append(linie)  #adaugam continutul ei in lista
    return ls_sectiune    #returnam lista cu sectiunea respectiva

def valideaza_fisier(file_name):
    ls=[]
    if len(file_name)<1:
        s = "File is empty!"  #fisier gol
        return s
    else:
        f=open(file_name)    #citim din fisier

        for line in f:
            line=line.strip()   #despartim cuvintele unei linii dupa spatii

            if len(line)>0:
                ls.append(line)

        sigma=sectiune("Sigma",ls)        #se creeaza fiecare sectiune din fisier
        gamma=sectiune("Gamma",ls)
        states_temp=sectiune("States",ls) #include si stari care au f sau s dupa ele
        states=[]
        transitions=sectiune("Transitions",ls)

        if len(sigma)==0 or len(gamma)==0 or len(states_temp)==0 or len(transitions)==0:
            s1="Section empty!"

        start=[]
        acceptance=[]

        for a in states_temp:
            a=a.split(" ") #separam prin spatiu pentru a gasi "f" sau "s"
            if len(a)==2:  #daca lungimea e 2 inseamna ca contine un s sau f
                if a[1]=="s":
                    start.append(a[0]) #am gasit starea initiala/de start
                elif a[1]=="f":
                    acceptance.append(a[0]) #am gasit starea de acceptare/finala
                else:
                    s2="Error in section States"

            states.append(a[0]) #stari fara s sau f dupa ele

        #verificam daca exista stare de inceput sau de acceptare
        if len(start)==0 or len(acceptance)==0:
            s3="No starting/acceptance state"
            return s3
        #verificam sa existe o singura stare de start
        if len(start)>1:
            s4="Too many starting states"
            return s4
    return sigma, gamma, states, transitions, start, acceptance

sigma, gamma, states, transitions, start, acceptance=valideaza_fisier("TM_config_file.in")
print(f"Alfabetul de intrare este: {set(sigma)}")
print(f"Alfabetul benzii este: {set(gamma)}")
print(f"Starea de start este: {start[0]}")
print(f"Starea de acceptare este:{acceptance[0].strip(',')}")
print("Tranzitiile sunt: ")
for line in transitions:
    print(''.join(map(str, line)))
print(transitions)

#ex2
def simulator(str_input,start,acceptance,transitions):
    #verificam daca inputul apartine alfabetului
    ok=0
    for i in range(len(str_input)):
        if str_input[i] not in sigma:
            ok=1
            return 'Cuvantul nu este valid'

    tape = [a for a in str_input]
    tape.append('-')  # retinem sirul introdus pe tape
    tape_copie=tape
    indice=0 #indice pt tape
    pozitie_head=0 #indicele head-ului
    stare_curenta=start[0]
    lista_stari=[stare_curenta]
    if ok==0:  #cuvantul este din alfabetul TM
        while indice<len(str_input) : #parcurgem cat timp exista un caracter de pe tape la care nu am ajuns
            for t in transitions:
                t=t.split()      #separam tranzitiile
                if t[0]==stare_curenta :  #gasim o tranzitie care are starea curenta
                    if "U" in t[2]:
                        t[2]=[[t[2][0],t[2][2]]] #modificare cand t[2]=aUb, pt a identifica simbolul
                    if tape[indice]in t[2]: #gasim litera din alfabet care ne duce din starea curenta in starea urmatoare
                        stare_curenta=t[1] #modificam starea curenta
                        lista_stari.append(stare_curenta) #cream o lista cu starile prin care trecem
                        if(tape[pozitie_head]==tape_copie[pozitie_head]) and 'x' in t: #verificam daca cele doua celule din cele doua tape-uri sunt identice
                            tape[pozitie_head]=='x' #daca da, inlocuim celula din tape la care ne aflam cu x
                        if t[len(t)-1]=='R':
                            pozitie_head+=1 #daca trebuie sa ne deplasam la dreapta, indexul head-ului creste cu 1
                        elif t[len(t)-1]=='L':
                            pozitie_head-=1 #invers pt stanga
                indice+=1

        if lista_stari[len(lista_stari)-1]==acceptance:
            return "String acceptat"
        else:
            return "String neacceptat"

print(simulator('abba#abba',start,acceptance,transitions))


###########################################################


#ex3
#idee de rezolvare: stringul primit ca input va fi stocat pe prima banda
#se realizeaza o copie a primei benzi in a doua banda
#parcurgem cele 2 benzi simultan, si comparam simbolurile gasite
#daca sunt egale, inlocuim simbolurile gasite cu x
#in caz ca s-a copiat gresit stringul, la un anumit pas se va observa ca simbolurile sunt diferite
#atunci inputul este invalid
#daca s-a trecut prin toate celulele din prima banda si s-au comparat cu cele din a doua banda, rezultand in
     #umplerea benzii 1 cu simbolul x, se va intra in starea de acceptare
#insa este posibil ca in banda a doua sa fie un simbol in plus din cauza copierii gresite
#deci trebuie  sa se faca o verificare pentru banda 2 pentru a determina daca exista simboluri diferite de x
#adaugam in plus in file o stare q final
#folosim in principiu acelasi cod de mai sus cu mici modificari

def simulator_extended(str_input,start,acceptance,transitions):
    #verificam daca inputul apartine alfabetului
    ok=0
    for i in range(len(str_input)):
        if str_input[i] not in sigma:
            ok=1
            return 'Cuvantul nu este valid'

    tape = [a for a in str_input]
    tape.append('-')  # retinem sirul introdus pe tape
    tape_copie=tape
    indice=0 #indice pt tape
    pozitie_head=0 #indicele head-ului
    stare_curenta=start[0]
    lista_stari=[stare_curenta]
    if ok==0:  #cuvantul este din alfabetul TM
        while indice<len(tape_copie) : #parcurgem cat timp exista un caracter de pe tape 2
            for t in transitions:
                t=t.split()      #separam tranzitiile
                if t[0]==stare_curenta :  #gasim o tranzitie care are starea curenta
                    if "U" in t[2]:
                        t[2]=[[t[2][0],t[2][2]]] #modificare cand t[2]=aUb, pt a identifica simbolul
                    if tape[indice]in t[2]: #gasim litera din alfabet care ne duce din starea curenta in starea urmatoare
                        stare_curenta=t[1] #modificam starea curenta
                        lista_stari.append(stare_curenta) #cream o lista cu starile prin care trecem
                        if(tape[pozitie_head]==tape_copie[pozitie_head]): #verificam daca cele doua celule din cele doua tape-uri sunt identice
                            tape[pozitie_head]='x' #daca da, inlocuim celula din tape1 si 2 la care ne aflam cu x
                            tape_copie[pozitie_head]='x'
                        if t[len(t)-1]=='R':
                            pozitie_head+=1 #daca trebuie sa ne deplasam la dreapta, indexul head-ului creste cu 1
                        elif t[len(t)-1]=='L':
                            pozitie_head-=1 #invers pt stanga

                    #s-a parcurs intreaga banda 1, acum vedem daca a mai ramas vreun simbol in banda 2 nemarcat cu x
                    if t[2] in acceptance:
                        if pozitie_head<len(tape_copie):
                            return "String neacceptat"

                indice+=1

        if lista_stari[len(lista_stari)-1]==acceptance:
            return "String acceptat"
        else:
            return "String neacceptat"
