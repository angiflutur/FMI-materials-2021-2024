import random
import math

def fitness(x, a, b, c):
    return a*(x**2) + b * x + c
f = open("date.in", "r")

# Dimensiunea populației (numărul de cromozomi)
continut = f.readline().rstrip().split(": ")
nrCromozomi = int(continut[-1])

# Domeniul de definiție al funcției (capetele unui interval închis)
continut = f.readline().rstrip().split(": ")
domeniulFunctiei = [int(x) for x in continut[-1].split(" ")]

# Parametrii pentru funcția de maximizat (coeficienții polinomului de grad 2)
continut = f.readline().rstrip().split(": ")
coeficienti = [int(x) for x in continut[-1].split(" ")]

# Precizia cu care se lucrează (cu care se discretizează intervalul)
continut = f.readline().rstrip().split(": ")
precizia = int(continut[-1])

# Probabilitatea de recombinare (crossover, încrucișare)
continut = f.readline().rstrip().split(": ")
probRecombinare = float(continut[-1])

# Probabilitatea de mutație
continut = f.readline().rstrip().split(": ")
probMutatie = float(continut[-1])

# Numărul de etape al algoritmului
continut = f.readline().rstrip().split(": ")
nrEtape = int(continut[-1])

# calculam lungimea cromozomului cu formula din curs
lungimeCromozom = math.ceil(math.log2((domeniulFunctiei[1] - domeniulFunctiei[0])*(10**precizia)))
# generam populatia
populatia = []
populatiaStr = []
for i in range(nrCromozomi):
    individ = []
    for j in range(lungimeCromozom):
        individ.append(random.choice([0, 1]))
    individStr = ''.join(str(x) for x in individ)
    populatiaStr.append(individStr)
    populatia.append(individ)

g = open("date.out", "w")

