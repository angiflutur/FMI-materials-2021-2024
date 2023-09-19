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


    def __str__(self):
        return str(self.info)
    def __repr__(self):
        return "({}, {})".format(self.info,"->".join([str(x) for x in self.drumRadacina()]))

class Graf:
    def __init__(self, matr, start, scopuri):
        self.matr = matr
        self.start = start
        self.scopuri = scopuri

    def scop(self, informatieNod):
         return informatieNod in self.scopuri

    def succesori(self, nod):
        l = []
        for i in range(len(self.matr)):
            if self.matr[nod.info][i] == 1:
                nodNou = NodArbore(i, nod)
                if not nodNou.vizitat():
                    l.append(nodNou)
        return l

def bf(gr, nrSol):
    c = [NodArbore(gr.start)]
    while c:
        nodCurent = c.pop(0)
        if gr.scop(nodCurent.info):
            print(repr(nodCurent))
            nrSol -= 1
            if nrSol == 0:
                return
        c += gr.succesori(nodCurent)
# dfs recursiv
def dfs_rec(gr, s, nsol):
    if nsol == 0:
        return
    while s:
        nodCurent = s[-1] #luam ultimul element
        s.pop(-1)
        if gr.scop(nodCurent.info): # daca e solutie, o afisam
            print(repr(nodCurent))
            return nsol - 1
        for suc in gr.succesori(nodCurent): # luam succesorii lui nodCurent
            s.append(suc)
            nsol = dfs_rec(gr, s, nsol)
            if nsol == 0:
                return
    return nsol

# dfs nerecursiv
def dfs_nerec(gr, nsol):
    nr_sol = nsol
    s = [NodArbore(gr.start)] #punem nodul start in stiva
    viz = set([NodArbore(gr.start).info]) #marcam nodul start ca fiind vizitat
    while s and nr_sol > 0:
        nodCurent = s.pop()
        if gr.scop(nodCurent.info): #daca e solutie, o afisam
            nr_sol -= 1
            print(repr(nodCurent))
            continue
        # daca nu e solutie,
        # punem succesorii lui nodCurent in stiva
        succesori = gr.succesori(nodCurent)
        s.extend(succesori)

        # marcam succesorii ca fiind vizitati
        viz.update(set([suc.info for suc in succesori]))


    return nr_sol

# matrice de adiacenta - simetrica
m = [
    [0, 1, 0, 1, 1, 0, 0, 0, 0, 0],
    [1, 0, 1, 0, 0, 1, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 1, 0, 1, 0, 0],
    [1, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0, 0, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0]
]

start = 0
scopuri = [5, 9]

gr = Graf(m, start, scopuri)
# bf(gr, 3)

print('recursiv')
dfs_rec(gr, [NodArbore(gr.start)], 100)

print('\nnerecursiv')
dfs_nerec(gr, 6)
