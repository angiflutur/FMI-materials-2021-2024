--    6. Formulati in limbaj natural o problema pe care sa o rezolvati
-- folosind un program stocat independent
-- care sa utilizeze doua tipuri diferite de colectii studiate.
-- Apelati subprogramul.

-- tablou indexat
-- vector

--    Creati o procedura care sa afiseze pentru fiecare hotel 
-- numele angajatilor, salariul si functia.

CREATE OR REPLACE PROCEDURE exercitiul_6 AS
    -- tablou indexat numele hotelurilor
    TYPE tablou_indexat IS TABLE OF hoteluri.nume%TYPE INDEX BY PLS_INTEGER;
    v_nume_hoteluri tablou_indexat := tablou_indexat();

    -- vector pentru numele angajatilor
    TYPE vector IS VARRAY(50) OF angajati.nume%TYPE;
    v_nume_angajati vector;
    v_functii vector;
    
    -- vector pentru salarii
    TYPE vector_salariu IS VARRAY(50) OF angajati.salariu%TYPE;
    v_salarii vector_salariu;

    v_id_hotel hoteluri.id_hotel%TYPE;
BEGIN
    -- populez tabloul indexat cu numele hotelurilor
    SELECT nume 
    BULK COLLECT INTO v_nume_hoteluri 
    FROM hoteluri;

    -- parcurg fiecare hotel in parte
    FOR i IN 1..v_nume_hoteluri.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Hotel: ' || v_nume_hoteluri(i));

        -- setez v_id_hotel in functie de v_nume_hoteluri
        SELECT id_hotel INTO v_id_hotel
        FROM hoteluri
        WHERE nume = v_nume_hoteluri(i);

        -- populez vectorii cu numele angajatilor, salariul si functia
        -- pentru id-ul hotelului gasit mai sus
        SELECT nume, salariu, tip_angajat
        BULK COLLECT INTO v_nume_angajati, v_salarii, v_functii
        FROM angajati
        WHERE id_hotel = v_id_hotel;

        -- afisez angajatii, salariile si functiile pentru hotelul curent
        -- daca exista angajati la hotelul respectiv
        IF v_nume_angajati.COUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Hotelul nu are angajati inregistrati.');
        ELSE
            FOR j IN 1..v_nume_angajati.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE(v_nume_angajati(j) || ' - Salariu: ' || v_salarii(j) || ' - Functie: ' || v_functii(j));
            END LOOP;
        END IF;

        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
    END LOOP;
END;
/
BEGIN
    exercitiul_6;
END;
/

select * from hoteluri;
delete from hoteluri where id_hotel = 12;