for etapa in range(nrEtape):
    if etapa == 0:
        g.write("Populatia initiala\n")

    # codificare
    # => transformam din baza 2 in baza 10
    # => apoi translatam cu formula din curs
    popDecodificata = []
    for i in populatia:
        nr = 0
        for j in i:
            nr = nr * 2 + int(j)
        translatie = ((domeniulFunctiei[1] - domeniulFunctiei[0]) / (2**lungimeCromozom - 1))*nr + domeniulFunctiei[0]
        popDecodificata.append(translatie)

    # fitness - calculam f(x)
    popFitness = []
    maxFittest = float('-inf')
    contor = 1
    for x in popDecodificata:
        nr = fitness(x, coeficienti[0], coeficienti[1], coeficienti[2])
        popFitness.append(nr)
        if nr > maxFittest:
            maxFittest = nr
    if etapa!=0:
        g.write(str(maxFittest)+"\n")
    if etapa == 0:
        for i in range(len(populatia)):
            biti = ''
            for j in enumerate(populatia):
                biti += str(j)
            g.write("     " + str(contor) + ": " + str(populatiaStr[i]) +
                    " x = " + str(round(popDecodificata[i], precizia))
                    + " f = " + str(round(popFitness[i], precizia)) + "\n")
            contor += 1
        g.write("\n")

    # selectia - selectia proportionala - metoda ruletei
    if etapa == 0:
        g.write("Probabilitati selectie\n")
    selectie = []
    performantaTotala = sum(popFitness)
    contor = 1
    for i in popFitness:
        nr = i/performantaTotala
        selectie.append(nr)
        if etapa == 0:
            g.write("cromozom      " + str(contor) + " probabilitate " + str(nr) + "\n")
            contor += 1
    # calculam intervalele probabilitate selectie
    if etapa == 0:
        g.write("\nIntervale probabilitati selectie\n")
        g.write("0 " + str(selectie[0]) + "\n")

    intervalProbSelectie = []
    intervalProbSelectie.append(selectie[0])
    suma = selectie[0]
    for i in range(1, nrCromozomi):
        suma += selectie[i]
        intervalProbSelectie.append(suma)
        if etapa == 0:
                g.write(str(suma) + " \n")

    # cautare binara pentru a gasi intervalul caruia apartine u
    def cautareInterval(u, v, st, dr):
        index = 0
        while st <= dr:
            mij = (st+dr)//2
            if v[mij] <= u:
                index = mij
                st = mij + 1
            elif v[mij] > u:
                dr = mij - 1
        # alegem cromozomul i+1
        return index + 1
    cromozomiSelectati = []
    for i in range(nrCromozomi):
        u = random.uniform(0, 1)
        cromozomSelectat = cautareInterval(u, intervalProbSelectie, 0, nrCromozomi)
        # retinem si cromozomii selectati
        cromozomiSelectati.append(cromozomSelectat)
        if etapa == 0:
            g.write("u = " + str(u) + " selectam cromozomul " + str(cromozomSelectat+1)+"\n")

    if etapa == 0:
        g.write("\nDupa selectie\n")
    for i in range(nrCromozomi):
        if etapa == 0:
            g.write(str(i+1) +" " + ''.join([str(x) for x in populatia[cromozomiSelectati[i]]])
                    + " x = " + str(round(popFitness[cromozomiSelectati[i]], precizia))
                    + " f = " + str(fitness(popFitness[cromozomiSelectati[i]], coeficienti[0], coeficienti[1], coeficienti[2]))+"\n")
    if etapa == 0:
        g.write("\nProbabilitatea de incrucisare " + str(probRecombinare) + "\n")

    # crossover
    recombinare = []
    for i in range(nrCromozomi):
        u = random.uniform(0, 1)
        # luam un nr random si verificam daca participa la incrucisare
        # daca cromozomul participa la recombinare, il marcam
        # salvand indicele
        if u < probRecombinare:
            recombinare.append(i)
            if etapa == 0:
                g.write(str(i+1) + ": " + ''.join([str(x) for x in populatia[i]])
                        + " u = " + str(u) + "<" + str(probRecombinare) + " participa\n")
        else:
            if etapa == 0:
                g.write(str(i + 1) + ": " + ''.join([str(x) for x in populatia[i]])
                        + " u = " + str(u) + "<" + str(probRecombinare) + "\n")

    if etapa == 0:
        g.write("\n")

    while len(recombinare) > 1:
        perechiRecombinare = random.sample(recombinare, 2)
        punctRupere = random.randint(1, nrCromozomi)

        cromozom1 = populatia[perechiRecombinare[0]]
        cromozom2 = populatia[perechiRecombinare[1]]

        populatia[perechiRecombinare[0]] = cromozom2[punctRupere:] + cromozom1[:punctRupere]
        populatia[perechiRecombinare[1]] = cromozom1[punctRupere:] + cromozom2[:punctRupere]

        if etapa == 0:
            g.write("Recombinare dintre cromozomul " + str(perechiRecombinare[0])
                    + " cu cromozomul " + str(perechiRecombinare[1]) + "\n")
            g.write("Rezultat " + ''.join([str(x) for x in cromozom1])
                    + " " + ''.join(str(x) for x in cromozom2)+"\n")
        recombinare.remove(perechiRecombinare[0])
        recombinare.remove(perechiRecombinare[1])

    if etapa == 0:
        g.write("\nDupa recombinare\n")
        individ = []
        for i in range(nrCromozomi):
            individStr = ''.join(str(x) for x in individ)
            populatiaStr.append(individStr)
        for i in populatia:
            nr = 0
            for j in i:
                nr = nr * 2 + int(j)
            translatie = ((domeniulFunctiei[1] - domeniulFunctiei[0]) / (2 ** lungimeCromozom - 1)) * nr + \
                         domeniulFunctiei[0]
            popDecodificata.append(translatie)
        contor = 0
        for q in range(len(populatia)):
            g.write("     " + str(contor+1) + ": " + populatiaStr[contor] +
                " x = " + str(round(popDecodificata[contor], precizia))
                + " f = " + str(round(popFitness[contor], precizia)) + "\n")
            contor += 1

    if etapa == 0:
        g.write("\nProbabilitate de mutatie pentru fiecare gena 0.01\n")
        g.write("Au fost modificati cromozomii:\n")

    for i in range(nrCromozomi):
        u = random.random()
        if u < probMutatie:
            poz = random.randrange(lungimeCromozom)
            populatia[i][poz] = 1 - populatia[i][poz] #schimbam bit ul de pe pozitia poz
            if etapa == 0:
                g.write(str(i+1) + "\n")
