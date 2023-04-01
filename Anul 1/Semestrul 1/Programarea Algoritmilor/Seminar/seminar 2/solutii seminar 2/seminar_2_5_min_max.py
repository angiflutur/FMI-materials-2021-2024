"""
Se citește un număr n și un șir de n numere naturale.
Să se afișeze cel mai mic și cel mai mare număr din șir folosind un număr minim de operații de comparare.
"""
# idee: comparam perechi de elemente consecutive; doar pe cel mai mic il comparam cu minimul, iar pe cel mai mare cu maximul
n = int(input("n="))
print("introduceti sirul, cate un numar pe linie")
if n % 2 == 0:
    x = int(input())
    y = int(input())
    if x < y:
        vmin, vmax = x, y
    else:
        vmin, vmax = y, x
    lim = 3
else:
    x = int(input())
    vmin = vmax = x
    lim = 2
for i in range(lim, n + 1, 2):
    x = int(input())
    y = int(input())
    if x > y:
        if x > vmax:
            vmax = x
        if y < vmin:
            vmin = y
    else:
        if y > vmax:
            vmax = y
        if x < vmin:
            vmin = x
print(vmin, vmax)
