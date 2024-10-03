--Defini?i un trigger de tip LMD la nivel de linie. 
--Declan?a?i trigger-ul.

-- creati un trigger care sa se declanseze atunci cand 
-- incercam sa modificam data check-in
-- cu o data din trecut.

CREATE OR REPLACE TRIGGER exercitiul_11
BEFORE UPDATE OF data_check_in ON rezervari
FOR EACH ROW
BEGIN
    IF(:NEW.data_check_in < SYSDATE)
        THEN RAISE_APPLICATION_ERROR(-20004, 'Data check-in trebuie sa fie mai mare
        decat data curenta.');
    END IF;
END;
/
alter trigger exercitiul_10 disable;

update rezervari
set data_check_in = to_date('26/08/2023', 'DD/MM/YYYY')
where id_rezervare = 1;