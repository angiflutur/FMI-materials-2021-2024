import copy


# informatii despre un nod din arborele de parcurgere (nu nod din graful initial)
class NodParcurgere:
    def __init__(self, info, g=0, h=0, parinte=None):
        self.info = info  # eticheta nodului, de exemplu: 0,1,2...
        self.parinte = parinte  # parintele din arborele de parcurgere
        self.g = g
        self.h = h
        self.f = g + h

    def drumRadacina(self):
        l = []
        nod = self
        while nod:
            l.insert(0, nod)
            nod = nod.parinte
        return l

    def vizitat(self):  # verifică dacă nodul a fost vizitat (informatia lui e in propriul istoric)
        nodDrum = self.parinte
        while nodDrum:
            if (self.info == nodDrum.info):
                return True
            nodDrum = nodDrum.parinte

        return False

    def __str__(self):
        return str(self.info)

    def __repr__(self):
        sir = str(self.info) + "("
        drum = self.drumRadacina()
        sir += ("->").join([str(n.info) for n in drum])
        sir += ")"
        return sir


class Graph:  # graful problemei

    def __init__(self, start, scopuri):
        self.start = start  # informatia nodului de start
        self.scopuri = scopuri  # lista cu informatiile nodurilor scop

    # va genera succesorii sub forma de noduri in arborele de parcurgere
    def succesori(self, nodCurent):
        listaSuccesori = []
        gasit = False
        for lGol in range(3):
            for cGol in range(3):
                if nodCurent.info[lGol][cGol] == 0:
                    gasit = True
                    break
            if gasit:
                break
        directii = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        for d in directii:
            lPlacuta = lGol + d[0]
            cPlacuta = cGol + d[1]
            if 0 <= lPlacuta <= 2 and 0 <= cPlacuta <= 2:
                stareNoua = copy.deepcopy(nodCurent.info)
                stareNoua[lGol][cGol] = stareNoua[lPlacuta] [cPlacuta]
                stareNoua[lPlacuta][cPlacuta] = 0
                nodNou = NodParcurgere(stareNoua, nodCurent.g+1, self.estimeaza_h(stareNoua), nodCurent)
                if not nodNou.vizitat():
                    listaSuccesori.append(nodNou)
        return listaSuccesori

    def scop(self, infoNod):
        return infoNod in self.scopuri

    def estimeaza_h(self, infoNod):
        return 0

    def valideaza(self):
        if len(self.start) != 3:
            return False
        if any([len(linie) != 3 for linie in self.start]):
            return False
        matriceDesfasurata = sum(self.start, start=[])
        if sorted(matriceDesfasurata) != list(range(9)):
            return False

        nrInversiuni = 0
        for i in range(len(matriceDesfasurata)):
            if matriceDesfasurata[i] == 0:
                continue
            for j in range(i + 1, len(matriceDesfasurata)):
                if matriceDesfasurata[j] == 0:
                    continue
                if matriceDesfasurata[i] > matriceDesfasurata[j]:
                    nrInversiuni += 1

        if nrInversiuni % 2 == 1:
            return False
        return True


##############################################################################################
#                                 Initializare problema                                      #
##############################################################################################
f = open("input.txt", "r")
start = [[int(p) for p in linie.strip().split()] for linie in f.readlines()]

scopuri = [[[1, 2, 3], [4, 5, 6], [7, 8, 0]]]

gr = Graph(start, scopuri)

if not gr.valideaza():
    print("Nu are sol")
    exit(1)


def bin_search(listaNoduri, nodNou, ls, ld):
    if len(listaNoduri) == 0:
        return 0
    if ls == ld:
        if nodNou.f < listaNoduri[ls].f:
            return ls
        elif nodNou.f > listaNoduri[ls].f:
            return ld + 1
        else:  # f-uri egale
            if nodNou.g < listaNoduri[ls].g:
                return ld + 1
            else:
                return ls
    else:
        mij = (ls + ld) // 2
        if nodNou.f < listaNoduri[mij].f:
            return bin_search(listaNoduri, nodNou, ls, mij)
        elif nodNou.f > listaNoduri[mij].f:
            return bin_search(listaNoduri, nodNou, mij + 1, ld)
        else:
            if nodNou.g < listaNoduri[mij].g:
                return bin_search(listaNoduri, nodNou, mij + 1, ld)
            else:
                return bin_search(listaNoduri, nodNou, ls, mij)


def aStarSolMultiple(gr, nrSolutiiCautate=1):
    # in coada vom avea doar noduri de tip NodParcurgere (nodurile din arborele de parcurgere)
    c = [NodParcurgere(gr.start)]

    while len(c) > 0:
        # print("Coada actuala: " + str(c))
        # input()
        nodCurent = c.pop(0)

        if gr.scop(nodCurent.info):
            print("Solutie:")
            drum = nodCurent.drumRadacina()
            print(("->").join([str(n.info) for n in drum]))
            print("cost:", nodCurent.g)
            print("\n----------------\n")
            # input()
            nrSolutiiCautate -= 1
            if nrSolutiiCautate == 0:
                return
        # [2,4,7,8,10,14]
        # c+=gr.succesori(nodCurent)
        for s in gr.succesori(nodCurent):
            indice = bin_search(c, s, 0, len(c) - 1)
            if indice == len(c):
                c.append(s)
            else:
                c.insert(indice, s)


