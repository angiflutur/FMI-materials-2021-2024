SELECT * FROM TAB;
create table angajati_ibu (
cod_ang number(4) PRIMARY KEY,
nume varchar2(20) NOT NULL,
prenume varchar2(20),
email char(15),
data_ang date,
job varchar2(10), 
cod_sef number(4),
comision number(4,2),
salariu number(8) NOT NULL,
cod_dep number(2),
CONSTRAINT nume_prenume_unique UNIQUE(nume, prenume),
CONSTRAINT constraint_check_dep CHECK (cod_dep >0),
CONSTRAINT constraint_check_sal CHECK (salary>(comsision*100))
);



select * from angajati_ibu;

drop table angajati_ibu;

--12. Redenumiþi tabelul ANGAJATI_pnu în ANGAJATI3_pnu.

RENAME ANGAJATI_ibu TO  ANGAJATI3_ibu;

--13. Consultaþi vizualizarea TAB din dicþionarul datelor.
--Redenumiþi angajati3_pnu în angajati_pnu.
SELECT * FROM TAB;
--TAB – informaþii de bazã despre tabelele existente în schema utilizatorului.
RENAME ANGAJATI3_ibu TO  ANGAJATI_ibu;

--14. Suprimaþi conþinutul tabelului angajati10_pnu, fãrã a suprima structura acestuia.

TRUNCATE TABLE ANGAJATI_ibu;

--15. Creaþi tabelul DEPARTAMENTE_pnu, corespunzãtor schemei relaþionale:
--DEPARTAMENTE_pnu (cod_dep# number(2), nume varchar2(15), cod_director number(4))
--specificând doar constrângerea NOT NULL pentru nume (nu precizaþi deocamdatã 
--constrângerea de cheie primarã).

create table DEPARTAMENTE_ibu(
cod_dep number(2),
nume varchar2(15) NOT NULL,
cod_director number(4));



ALTER TABLE DEPARTAMENTE_ibu
ADD CONSTRAINT DEPARTAMENTE_ibu_pk  PRIMARY KEY (cod_dep);

--1. Pe baza tabelului EMP_PNU, sã se creeze o vizualizare VIZ_EMP30_PNU,
--care conþine codul, numele, email-ul ºi salariul angajaþilor din departamentul 30.
--Sã se analizeze structura ºi conþinutul vizualizãrii.
--Ce se observã referitor la constrângeri? 
--Ce se obþine de fapt la interogarea conþinutului vizualizãrii? 
--Inseraþi o linie prin intermediul acestei vizualizãri; comentaþi.

CREATE VIEW viz_emp30_ibu 
AS SELECT employee_id, last_name,first_name, email, salary
FROM emp_ibu WHERE department_id=30;

SELECT * FROM VIZ_emp30_ibu;

INSERT INTO viz_emp30_ibu
VALUES (400,'n1', 'n2' ,'@gmail.com', 5000);

DROP VIEW viz_emp30_ibu;

--2. Modificaþi VIZ_EMP30_PNU astfel încât sã fie posibilã inserarea/modificarea
--conþinutului tabelului de bazã prin intermediul ei.
--Inseraþi ºi actualizaþi o linie (cu valoarea 300 pentru codul angajatului)

CREATE VIEW viz_emp30_ibu 
AS SELECT employee_id, last_name, email, hire_date, salary,job_id
FROM emp_ibu;

DESC viz_emp30_ibu ;

SELECT * FROM viz_emp30_ibu ;
INSERT INTO viz_emp30_ibu 
VALUES (400,'n1','e1', SYSDATE, 5000,'SA_REP');
SELECT employee_id, last_name, email, hire_date, salary, job_id
FROM emp_ibu;

UPDATE viz_emp30_ibu
SET hire_date=hire_date-15
WHERE employee_id=157;

ROLLBACK;

 select * from emp_ibu;
 


