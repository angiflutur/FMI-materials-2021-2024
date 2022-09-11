"""1.	Se citește o propoziție cu cuvinte separate prin spațiu.
Să se formeze o nouă propoziție cu cuvintele
din prima propoziție care au lungime cel puțin 2 ordonate descrescător după lungime
"""
prop="vom sorta dupa lungime descrescator o propozitie"
s=" ".join(sorted(prop.split(),reverse=True,key=len))
print(s)