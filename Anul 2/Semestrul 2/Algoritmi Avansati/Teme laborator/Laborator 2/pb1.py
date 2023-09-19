import math


def test_orientare(p, q, r):
    d = q[0] * r[1] + p[0] * q[1] + r[0] * p[1] - p[1] * q[0] - q[1] * r[0] - p[0] * r[1]
    if d == 0:
        return 0
    if d > 0:
        return 1
    else:
        return -1


def dist(p1, p2):
    return math.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2)

# daca determinantul este 0, atunci e triunghi degenerat, adica o dreapta
def este_triunghi_degenerat(p1, p2, p3):
    x1, y1 = p1
    x2, y2 = p2
    x3, y3 = p3
    return x1 * y2 + x3 * y1 + x2 * y3 - x3 * y2 - x2 * y1 - x1 * y3 == 0


def apartine_segment(p1, p2, pct):
    dif = abs(dist(p1, p2) - (dist(p1, pct) + dist(pct, p2)))
    if dif < 0.000001:
        return True
    return False


def test_punct(punctePoligon, pct):

    # daca poligonul are 3 puncte, atunci e triunghi
    if len(punctePoligon) == 3:
        p1, p2, p3 = punctePoligon
        # verificam daca este triunghi degenerat (o dreapta)
        # daca apartine segmentului format de cele 3 puncte
        # atunci BOUNDARY
        # altfel OUTSIDE
        if este_triunghi_degenerat(p1, p2, p3):
            if apartine_segment(p1, p3, pct):
                return "BOUNDARY"
            return "OUTSIDE"

        # daca nu este triunghi degenerat
        touch = False
        # luam cazurile
        # p1p2 || p2p3 || p3p1
        # si verificam cu testul de orientare pozitia fata de dreapta
        for p1, p2 in zip([p1, p2, p3], [p2, p3, p1]):
            test = test_orientare(p1, p2, pct)
            if test == 0:
                touch = True
            elif test == -1:
                return "OUTSIDE"

        if touch:
            return "BOUNDARY"
        else:
            return "INSIDE"

    # daca are mai mult de 3 puncte

    # verificam pozitia fata de dreptele din exterior
    if test_orientare(punctePoligon[0], punctePoligon[1], pct) == -1:
        return "OUTSIDE"

    if test_orientare(punctePoligon[0], punctePoligon[-1], pct) == 1:
        return "OUTSIDE"

    #cautam binar cel mai mare indice i a.i.
    #pct e la stanga dreptei P1Pi
    pos = 0
    n = len(punctePoligon)

    left, right = 1, n-1
    while left <= right:
        mid = (left+right)//2
        if test_orientare(punctePoligon[0], punctePoligon[mid], pct) == 1:
            pos = mid
            left = mid + 1
        else:
            right = mid - 1

    p0, p1, p2 = punctePoligon[0], punctePoligon[pos], punctePoligon[pos + 1]
    
    if test_punct([p0, p1, p2], pct) == "OUTSIDE":
        return "OUTSIDE"

    if test_orientare(p1, p2, pct) == 0:
        return "BOUNDARY"

    if test_orientare(p0, punctePoligon[1], p1) == 0 and test_orientare(p0, p1, pct) == 0:
        return "BOUNDARY"

    if test_orientare(p0, punctePoligon[-1], p2) == 0 and test_orientare(p0, p2, pct) == 0:
        return "BOUNDARY"

    return "INSIDE"


N = int(input())
punctePoligon = [tuple(map(int, input().split())) for i in range(N)]
M = int(input())
for i in range(M):
    pct = tuple(map(int, input().split()))
    print(test_punct(punctePoligon, pct))
