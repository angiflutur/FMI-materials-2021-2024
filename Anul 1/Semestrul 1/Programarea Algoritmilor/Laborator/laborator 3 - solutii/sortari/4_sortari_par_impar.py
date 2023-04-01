"""4.	Să se sorteze o listă de numere naturale astfel încât
numerele pare sortate descrescător să fie poziționate după cele impare sortate crescător.
"""
v=[3,1,10,7,12,50, 23,131,78, 6, 5]
print(sorted(v,key=lambda x: (0,-x) if x%2==0 else (1,x)))
