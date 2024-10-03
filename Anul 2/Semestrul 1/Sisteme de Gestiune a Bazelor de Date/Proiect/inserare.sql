-- - - - - ORASE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- Muntenia
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Bucuresti', 'Bucuresti', 'Muntenia');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Ploiesti', 'Prahova', 'Muntenia');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Braila', 'Braila', 'Muntenia');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Pitesti', 'Arges', 'Muntenia');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Buzau', 'Buzau', 'Muntenia');

--Transilvania
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Cluj-Napoca', 'Cluj', 'Transilvania');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Brasov', 'Brasov', 'Transilvania');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Targu Mures', 'Mures', 'Transilvania');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Sibiu', 'Sibiu', 'Transilvania');

--Moldova
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Iasi', 'Iasi', 'Moldova');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Galati', 'Galati', 'Moldova');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Bacau', 'Bacau', 'Moldova');
INSERT INTO orase (id_oras, nume, judet, regiune) VALUES (seq_orase.nextval, 'Botosani', 'Botosani', 'Moldova');


SELECT * FROM orase;

-- - - - - HOTELURI - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 1, 'Str. Primaverii, Nr. 4', 'Hotel Ambiance', '0789541124', 'hotelambiance@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 2, 'Str. Libertatii, Nr. 32', 'Hotel Aurora', '0715487966', 'hotelaurora@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 3, 'Str. Aurora, Nr. 43', 'Hotel Dunarea', '0723456789', 'hoteldunarea@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 4, 'Str. Mihai Eminescu, Nr. 7', 'Hotel Splendid', '0734567890', 'hotelsplendid@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 5, 'Str. Florilor, Nr. 124', 'Hotel Paradis', '0745678901', 'hotelparadis@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 6, 'Str. Revolutiei, Nr. 63', 'Hotel Elegance', '0756789012', 'hotelelegance@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 7, 'Str. Victoriei, Nr. 11', 'Hotel Panorama', '0767890123', 'hotelpanorama@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 8, 'Str. Trandafirilor, Nr. 55', 'Hotel Miralux', '0778901234', 'hotelmiralux@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 9, 'Str. Crinilor, Nr. 72', 'Hotel Olimpia', '0801234567', 'hotelolimpia@gmail.com');
INSERT INTO hoteluri (id_hotel, id_oras, adresa, nume, nr_telefon, email) VALUES 
(seq_hoteluri.nextval, 10, 'Str. Aleea Parcului, Nr. 23', 'Hotel Diamant',  '0790123456', 'hoteldiamant@gmail.com');

select * from hoteluri;

-- - - - - Angajati - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- 1
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 1, 'Ana Maria Popescu', 'ana.popescu@gmail.com', '1234', 'manager', TO_DATE('2015-05-01', 'YYYY-MM-DD'), 3500);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 1, 'Andrei Popa', 'andrei.popa@gmail.com', '1234', 'receptioner', TO_DATE('2016-07-01', 'YYYY-MM-DD'), 2500);

-- 2
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 2, 'Elena Ionescu', 'elena.ionescu@gmail.com', '1234', 'manager', TO_DATE('2021-08-01', 'YYYY-MM-DD'), 5000);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 2, 'Ion Munteanu', 'ion.munteanu@gmail.com', '1234', 'receptioner', TO_DATE('2022-06-01', 'YYYY-MM-DD'), 4500);

-- 3
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 3, 'Gabriela Stoica', 'gabriela.stoica@gmail.com', '1234', 'manager', TO_DATE('2019-02-01', 'YYYY-MM-DD'), 5000);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 3, 'Vlad Stanescu', 'vlad.stanescu@gmail.com', '1234', 'receptioner', TO_DATE('2016-04-01', 'YYYY-MM-DD'), 4500);

-- 4
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 4, 'Adriana Dumitru', 'adriana.dumitru@gmail.com', '1234', 'manager', TO_DATE('2018-06-01', 'YYYY-MM-DD'), 4000);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 4, 'Alexandru Iancu', 'alexandru.iancu@gmail.com', '1234', 'receptioner', TO_DATE('2022-08-01', 'YYYY-MM-DD'), 3000);

