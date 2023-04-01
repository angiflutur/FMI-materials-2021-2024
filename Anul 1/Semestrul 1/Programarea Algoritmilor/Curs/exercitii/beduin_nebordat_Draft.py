m, n, plecare = [int(x) for x in input().split()]
mat = [[int(j) for j in input().split()]for i in range(m)]
dp = [[float("inf") for j in range(n)] for i in range(m)]
# dp[i][j] = costul minim pana la pozitia i,j
# stim direct ulltima linie
dp[m-1][plecare] = 0
for linie in mat:
     print(*linie)
print()
#unic = [[True for j in range(n+1)] for i in range(m)]
for i in range(m-2, -1, -1):
    for j in range(n):
        # a = vecinul (i+1,j)
        # b = vecinul (i+1,j-1)
        # c = vecinul (i+1,j+1)
        a = dp[i + 1][j] + max(mat[i][j] - mat[i + 1][j], 0)
        b = None
        c = None
        dp[i][j]=a
        if j-1>=0:
            b = dp[i + 1][j - 1] + max(mat[i][j] - mat[i + 1][j - 1], 0)
            if dp[i][j]>b:
                dp[i][j]=b
        if j+1<n:
            c = dp[i + 1][j + 1] + max(mat[i][j] - mat[i + 1][j + 1], 0)
            if dp[i][j]>c:
                dp[i][j]=c


# for linie in dp:
#     print(*linie)
"""
for linie in unic:
    print(*linie)
"""
minim = min(dp[0])
j = dp[0].index(minim)
i = 0
print(minim)

traseu_unic = 0
if dp[0].count(minim) > 1:
    traseu_unic = 1

ls = []
while i < m-1:
    # a = vecinul (i+1,j)
    # b = vecinul (i+1,j-1)
    # c = vecinul (i+1,j+1)
    a = dp[i + 1][j] + max(mat[i][j] - mat[i + 1][j], 0)

    if j - 1 >= 0:
        b = dp[i + 1][j - 1] + max(mat[i][j] - mat[i + 1][j - 1], 0)
    else:
        b=None
    if j + 1 < n:
        c = dp[i + 1][j + 1] + max(mat[i][j] - mat[i + 1][j + 1], 0)
    else:
        c = None

    if dp[i][j]==a == b or dp[i][j]==b==c or dp[i][j]==c==a:
        traseu_unic=1
    if dp[i][j] == a:
        ls.append((i, j))
        i += 1

    elif dp[i][j] == b:
        ls.append((i, j))
        i += 1
        j -= 1
    else:
        ls.append((i, j))
        i += 1
        j += 1
ls.append((i, j))
print(*ls[::-1], sep='\n')
if traseu_unic:
    print("traseul nu este unic")
else:
    print("traseul este unic")