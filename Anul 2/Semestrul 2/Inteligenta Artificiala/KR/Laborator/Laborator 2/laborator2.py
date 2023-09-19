class NodArbore:
    def __init__(self, info, parinte=None):
        self.info = info
        self.parinte = parinte

    def drumRadacina(self):
        l = []
        nod = self
        while nod is not None:
            l.insert(0, nod)
            nod = nod.parinte
        return l

    def vizitat(self):
        nod = self.parinte
        while nod is not None:
            if nod.info == self.info:
                return True
            nod = nod.parinte
        return False

    def afisSolFisier(self, fisier):
        l = self.drumRadacina()
        primulDrum = True
        for nod in l:
            if primulDrum == True:
                fisier.write("(Stanga:<barca>) {} canibali {} misionari  ......  (Dreapta) {} canibali  {} misionari\n\n".format(
                    nod.info[1], nod.info[0], 0, 0))
                primulDrum = False
            if nod.parinte is not None:
                if nod.parinte.info[2] == 1:
                    malBarcaInitial = "stang"
                    malBarcaFinal = "drept"
                else:
                    malBarcaInitial = "drept"
                    malBarcaFinal = "stang"
                fisier.write(">>> Barca s-a deplasat de la malul " + str(malBarcaInitial) + " la malul " +
                             str(malBarcaFinal) + " cu " + str(abs(nod.parinte.info[1] - nod.info[1])) + " canibali si "
                             + str(abs(nod.parinte.info[0] - nod.info[0])) + " misionari.\n")

                if nod.parinte.info[2] == 1:
                    fisier.write(
                        "(Stanga) {} canibali {} misionari  ......  (Dreapta:<barca>) {} canibali  {} misionari\n\n".format(
                            nod.info[1], nod.info[0], abs(Graf.N- nod.info[1]),
                            abs(Graf.N- nod.info[0])))
                else:
                    fisier.write(
                        "(Stanga:<barca>) {} canibali {} misionari  ......  (Dreapta) {} canibali  {} misionari\n\n".format(
                            nod.info[1], nod.info[0],  abs(Graf.N - nod.info[1]),
                            abs(Graf.N - nod.info[0])))

    def __str__(self):
        return str(self.info)
    def __repr__(self):
        return "({}, {})".format(self.info,"->".join([str(x) for x in self.drumRadacina()]))

class Graf:
    def __init__(self, start, scopuri):
        self.start = start
        self.scopuri = scopuri

    def scop(self, informatieNod):
         return informatieNod in self.scopuri

    def succesori(self, nodCurent):

        def test(mis, can):
            return mis==0 or mis>=can

        listaSuccesori = []
        if nodCurent.info[2]==1:
            misMalCurent=nodCurent.info[0]
            canMalCurent=nodCurent.info[1]
            misMalOpus=Graf.N-nodCurent.info[0]
            canMalOpus=Graf.N-nodCurent.info[1]
        else:
            misMalCurent=Graf.N-nodCurent.info[0]
            canMalCurent=Graf.N-nodCurent.info[1]
            misMalOpus=nodCurent.info[0]
            canMalOpus=nodCurent.info[1]
        maxMisBarca=min(Graf.M, misMalCurent)
        for misBarca in range(maxMisBarca+1):
            if misBarca==0:
                minCanBarca=1
                maxCanBarca=min(Graf.M, canMalCurent)
            else:
                minCanBarca = 0
                maxCanBarca = min(Graf.M-misBarca, canMalCurent, misBarca)
            for canBarca in range(minCanBarca,maxCanBarca+1):
                misMalCurentNou=misMalCurent-misBarca
                canMalCurentNou=canMalCurent-canBarca
                misMalOpusNou=misMalOpus+misBarca
                canMalOpusNou=canMalOpus+canBarca
                if not test(misMalCurentNou,canMalCurentNou):
                    continue
                if not test(misMalOpusNou,canMalOpusNou):
                    continue
                if nodCurent.info[2] == 1:
                    nodNou= NodArbore((misMalCurentNou,canMalCurentNou, 0), nodCurent)
                else:
                    nodNou = NodArbore((misMalOpusNou, canMalOpusNou, 1), nodCurent)
                if not nodNou.vizitat():
                    listaSuccesori.append(nodNou)
        return listaSuccesori

def bf(gr, nrSol, fisier):
    c = [NodArbore(gr.start)]
    while c:
        nodCurent = c.pop(0)

        if gr.scop(nodCurent.info):
            print(repr(nodCurent))
            nodCurent.afisSolFisier(fisier)
            nrSol -= 1
            if nrSol == 0:
                return
        c += gr.succesori(nodCurent)

# dfs recursiv
def dfs_rec(gr, s, nsol, fisier):
    if nsol == 0:
        return
    while s:
        nodCurent = s[-1] #luam ultimul element
        s.pop(-1)
        if gr.scop(nodCurent.info): # daca e solutie, o afisam
            print(repr(nodCurent))
            nodCurent.afisSolFisier(fisier)
            return nsol
        for suc in gr.succesori(nodCurent): # luam succesorii lui nodCurent
            s.append(suc)
            nsol = dfs_rec(gr, s, nsol, output)
            if nsol == 0:
                return
    return nsol

# dfs nerecursiv
def dfs_nerec(gr, nsol, fisier):
    nr_sol = nsol
    s = [NodArbore(gr.start)] #punem nodul start in stiva
    viz = set([NodArbore(gr.start).info]) #marcam nodul start ca fiind vizitat
    while s and nr_sol > 0:
        nodCurent = s.pop()
        if gr.scop(nodCurent.info): #daca e solutie, o afisam
            nr_sol -= 1
            print(repr(nodCurent))
            nodCurent.afisSolFisier(fisier)
            continue
        # daca nu e solutie,
        # punem succesorii lui nodCurent in stiva
        succesori = gr.succesori(nodCurent)
        s.extend(succesori)

        # marcam succesorii ca fiind vizitati
        viz.update(set([suc.info for suc in succesori]))
    return nr_sol

f=open("input.txt", "r")
continut=f.read().split()
Graf.N= int(continut[0])
Graf.M= int(continut[1])
f.close()

start = (Graf.N, Graf.N,1)
scopuri = [ (0,0,0) ]
gr = Graf(start, scopuri)

# bfs
print("bfs")
output=open("output.txt", "w")
bf(gr, 1, output)
output.close()


# # dfs recursiv
# print("dfs recursiv")
# output = open("output.txt", "w")
# dfs_rec(gr, [NodArbore(gr.start)], 1, output)
# output.close()

# # dfs nerecursiv
# print("dfs nerecursiv")
# output = open("output.txt", "w")
# dfs_nerec(gr, 6, output)
# output.close()