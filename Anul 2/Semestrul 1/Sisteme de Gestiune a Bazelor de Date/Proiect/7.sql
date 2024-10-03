--    7. Formulati in limbaj natural o problema pe care sa o rezolvati 
-- folosind un subprogram stocat independent 
-- care sa utilizeze 2 tipuri diferite de cursoare studiate, 
-- unul dintre acestea fiind cursor parametrizat. 
-- Apelati subprogramul.

--    Mariti salariul persoanelor angajate intre anii 
-- dupa anul 2020 cu 15% de la hotelurile dintr-o regiune data 
-- de la tastatura.

CREATE OR REPLACE PROCEDURE exercitiul_7(v_nume_regiune IN orase.regiune%TYPE) IS
    -- cursor pentru id-ul si numele hotelurilor
    CURSOR c_hotel IS
        SELECT h.id_hotel, h.nume
        FROM hoteluri h JOIN orase o ON h.id_oras = o.id_oras
        WHERE o.regiune = v_nume_regiune;

    -- cursor pentru angajati
    CURSOR c_angajati(v_id_hotel hoteluri.id_hotel%TYPE) IS
        SELECT id_angajat, id_hotel, nume, salariu
        FROM angajati
        WHERE id_hotel = v_id_hotel AND EXTRACT(YEAR FROM data_angajare) >= 2020;

    -- variabile pentru salariul vechi si nou
    v_vechi_salariu angajati.salariu%TYPE;
    v_nou_salariu angajati.salariu%TYPE;
    
    -- variabila pentru a verifica daca hotelul are angajati dupa 2020
    v_are_angajati BOOLEAN := FALSE;
BEGIN

    FOR j IN c_hotel LOOP
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Hotel: ' || j.nume);
        DBMS_OUTPUT.PUT_LINE('');
        
        v_are_angajati := FALSE;
        
        FOR a IN c_angajati(j.id_hotel) LOOP
            DBMS_OUTPUT.PUT_LINE('Angajat: ' || a.nume);
            v_are_angajati := TRUE;
            
            -- salvam salariul actual in v_vechi_salariu
            v_vechi_salariu := a.salariu;
            
            -- marim salariului angajatului cu 15%
            v_nou_salariu := a.salariu * 1.15;
            UPDATE angajati 
            SET salariu = v_nou_salariu 
            WHERE id_angajat = a.id_angajat;

            -- afisarea vechiului si noului salariu 
            DBMS_OUTPUT.PUT_LINE('Vechiul salariu: ' || v_vechi_salariu);
            DBMS_OUTPUT.PUT_LINE('Noul salariu: ' || v_nou_salariu);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
        IF NOT v_are_angajati THEN
            DBMS_OUTPUT.PUT_LINE('Hotelul nu are angajati dupa 2020.');
        END IF;
    END LOOP;
END exercitiul_7;
/
BEGIN
    exercitiul_7('Transilvania');
END;
/
-- Muntenia
rollback;

CREATE OR REPLACE PROCEDURE exercitiul_7_fetch(v_nume_regiune IN orase.regiune%TYPE) IS
    -- cursor pentru id-ul si numele hotelurilor
    CURSOR c_hotel IS
        SELECT h.id_hotel, h.nume
        FROM hoteluri h JOIN orase o ON h.id_oras = o.id_oras
        WHERE o.regiune = v_nume_regiune;

    -- cursor pentru angajati
    CURSOR c_angajati(v_id_hotel hoteluri.id_hotel%TYPE) IS
        SELECT id_angajat, id_hotel, nume, salariu
        FROM angajati
        WHERE id_hotel = v_id_hotel AND EXTRACT(YEAR FROM data_angajare) >= 2020;

    -- variabile pentru salariul vechi si nou
    v_vechi_salariu angajati.salariu%TYPE;
    v_nou_salariu angajati.salariu%TYPE;
    
    -- variabila pentru a verifica daca hotelul are angajati dupa 2020
    v_are_angajati BOOLEAN := FALSE;
    
    v_id_hotel hoteluri.id_hotel%TYPE;
    v_nume_hotel hoteluri.nume%TYPE;
BEGIN

    OPEN c_hotel;
    LOOP
        FETCH c_hotel INTO v_id_hotel, v_nume_hotel;
        EXIT WHEN c_hotel%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Hotel: ' || v_nume_hotel);
        DBMS_OUTPUT.PUT_LINE('');
        
        v_are_angajati := FALSE;
        
        FOR a IN c_angajati(v_id_hotel) LOOP
            DBMS_OUTPUT.PUT_LINE('Angajat: ' || a.nume);
            v_are_angajati := TRUE;
            
            -- salvam salariul actual in v_vechi_salariu
            v_vechi_salariu := a.salariu;
            
            -- marim salariului angajatului cu 15%
            v_nou_salariu := a.salariu * 1.15;
            UPDATE angajati 
            SET salariu = v_nou_salariu 
            WHERE id_angajat = a.id_angajat;

            -- afisarea vechiului si noului salariu 
            DBMS_OUTPUT.PUT_LINE('Vechiul salariu: ' || v_vechi_salariu);
            DBMS_OUTPUT.PUT_LINE('Noul salariu: ' || v_nou_salariu);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
        IF NOT v_are_angajati THEN
            DBMS_OUTPUT.PUT_LINE('Hotelul nu are angajati dupa 2020.');
        END IF;
    END LOOP;
END exercitiul_7_fetch;
/
BEGIN
    exercitiul_7_fetch('Transilvania');
END;
/
rollback;


