def determinant(a, b, c, p):
    a11 = b[1]*(c[0]**2 + c[1]**2 - p[0]**2 - p[1]**2) + c[1]*(p[0]**2 + p[1]
                                                               ** 2 - b[0]**2 - b[1]**2) + p[1]*(b[0]**2 + b[1]**2 - c[0]**2 - c[1]**2)
    a12 = b[0]*(c[0]**2 + c[1]**2 - p[0]**2 - p[1]**2) + c[0]*(p[0]**2 + p[1]
                                                               ** 2 - b[0]**2 - b[1]**2) + p[0]*(b[0]**2 + b[1]**2 - c[0]**2 - c[1]**2)
    a13 = b[0]*c[1] + c[0]*p[1] + p[0]*b[1] - p[0]*c[1] - b[0]*p[1] - c[0]*b[1]
    a14 = b[0]*c[1]*(p[0]**2+p[1]**2) + c[0]*p[1]*(b[0]**2 + b[1]**2) + p[0]*b[1]*(c[0]**2 + c[1]**2) - \
        p[0]*c[1]*(b[0]**2 + b[1] ** 2) - b[0]*p[1] * \
        (c[0]**2 + c[1]**2) - c[0]*b[1]*(p[0]**2 + p[1]**2)

    return a[0] * a11 - a[1]*a12 + (a[0]**2 + a[1]**2)*a13 - a14


a = [int(x) for x in input().split()]
b = [int(x) for x in input().split()]
c = [int(x) for x in input().split()]

m = int(input())

for i in range(m):
    p = [int(x) for x in input().split()]

    if determinant(a, b, c, p) > 0:
        print("INSIDE")
    elif determinant(a, b, c, p) < 0:
        print("OUTSIDE")
    else:
        print("BOUNDARY")
