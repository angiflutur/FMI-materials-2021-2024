import heapq
def citire_intervale(nume_fisier):
    ls = []
    with open(nume_fisier) as f:
        for linie in f:
            s, t = (int(x) for x in linie.strip("[]\n").split(","))
            ls.append([s,t]) #mergea si tuplu
    return ls

def partitionare_greedy(ls):
    ls=sorted(ls) #mergea si ls.sort(), atunci modifica parametrul si se vedea in main modificarea
    print("intervalele (activitatile) sortate dupa timpul de inceput")
    print(ls)
    sali = []
    prima_activ = ls[0]
    sali.append([prima_activ])  # lista de liste, pe pozitia i =lista cu activitatile din sala i

    h = []  # heap de perechi (timp de terminare, numar sala), cu salile numerotate de la 0
    heapq.heappush(h, (prima_activ[1], 0))

    for act_curenta in ls[1:]:  # activitatea curenta
        t_final, nr_sala = heapq.heappop(h)

        if act_curenta[0] > t_final:  # se poatea adauga la nr_sala
            sali[nr_sala].append(act_curenta)
            heapq.heappush(h, (act_curenta[1], nr_sala))  # inserez sala nr_sala cu noul timp de terminare
        else:  # sala noua pentru activitatea curenta
            nr_sala_noua = len(sali)  # sala noua are numarul n=len(sali), salile au numar de la 0
            sali.append([act_curenta])  # sala noua cu activitatea x
            heapq.heappush(h, (act_curenta[1], nr_sala_noua))  # pun sala noua cu timpul de terminar
            heapq.heappush(h, (t_final, nr_sala))  # !!pun sala veche inapoi in heap asa cum era, nu am putut adauga activitatea curenta la ea
    return sali


def afisare_programare(sali):
    for i in range(len(sali)):
        print(f"sala {i + 1}: {sali[i]}")

ls = citire_intervale("intervale.in")
sali=partitionare_greedy(ls)
afisare_programare(sali)


