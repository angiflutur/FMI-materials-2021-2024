import copy
class NodArbore:
    def __init__(self, info, parinte=None, g=0, h=0):
        self.info = info
        self.parinte = parinte
        self.g=g
        self.h=h
        self.f=g+h

    def drumRadacina(self) :
        l=[]
        nod=self
        while nod is not None:
            l.insert(0,nod)
            nod=nod.parinte
        return l

    def vizitat(self) :
        nod=self.parinte
        while nod is not None:
            if nod.info==self.info:
                return True
            nod=nod.parinte
        return False

    def __str__(self):
        return "{} ({}, {})".format(self.info, self.g, self.f)

    def __repr__(self):
        return "({}, ({}), cost:{})".format(self.info, "->".join([str(x) for x in self.drumRadacina()]), self.f)


class Graf:
    def __init__(self, start, scopuri):
        self.start=start
        self.scopuri=scopuri
        if not self.valideaza():
            print("Fisier invalid")
            exit(0)

    def valideaza(self):
        if len(self.start) != 3:
            return False
        if any([len(linie)!=3 for linie in self.start]):
            return False
        matrDesfasurata = sum(self.start, start = [])
        if sorted(matrDesfasurata) != list(range(9)):
            return False

        nrInversiuni = 0
        for i1, elem1 in enumerate(matrDesfasurata):
            for i2, elem2 in enumerate(matrDesfasurata[i1+1:]):
                if elem1 != 0 and elem2 !=0 and elem1 > elem2:
                    nrInversiuni += 1
        return nrInversiuni % 2 == 0


    def scop(self, infoNod):
        return infoNod in self.scopuri

    def succesori(self, nod):
        l=[]
        gasit = False
        for lGol in range(3):
            for cGol in range(3):
                if nod.info[lGol][cGol] == 0:
                    gasit = True
                    break
            if gasit:
                break
        directii = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        for d in directii:
            lPlacuta = lGol+d[0]
            cPlacuta = cGol+d[1]

            if 0<=lPlacuta<=3 and 0<=cPlacuta<=3:
                stareNoua = copy.deepcopy(nod.info)
                stareNoua[lPlacuta][cPlacuta], stareNoua[lGol][cGol] = stareNoua[lGol][cGol], stareNoua[lPlacuta][cPlacuta]
                nodNou = NodArbore(stareNoua, nod, nod.g+1, self.calculeaza_h(stareNoua))
                # costul parintelui + costul mutarii
                if not nodNou.vizitat():
                    l.append(nodNou)
        return l

    def calculeaza_h(self, info):
        return 0



def bin_search(listaNoduri, nodNou, ls, ld):
    if len(listaNoduri)==0:
        return 0
    if ls==ld:
        if nodNou.f<listaNoduri[ls].f:
            return ls
        elif nodNou.f>listaNoduri[ls].f:
            return ld+1
        else: # f-uri egale
            if nodNou.g < listaNoduri[ls].g:
                return ld + 1
            else:
                return ls
    else:
        mij=(ls+ld)//2
        if nodNou.f<listaNoduri[mij].f:
            return bin_search(listaNoduri, nodNou, ls, mij)
        elif nodNou.f>listaNoduri[mij].f:
            return bin_search(listaNoduri, nodNou, mij+1, ld)
        else:
            if nodNou.g < listaNoduri[mij].g:
                return bin_search(listaNoduri, nodNou, mij + 1, ld)
            else:
                return bin_search(listaNoduri, nodNou, ls, mij)

def aStarSolMultiple(gr, nrSolutiiCautate=1):
    # in coada vom avea doar noduri de tip NodParcurgere (nodurile din arborele de parcurgere)
    c = [NodArbore(gr.start)]

    while len(c) > 0:
        #print("Coada actuala: " + str(c))
        #input()
        nodCurent = c.pop(0)

        if gr.scop(nodCurent.info):
            print("Solutie:")
            drum = nodCurent.drumRadacina()
            print(("->").join([str(n.info) for n in drum]))
            print("cost:", nodCurent.g)
            print("\n----------------\n")
            #input()
            nrSolutiiCautate -= 1
            if nrSolutiiCautate == 0:
                return
        #[2,4,7,8,10,14]
        # c+=gr.succesori(nodCurent)
        for s in gr.succesori(nodCurent):
            indice=bin_search(c, s, 0, len(c)-1)
            if indice==len(c):
                c.append(s)
            else:
                c.insert(indice, s)



def a_star(gr):
    # in coada vom avea doar noduri de tip NodParcurgere (nodurile din arborele de parcurgere)
    l_open = [NodArbore(gr.start)]

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
            indice=bin_search(l_open, s, 0, len(l_open)-1)
            if indice==len(l_open):
                l_open.append(s)
            else:
                l_open.insert(indice, s)

f = open("input.txt", "r")
start = [[int(x) for x in linie.strip().split()] for linie in f.readlines()]
print(start)
scopuri = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]

gr=Graf(start, scopuri)
a_star(gr)