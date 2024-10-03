# OOP
# Proiect 1 - Multime

## Clasa "Multime" (Multimi finite de numere intregi reprezentate ca tablouri unidimensionale)

- Membri privati pentru vectorul propriu zis si numarul de elemente.
- Constructori pentru initializare si copiere.
- Destructor (în cazul alocarii statice, se seteaza dimensiunea vectorului la zero, iar în cazul alocarii dinamice, se dezaloca zona de memorie utilizata).
- Metoda publica pentru transformare a unui vector in multime, prin eliminarea duplicatelor din respectivul vector.
- Reuniune a doua multimi, implementata prin supraincarcarea operatorului +.
- Intersectie a doua multimi, implementata prin supraincarcarea operatorului *.
- Diferenta a doua multimi, implementata prin supraincarcarea operatorului -.

# Proiect 2 - Proces

### Se dau clasele:

- ***Proces*** (int nrProces, string reclamant, string reclamat)
- ***Proces_civil*** (double dauneMorale, double dauneMateriale, int nrMartori, bool stadiu)
- ***Proces_penal*** (int dovezi, bool stadiu).

##

### Cerinte:
1. Sa se faca verificarile in constructori si la citire astfel: daca **nrMartori > 5** automat stadiul este 1, altfel este 0. Daca la un proces penal **numarul dovezilor > 25** atunci stadiul este 1.

2. Sa se poata modifica stadiul unui proces si sa se creeze o metoda de calculare a taxei de timbru pentru fiecare proces civil. **Taxa de timbru = 10/100 * dauneMorale + 10% * dauneMateriale**.

3. Sa se afle procesul care are taxa de timbru cea mai mare.
