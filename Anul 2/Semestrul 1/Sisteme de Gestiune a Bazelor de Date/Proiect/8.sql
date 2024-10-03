--    8. Formulati in limbaj natural o problema pe care sa o rezolvati
-- folosind un subprogram stocat independent 
-- de tip functie care sa utilizeze intr-o singura comanda SQL 
-- 3 dintre tabelele definite. 
-- Definiti minim 2 exceptii. 
-- Apelati subprogramul astfel incat sa evidentiati toate cazurile tratate.


-- afisati pentru numele unui hotel dat de la tastatura
-- numarul de rezervari efectuate in luna noiembrie 2023
insert into hoteluri(id_hotel, nume) values(12, 'Hotel Dunarea');
CREATE OR REPLACE FUNCTION exercitiul_8(v_nume_hotel hoteluri.nume%TYPE)
RETURN NUMBER IS
    nr_rezervari NUMBER;
    nr_hoteluri NUMBER;
BEGIN
    -- verificam cate hoteluri sunt in baza de date cu numele dat de noi
    SELECT COUNT(*)
    INTO nr_hoteluri
    FROM hoteluri
    WHERE nume = v_nume_hotel;

    IF nr_hoteluri = 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Hotelul cu numele respectiv nu exista');
    ELSIF nr_hoteluri > 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe hoteluri cu numele respectiv.');
    END IF;

    -- calculam numarul de rezervari din noiembrie 2023
    SELECT COUNT(*)
    INTO nr_rezervari
    FROM rezervari r JOIN camere c ON c.id_camera = r.id_camera
    JOIN hoteluri h ON c.id_hotel = h.id_hotel
    WHERE h.nume = v_nume_hotel AND EXTRACT(MONTH FROM r.data_check_in) = 11
                                AND EXTRACT(YEAR FROM r.data_check_in) = 2023;
    
    RETURN nr_rezervari;
END exercitiul_8;
/
DECLARE
		exceptie1 EXCEPTION;
		exceptie2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(exceptie1,-20000);
		PRAGMA EXCEPTION_INIT(exceptie2,-20001);
	BEGIN
        DBMS_OUTPUT.PUT_LINE('Hotelul "test" are nr de rezervari =');
        DBMS_OUTPUT.PUT_LINE('');
		DBMS_OUTPUT.PUT_LINE(exercitiul_8('test')); 

	EXCEPTION
		WHEN exceptie1 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
		WHEN exceptie2 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
END;
/
DECLARE
		exceptie1 EXCEPTION;
		exceptie2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(exceptie1,-20000);
		PRAGMA EXCEPTION_INIT(exceptie2,-20001);
	BEGIN
        DBMS_OUTPUT.PUT_LINE('Hotelul "Hotel Ambiance" are nr de rezervari =');
        DBMS_OUTPUT.PUT_LINE('');
		DBMS_OUTPUT.PUT_LINE(exercitiul_8('Hotel Ambiance')); 

	EXCEPTION
		WHEN exceptie1 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
		WHEN exceptie2 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
END;
/
DECLARE
		exceptie1 EXCEPTION;
		exceptie2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(exceptie1,-20000);
		PRAGMA EXCEPTION_INIT(exceptie2,-20001);
	BEGIN
        DBMS_OUTPUT.PUT_LINE('Hotelul "Hotel Dunarea" are nr de rezervari =');
        DBMS_OUTPUT.PUT_LINE('');
		DBMS_OUTPUT.PUT_LINE(exercitiul_8('Hotel Dunarea')); 

	EXCEPTION
		WHEN exceptie1 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
		WHEN exceptie2 THEN
			DBMS_OUTPUT.PUT_LINE('Mesaj exceptie: '||SQLERRM);
END;
/

