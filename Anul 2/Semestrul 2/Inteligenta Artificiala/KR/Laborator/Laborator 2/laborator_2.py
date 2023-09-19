class NodArbore:
   def __init__(self, info, parinte=None):
       self.info = info
       self.parinte = parinte

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
       return str(self.info)

   def __repr__(self):
       return "({}, ({}))".format(self.info, "->".join([str(x) for x in self.drumRadacina()]))


class Graf:
   def __init__(self, start, scopuri):
       self.start=start
       self.scopuri=scopuri


   def scop(self, infoNod):
       return infoNod in self.scopuri

   def succesori(self, nod):
       def test(m, c):
           return m == 0 or m >= c
       l=[]
       if nod.info[2] == 1: #barca e pe malul stang
           misMalCurent = nod.info[0]
           canMalCurent = nod.info[1]
           misMalOpus = Graf.N - nod.info[0]
           canMalOpus = Graf.N = nod.info[1]
       else:
           misMalCurent = Graf.N - nod.info[0]
           canMalCurent = Graf.N - nod.info[1]
           misMalOpus = nod.info[0]
           canMalOpus = nod.info[1]
       maxMisBarca = min(Graf.M, misMalCurent)
       for mb in range(maxMisBarca + 1):
           if mb == 0:
               minCanBarca = 1
               maxCanBarca = min(Graf.M, canMalCurent)
           else:
               minCanBarca = 0
               maxCanBarca = min(mb, Graf.M-mb, canMalCurent)
           for cb in range(minCanBarca, maxCanBarca + 1):
                misMalCurentNou = misMalCurent - mb
                canMalCurentNou = canMalCurent - cb
               misMalOpusNou = misMalCurent+mb
                canMalOpusNou = canMalCurent+cb

               # if not nodNou.vizitat():
               #     l.append(nodNou)
       return l



def breadth_first(gr, nsol):
   c=[NodArbore(gr.start)]
   while c:
       nodCurent=c.pop(0)
       if gr.scop(nodCurent.info):
           print(repr(nodCurent))
           nsol-=1
           if nsol==0:
               return
       lSuccesori=gr.succesori(nodCurent)
       c+=lSuccesori

f = open("input.txt", "r")
continut = f.read().strip().split()
Graf.N = int(continut[0]) # proprietate statica
Graf.M = int(continut[1])


start = (Graf.N, Graf.M, 1)
scopuri = [(0, 0, 0)]

gr=Graf(start, scopuri)
breadth_first(gr,3)

