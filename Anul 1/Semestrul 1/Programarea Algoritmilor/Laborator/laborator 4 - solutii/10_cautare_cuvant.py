 
def cautare_cuvant(cuv, nume_fis_out, *nume_fis_in):
    g=open(nume_fis_out,"w")
    for fisier in nume_fis_in:
        with open(fisier ) as f:
            g.write(fisier+" ")
            i=0
            for linie in f:
                i+=1

                if cuv.lower() in map(str.lower,re.split("[\- .;!:\n]+",linie)):

                    g.write(f"{i} ")
            g.write("\n")
    g.close()

import re
cautare_cuvant("floare", "rez.txt", "eminescu.txt", "paunescu.txt")
#cautare_cuvant("si", "rez1.txt", "eminescu.txt", "paunescu.txt")