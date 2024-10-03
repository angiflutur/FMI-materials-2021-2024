# Multime

 Clasa ”Multime” (multimi finite de numere intregi reprezentate ca tablouri unidimensionale)

  - membri privati pentru vectorul propriuzis si numarul de elemente;

  - constructori pentru initializare si copiere;

  - destructor (în cazul alocarii statice, se seteaza dimensiunea vectorului la zero,
iar în cazul alocarii dinamice, se dezaloca zona de memorie utilizata);

  - metoda publica pentru transformare a unui vector in multime, prin eliminarea duplicatelor din respectivul vector;

  - reuniune a doua multimi, implementata prin supraincarcarea operatorului +;

  - intersectie a doua multimi, implementata prin supraincarcarea operatorului *;

  - diferenta a doua multimi, implementata prin supraincarcarea operatorului -.
