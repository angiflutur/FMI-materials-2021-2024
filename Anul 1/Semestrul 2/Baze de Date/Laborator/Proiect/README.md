# Transport-Feroviar-BD

### 1. Descriere și reguli de funcționare

Acest proiect reprezintă o bază de date pentru gestionarea transportului feroviar intern
din România. Aceasta facilitează informarea călătorilor asupra rutelor, achiziționarea de bilete,
data și ora plecării. Un călător își poate rezerva un loc în tren, acesta alegând clasa la care dorește
să stea. Fiecare bilet dintr-o anumită călătorie are același preț, însă alegerea unei clase superioare
aduce un preț adițional.

Pentru o călătorie se cunoaște stația de plecare, cea de sosire, cei doi conductori, trenul,
data și ora plecării, respectiv sosirii. La o călătorie poate exista un controlor, care asigură
siguranța transportului pasagerilor.

Fiecare stație se află într-un oraș, iar orașul la rândul său se poate încadra într-o regiune.
La fiecare gară sunt angajați conductori și călători, aceștia fiind angajați la o singură gară. O
companie feroviară deține diferite modele de tren, iar aceasta plătește o taxă pentru chirie. O
companie este condusă de un manager.

Pentru o călătorie ce pleacă dintr-o anumită gară se vor folosi doar conductori și
controlori angajați la respectiva gară, în afară de cazul în care aceștia se întorc la gara de plecare
printr-o altă călătorie.


### 2. Constrângeri
- Într-un oraș pot exista mai multe gări
- Un conductor sau controlor poate lucra la o singură gară
- Orice bilet are un preț stabilit de companie
- Orice clasă superioară are o taxă adițională
- Orice călătorie trebuie să aibă doi conductori și un controlor
- Numărul de bilete vândute nu trebuie să depășească numărul de locuri alocate călătoriei
respective
- Stația de plecare și cea de sosire trebuie să fie diferite
- Fiecare bilet trebuie să aibă data și ora plecării, respectiv sosirii
- Un pasager poate rezerva un singur bilet


### 3. Diagrama ERD
![Diagrama](https://user-images.githubusercontent.com/94394449/235163232-ccf141e4-0940-461f-ac68-c56e5805f39d.jpg)
