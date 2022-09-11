#SUPLIMENTAR
import re

propozitie = "a fost, odata.., ca , in povesti  s"
print(re.split(" ",propozitie))
print(re.split(" ,",propozitie)) #separator - sirul spatiu virgula
print(re.split("[ ,.]",propozitie))  #[] -multime
print(re.split("[ ,.]+",propozitie)) #[simboluri]+  = toate cuvintele cu literele in multimea de simboluri

#jurnalul anei
propozitie = "a fost 15 odata 20 ca 500 in povesti 2 lei"
print(sum([int(x) for x in re.split("\D+",propozitie) if len(x)>0])) #\D = orice caracter care nu este cifra



