prop="ana anastasia ana, ana re ana ana mere ana"
s="ana"
t="banana"
separatori=" ,."
poz=prop.find(s)
while poz!=-1:
    #daca s este incadrat de semne de punctuatie il inlocuim
    if (poz==0 or prop[poz-1] in separatori) and (poz+len(s)==len(prop) or prop[poz+len(s)] in separatori):
        prop=prop[:poz]+t+prop[poz+len(s):] #inlocuim s cu t
    poz = prop.find(s,poz+len(t))

print(prop)

"""
#varianta - cand era separat de spatii
prop="ana anastasia ana ana re ana ana mere ana"
prop=" "+prop+" "

prop=prop.replace(" "+s+" "," "+t+" ")
prop=prop.replace(" "+s+" "," "+t+" ")
print(prop[1:-1])

prop=re.sub(f"(?<=[ .,]){s}(?=[ .,])",t, prop) #cu expresii regulate - incadrat de un separator
prop=re.sub(f"(?<=[ .,]){s}(?=[ .,])",t, prop)
"""