def a_star(gr):
    # in coada vom avea doar noduri de tip NodParcurgere (nodurile din arborele de parcurgere)
    l_open = [NodParcurgere(gr.start)]

    # l_open contine nodurile candidate pentru expandare (este echivalentul lui c din A* varianta neoptimizata)

    # l_closed contine nodurile expandate
    l_closed = []
    while len(l_open) > 0:
        # print("Coada actuala: " + str(l_open))
        # input()
        nodCurent = l_open.pop(0)
        l_closed.append(nodCurent)
        if gr.scop(nodCurent.info):
            print("Solutie:")
            drum = nodCurent.drumRadacina()
            print(("->").join([str(n.info) for n in drum]))
            print("cost:", nodCurent.g)
            return
        lSuccesori = gr.succesori(nodCurent)
        for s in lSuccesori:
            gasitC = False
            for nodC in l_open:
                if s.info == nodC.info:
                    gasitC = True
                    if s.f >= nodC.f:
                        lSuccesori.remove(s)
                    else:  # s.f<nodC.f
                        l_open.remove(nodC)
                    break
            if not gasitC:
                for nodC in l_closed:
                    if s.info == nodC.info:
                        if s.f >= nodC.f:
                            lSuccesori.remove(s)
                        else:  # s.f<nodC.f
                            l_closed.remove(nodC)
                        break
        for s in gr.succesori(nodCurent):
            indice = bin_search(l_open, s, 0, len(l_open) - 1)
            if indice == len(l_open):
                l_open.append(s)
            else:
                l_open.insert(indice, s)


# aStarSolMultiple(gr, nrSolutiiCautate=6)
a_star(gr)


#### algoritm BF
# presupunem ca vrem mai multe solutii (un numar fix) prin urmare vom folosi o variabilă numită nrSolutiiCautate
# daca vrem doar o solutie, renuntam la variabila nrSolutiiCautate
# si doar oprim algoritmul la afisarea primei solutii

def breadth_first(gr, nrSolutiiCautate=1):
    # in coada vom avea doar noduri de tip NodParcurgere (nodurile din arborele de parcurgere)
    c = [NodParcurgere(gr.start)]

    while len(c) > 0:
        # print("Coada actuala: " + str(c))
        # input()
        nodCurent = c.pop(0)

        if gr.scop(nodCurent.info):
            print("Solutie:")
            drum = nodCurent.drumRadacina()
            print(("->").join([str(n.info) for n in drum]))
            print("\n----------------\n")
            # input()
            nrSolutiiCautate -= 1
            if nrSolutiiCautate == 0:
                return
        c += gr.succesori(nodCurent)


def depth_first(gr, nrSolutiiCautate=1):
    # vom simula o stiva prin relatia de parinte a nodului curent
    df(NodParcurgere(gr.start), nrSolutiiCautate)


def df(nodCurent, nrSolutiiCautate):
    if nrSolutiiCautate <= 0:  # testul acesta s-ar valida doar daca in apelul initial avem df(start,if nrSolutiiCautate=0)
        return nrSolutiiCautate
    # print("Stiva actuala: " + repr(nodCurent.drumRadacina()))
    # input()
    if gr.scop(nodCurent.info):
        print("Solutie: ", end="")
        drum = nodCurent.drumRadacina()
        print(("->").join([str(n.info) for n in drum]))
        print("\n----------------\n")
        # input()
        nrSolutiiCautate -= 1
        if nrSolutiiCautate == 0:
            return nrSolutiiCautate
    lSuccesori = gr.succesori(nodCurent)
    for sc in lSuccesori:
        if nrSolutiiCautate != 0:
            nrSolutiiCautate = df(sc, nrSolutiiCautate)

    return nrSolutiiCautate


# df(a)->df(b)->df(c)->df(f)
#############################################


def df_nerecursiv(nrSolutiiCautate):
    stiva = [NodParcurgere(gr.start)]
    # consider varful stivei in dreapta
    while stiva:  # cat timp stiva nevida
        nodCurent = stiva.pop()  # sterg varful
        if gr.scop(nodCurent.info):
            print("Solutie:")
            drum = nodCurent.drumRadacina()
            print(("->").join([str(n.info) for n in drum]))
            print("\n----------------\n")
            # input()
            nrSolutiiCautate -= 1
            if nrSolutiiCautate == 0:
                return
        stiva += gr.succesori(nodCurent)[
                 ::-1]  # adaug in varf succesoii in ordine inversa deoarece vreau sa expandez primul succesor generat si trebuie sa il pun in varf


"""
Mai jos puteti comenta si decomenta apelurile catre algoritmi. Pentru moment e apelat doar breadth-first
"""
#
# print("====================================================== \nBreadthfirst")
# breadth_first(gr, nrSolutiiCautate=4)
# print("====================================================== \nDepthFirst recursiv")
# depth_first(gr, nrSolutiiCautate=4)
# print("====================================================== \nDepthFirst nerecursiv")
# df_nerecursiv(nrSolutiiCautate=4)