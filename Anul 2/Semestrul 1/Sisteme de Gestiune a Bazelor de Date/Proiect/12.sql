-- Defini?i un trigger de tip LDD. 
--Declan?a?i trigger-ul.

--creati un trigger care nu permite stergerea,
--crearea sau alterarea tabelelor din schema
--in afara intervalului de lucru

CREATE OR REPLACE TRIGGER exercitiul_12
AFTER CREATE OR DROP OR ALTER ON SCHEMA

BEGIN
    IF TO_CHAR(SYSDATE, 'hh24') BETWEEN 0 AND 10 OR
        TO_CHAR(SYSDATE, 'hh24') BETWEEN 21 AND 24
    THEN
        RAISE_APPLICATION_ERROR(-20010, 'In afara programului de lucru.
            Incercati sa faceti modificari intre orele 08:00-21:00.');
    END IF;
END;
/
alter trigger exercitiul_12 disable;

rollback;

alter table angajati drop column salariu;
/
drop table angajati;
/
create table test(id_test NUMBER);
drop table test;