-- 5
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 5, 'Maria Radu', 'maria.radu@gmail.com', '1234', 'manager', TO_DATE('2017-07-01', 'YYYY-MM-DD'), 4000);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 5, 'Florin Manea', 'florin.manea@gmail.com', '1234', 'receptioner', TO_DATE('2019-11-01', 'YYYY-MM-DD'), 3800);

-- 6
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 6, 'Ioana Tudor', 'ioana.tudor@gmail.com', '1234', 'manager', TO_DATE('2020-09-01', 'YYYY-MM-DD'), 4000);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 6, 'Cristian Dumitrescu', 'cristian.dumitrescu@gmail.com', '1234', 'receptioner', TO_DATE('2021-02-01', 'YYYY-MM-DD'), 4000);

-- 7
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 7, 'Alina Mihai', 'alina.mihai@gmail.com', '1234', 'manager', TO_DATE('2018-07-01', 'YYYY-MM-DD'), 3800);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 7, 'Gabriel Cojocaru', 'gabriel.cojocaru@gmail.com', '1234', 'receptioner', TO_DATE('2016-06-01', 'YYYY-MM-DD'), 3600);

-- 8
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 8, 'Daniela Vasilescu', 'daniela.vasilescu@gmail.com', '1234', 'manager', TO_DATE('2019-09-01', 'YYYY-MM-DD'), 3200);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 8, 'Radu Gheorghe', 'radu.gheorghe@gmail.com', '1234', 'receptioner', TO_DATE('2021-06-01', 'YYYY-MM-DD'), 3500);

-- 9
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 9, 'Ruxandra Andrei', 'ruxandra.andrei@gmail.com', '1234', 'manager', TO_DATE('2015-10-01', 'YYYY-MM-DD'), 3200);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 9, 'Marius Neagu', 'marius.neagu@gmail.com', '1234', 'receptioner', TO_DATE('2017-12-01', 'YYYY-MM-DD'), 3500);

-- 10
INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 10, 'Andreea Ciobanu', 'andreea.ciobanu@gmail.com', '1234', 'manager', TO_DATE('2019-07-01', 'YYYY-MM-DD'), 5600);

INSERT INTO angajati (id_angajat, id_hotel, nume, email, nr_telefon, tip_angajat, data_angajare, salariu)
VALUES (seq_angajati.nextval, 10, 'Adrian Preda', 'adrian.preda@gmail.com', '1234', 'receptioner', TO_DATE('2019-05-01', 'YYYY-MM-DD'), 5500);

select * from angajati;

-- - - - - CAMERE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-- 1
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 1, 200.00, 2, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 1, 512.00, 2, 1, 101);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 1, 643.00, 3, 1, 102);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 1, 150.00, 1, 1, 103);

-- 2
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 2, 1000.00, 3, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 2, 456.00, 2, 1, 101);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 2, 153.00, 1, 1, 102);

-- 3
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 3, 500.00, 2, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 3, 878.00, 4, 1, 101);

-- 4
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 4, 442.00, 1, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 4, 561.00, 2, 1, 1011);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 4, 1210.00, 3, 1, 102);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 4, 123.00, 1, 1, 103);

-- 5
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 5, 894.00, 3, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 5, 154.00, 2, 1, 101);

-- 6
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 6, 200.00, 1, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 6, 250.00, 1, 1, 101);


-- 7
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 895.00, 2, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 100.00, 1, 1, 101);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 560.00, 2, 1, 102);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 900.00, 3, 1, 103);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 450.00, 2, 1, 104);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 7, 1000.00, 4, 1, 105);

-- 8 
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 8, 400.00, 2, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 8, 600.00, 3, 1, 101);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 8, 200.00, 1, 1, 102);

-- 9
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 9, 2500.00, 4, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 9, 1550.00, 3, 1, 101);

-- 10
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 10, 350.00, 2, 1, 100);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 10, 350.00, 2, 1, 101);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 10, 350.00, 2, 1, 102);

INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 10, 350.00, 2, 1, 103);
INSERT INTO camere 
(id_camera, id_hotel, pret, nr_locuri, etaj, nr_camera)
VALUES (seq_camere.nextval, 10, 450.00, 2, 1, 104);

SELECT * FROM camere;

-- - - - - SERVICII_HOTEL - - - - - - - - - - - - - - - - - - - - - - - - - - -

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 1, 'parcare');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 1, 'restaurant');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 1, 'room service');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 1, 'sala fitness');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 1, 'spa');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 2, 'parcare');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 3, 'restaurant');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 4, 'room service');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 6, 'sala fitness');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 9, 'spa');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 10, 'parcare');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 10, 'restaurant');

INSERT INTO servicii_hotel(id_serviciu, id_hotel, tip_serviciu) 
VALUES(seq_servicii_hotel.nextval, 10, 'room service');

SELECT * FROM servicii_hotel;

-- - - - - FACILITATI_CAMERA - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 1, 'uscator de par', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 1, 'fier de calcat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 1, 'WI-FI', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 1, 'aer conditionat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 5, 'TV', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 5, 'uscator de par', 50);
-------

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 7, 'uscator de par', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 7, 'fier de calcat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 7, 'WI-FI', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 8, 'aer conditionat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 8, 'TV', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 9, 'uscator de par', 50);
-----
INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 9, 'uscator de par', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 10, 'fier de calcat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 10, 'WI-FI', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 10, 'aer conditionat', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 2, 'TV', 50);

INSERT INTO facilitati_camera
(id_facilitate, id_camera, tip_facilitate, pret_aditional)
VALUES(seq_facilitati_camera.nextval, 2, 'uscator de par', 50);

SELECT * FROM facilitati_camera;

-- - - - - CLIENTI - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Alexandra Popescu', 'alexandra.popescu@gmail.com', '0712345678', TO_DATE('1990-01-15', 'YYYY-MM-DD'));

INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Mihai Ionescu', 'mihai.ionescu@gmail.com', '0723456789', TO_DATE('1988-11-22', 'YYYY-MM-DD'));

INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Elena Stoica', 'elena.stoica@gmail.com', '0734567890', TO_DATE('1995-07-10', 'YYYY-MM-DD'));

INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Ion Radu', 'ion.radu@gmail.com', '0745678901', TO_DATE('1993-03-01', 'YYYY-MM-DD'));

INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Andreea Mihai', 'andreea.mihai@gmail.com', '0756789012', TO_DATE('1992-09-20', 'YYYY-MM-DD'));

INSERT INTO clienti (id_client, nume, email, nr_telefon, data_nastere)
VALUES (seq_clienti.nextval, 'Alexandru Popa', 'alexandru.popa@gmail.com', '0767890123', TO_DATE('1991-06-17', 'YYYY-MM-DD'));

SELECT * FROM clienti;

-- - - - - REZERVARI - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 1
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 1, 1,
TO_DATE('2023-11-23', 'YYYY-MM-DD'),
TO_DATE('2023-11-26', 'YYYY-MM-DD'), 3,
(SELECT pret FROM CAMERE WHERE id_camera = 1) 
* (TO_DATE('2023-11-26', 'YYYY-MM-DD') - TO_DATE('2023-11-23', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 1));

-- 2
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 1, 2,
TO_DATE('2023-11-11', 'YYYY-MM-DD'),
TO_DATE('2023-11-14', 'YYYY-MM-DD'), 3,
(SELECT pret FROM CAMERE WHERE id_camera = 2) 
* (TO_DATE('2023-11-14', 'YYYY-MM-DD') - TO_DATE('2023-11-11', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 2));

-- 3
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 2, 4,
TO_DATE('2023-12-25', 'YYYY-MM-DD'),
TO_DATE('2023-12-27', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 4) 
* (TO_DATE('2023-12-27', 'YYYY-MM-DD') - TO_DATE('2023-12-25', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 4));

