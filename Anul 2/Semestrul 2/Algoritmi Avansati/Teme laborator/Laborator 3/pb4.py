n = int(input())

plan = []

for i in range(n):
    plan.append([int(x) for x in input().split()])

m = int(input())

for i in range(m):
    xp, yp = [float(x) for x in input().split()]

    minX = -float('inf')
    minY = -float('inf')
    maxX = float('inf')
    maxY = float('inf')

    for a, b, c in plan:

        # daca intra aici, inseamna ca b=0, plan ORIZONTAL
        #verificam daca xp este in dreptunghi
        if a < 0:
            if xp > -c / a and minX < -c / a:
                minX = -c/a
        elif a > 0:
            if xp < -c/a and maxX > -c/a:
                maxX = -c/a

        # daca intra aici, inseamna ca a=0, plan VERTICAL
        if b < 0:
            if yp > -c/b and minY < -c/b:
                minY = -c/b
        elif b > 0:
            if yp < -c/b and maxY > -c/b:
                maxY = -c/b

    # daca intersectia semiplanelor este o multime marginita => dreptunghi interesant
    if maxX != float('inf') and maxY != float('inf') and minX != -float('inf') and minY != -float('inf'):
        print("YES")
        print((maxX-minX) * (maxY - minY))
    else:
        print("NO")
