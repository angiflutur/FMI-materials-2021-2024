n = int(input())

minX = -float('inf')
minY = -float('inf')
maxX = float('inf')
maxY = float('inf')

for i in range(n):
    a, b, c = [int(x) for x in input().split()]

    # daca intra aici inseamna ca b=0, plan ORIZONTAL
    # x <= -c/a
    if a < 0:
        if minX < -c/a:  # cea mai mica valoare a lui x
            minX = -c/a
    elif a > 0:
        if maxX > -c/a:  # cea mai mare valoare a lui x
            maxX = -c/a

    # daca intra aici inseamna ca a=0, plan VERTICAL
    # y <= -c/b
    if b < 0:
        if minY < -c/b:
            minY = -c/b
    elif b > 0:
        if maxY > -c/b:
            maxY = -c/b

if minX <= maxX and minY <= maxY:
    if minX == -float('inf') or minY == -float('inf') or maxX == float('inf') or maxY == float('inf'):
        print("UNBOUNDED")
    else:
        print("BOUNDED")

else:
    print("VOID")
