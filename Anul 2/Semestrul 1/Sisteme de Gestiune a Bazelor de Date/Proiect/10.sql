--Defini?i un trigger de tip LMD la nivel de comand?. 
--Declan?a?i trigger-ul.

-- creati un trigger care se declanseaza atunci cand incercam 
-- sa inseram, stergem sau modificam o rezervare in afara
-- programului (08:00-21:00).

CREATE OR REPLACE TRIGGER exercitiul_10
BEFORE INSERT OR UPDATE OR DELETE ON rezervari
BEGIN
    IF TO_CHAR(SYSDATE, 'hh24') BETWEEN 0 AND 10 OR
        TO_CHAR(SYSDATE, 'hh24') BETWEEN 21 AND 24
    THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20001, 'In afara programului de lucru.
                Inserati date in tabel intre orele 08:00-21:00.');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002, 'In afara programului de lucru.
                Stergeti date din tabel intre orele 08:00-21:00.');
        ELSE
            RAISE_APPLICATION_ERROR(-20003, 'In afara programului de lucru.
                Actualizati datele din tabel intre orele 08:00-21:00.');
        END IF;
    END IF;
END;
/
alter trigger exercitiul_12 disable;

INSERT INTO rezervari (id_rezervare, id_client, id_camera, data_check_in, data_check_out, nr_persoane, pret_total)
VALUES(seq_rezervari.nextval, 1, 1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 
       TO_DATE('2023-12-02', 'YYYY-MM-DD'), 1, 1000);

DELETE FROM rezervari
WHERE id_rezervare = 1;

UPDATE rezervari
SET pret_total = 999
WHERE id_rezervare = 1;