-- 4
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 3, 5,
TO_DATE('2023-10-01', 'YYYY-MM-DD'),
TO_DATE('2023-10-05', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 5) 
* (TO_DATE('2023-10-05', 'YYYY-MM-DD') - TO_DATE('2023-10-01', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 5));

-- 5
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 4, 7,
TO_DATE('2023-11-19', 'YYYY-MM-DD'),
TO_DATE('2023-11-20', 'YYYY-MM-DD'), 1,
(SELECT pret FROM CAMERE WHERE id_camera = 7) 
* (TO_DATE('2023-11-20', 'YYYY-MM-DD') - TO_DATE('2023-11-19', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 7));

-- 6
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 5, 8,
TO_DATE('2024-01-05', 'YYYY-MM-DD'),
TO_DATE('2024-01-07', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 8) 
* (TO_DATE('2024-01-07', 'YYYY-MM-DD') - TO_DATE('2024-01-05', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 8));

-- 7
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 6, 10,
TO_DATE('2024-01-11', 'YYYY-MM-DD'),
TO_DATE('2024-01-14', 'YYYY-MM-DD'), 1,
(SELECT pret FROM CAMERE WHERE id_camera = 10) 
* (TO_DATE('2024-01-14', 'YYYY-MM-DD') - TO_DATE('2024-01-11', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 10));

-- 8
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 5, 11,
TO_DATE('2024-02-21', 'YYYY-MM-DD'),
TO_DATE('2024-02-26', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 11) 
* (TO_DATE('2024-02-26', 'YYYY-MM-DD') - TO_DATE('2024-02-21', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 11));

-- 9
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 3, 12,
TO_DATE('2024-03-01', 'YYYY-MM-DD'),
TO_DATE('2024-03-06', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 12) 
* (TO_DATE('2024-03-06', 'YYYY-MM-DD') - TO_DATE('2024-03-01', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 12));

-- 10
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 4, 15,
TO_DATE('2024-03-08', 'YYYY-MM-DD'),
TO_DATE('2024-03-12', 'YYYY-MM-DD'), 1,
(SELECT pret FROM CAMERE WHERE id_camera = 15) 
* (TO_DATE('2024-03-12', 'YYYY-MM-DD') - TO_DATE('2024-03-08', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 15));



-- 11
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 6, 13,
TO_DATE('2023-11-23', 'YYYY-MM-DD'),
TO_DATE('2023-11-26', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 13) 
* (TO_DATE('2023-11-26', 'YYYY-MM-DD') - TO_DATE('2023-11-23', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 13));

-- 12
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 6, 14,
TO_DATE('2023-11-11', 'YYYY-MM-DD'),
TO_DATE('2023-11-14', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 15) 
* (TO_DATE('2023-11-14', 'YYYY-MM-DD') - TO_DATE('2023-11-11', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 14));

-- 13
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 4, 11,
TO_DATE('2023-12-25', 'YYYY-MM-DD'),
TO_DATE('2023-12-27', 'YYYY-MM-DD'), 1,
(SELECT pret FROM CAMERE WHERE id_camera = 11) 
* (TO_DATE('2023-12-27', 'YYYY-MM-DD') - TO_DATE('2023-12-25', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 11));

-- 14
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 2, 8,
TO_DATE('2023-10-01', 'YYYY-MM-DD'),
TO_DATE('2023-10-05', 'YYYY-MM-DD'), 2,
(SELECT pret FROM CAMERE WHERE id_camera = 8) 
* (TO_DATE('2023-10-05', 'YYYY-MM-DD') - TO_DATE('2023-10-01', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 8));

-- 15
INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES (seq_rezervari.nextval, 1, 16,
TO_DATE('2023-11-19', 'YYYY-MM-DD'),
TO_DATE('2023-11-20', 'YYYY-MM-DD'), 1,
(SELECT pret FROM CAMERE WHERE id_camera = 16) 
* (TO_DATE('2023-11-20', 'YYYY-MM-DD') - TO_DATE('2023-11-19', 'YYYY-MM-DD'))
+ (select nvl(sum(pret_aditional),0) from facilitati_camera where id_camera = 16));

SELECT * FROM REZERVARI;