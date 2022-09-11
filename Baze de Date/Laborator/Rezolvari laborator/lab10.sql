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

--12. Redenumi�i tabelul ANGAJATI_pnu �n ANGAJATI3_pnu.

RENAME ANGAJATI_ibu TO  ANGAJATI3_ibu;

--13. Consulta�i vizualizarea TAB din dic�ionarul datelor.
--Redenumi�i angajati3_pnu �n angajati_pnu.
SELECT * FROM TAB;
--TAB � informa�ii de baz� despre tabelele existente �n schema utilizatorului.
RENAME ANGAJATI3_ibu TO  ANGAJATI_ibu;

--14. Suprima�i con�inutul tabelului angajati10_pnu, f�r� a suprima structura acestuia.

TRUNCATE TABLE ANGAJATI_ibu;

--15. Crea�i tabelul DEPARTAMENTE_pnu, corespunz�tor schemei rela�ionale:
--DEPARTAMENTE_pnu (cod_dep# number(2), nume varchar2(15), cod_director number(4))
--specific�nd doar constr�ngerea NOT NULL pentru nume (nu preciza�i deocamdat� 
--constr�ngerea de cheie primar�).

create table DEPARTAMENTE_ibu(
cod_dep number(2),
nume varchar2(15) NOT NULL,
cod_director number(4));



ALTER TABLE DEPARTAMENTE_ibu
ADD CONSTRAINT DEPARTAMENTE_ibu_pk  PRIMARY KEY (cod_dep);

--1. Pe baza tabelului EMP_PNU, s� se creeze o vizualizare VIZ_EMP30_PNU,
--care con�ine codul, numele, email-ul �i salariul angaja�ilor din departamentul 30.
--S� se analizeze structura �i con�inutul vizualiz�rii.
--Ce se observ� referitor la constr�ngeri? 
--Ce se ob�ine de fapt la interogarea con�inutului vizualiz�rii? 
--Insera�i o linie prin intermediul acestei vizualiz�ri; comenta�i.

CREATE VIEW viz_emp30_ibu 
AS SELECT employee_id, last_name,first_name, email, salary
FROM emp_ibu WHERE department_id=30;

SELECT * FROM VIZ_emp30_ibu;

INSERT INTO viz_emp30_ibu
VALUES (400,'n1', 'n2' ,'@gmail.com', 5000);

DROP VIEW viz_emp30_ibu;

--2. Modifica�i VIZ_EMP30_PNU astfel �nc�t s� fie posibil� inserarea/modificarea
--con�inutului tabelului de baz� prin intermediul ei.
--Insera�i �i actualiza�i o linie (cu valoarea 300 pentru codul angajatului)

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
 


