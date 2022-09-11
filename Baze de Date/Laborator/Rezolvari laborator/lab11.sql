--Crea�i o secven�� pentru generarea codurilor de departamente, SEQ_DEPT_PNU.
--Secven�a va �ncepe de la 400, va cre�te cu 10 de fiecare dat� �i va avea valoarea maxim�
--10000, nu va cicla �i nu va �nc�rca nici un num�r �nainte de cerere.
CREATE SEQUENCE SEQ_DEPT_IBU
		INCREMENT BY 10
		START WITH 400
		MAXVALUE 10000
		NOCACHE
		NOCYCLE;
  
DROP SEQUENCE SEQ_DEPT_IBU;

--15. S� se selecteze informa�ii despre secven�ele utilizatorului curent
--(nume, valoare minim�, maxim�, de incrementare, ultimul num�r generat).
SELECT * FROM USER_SEQUENCES;

--16.Crea�i o secven�� pentru generarea codurilor de angaja�i, SEQ_EMP_PNU.
CREATE SEQUENCE SEQ_EMP_IBU
		INCREMENT BY 1
		START WITH 1
		MAXVALUE 10000
		NOCACHE
		NOCYCLE;
DROP SEQUENCE SEQ_EMP_IBU;

--17.S� se modifice toate liniile din EMP_PNU (dac� nu mai exist�, �l recrea�i),
--regener�nd codul angaja�ilor astfel �nc�t s� utilizeze secven�a SEQ_EMP_PNU 
--�i s� avem continuitate �n codurile angaja�ilor.
UPDATE emp_ibu set employee_id= SEQ_EMP_IBU.nextval ; 
select* from emp_ibu;
ROLLBACK;
DROP TABLE emp_ibu;

--18. S� se insereze c�te o inregistrare nou� �n EMP_PNU 
--�i DEPT_PNU utiliz�nd cele 2 secven�e create
INSERT INTO emp_ibu(employee_id, last_name, email ,hire_date, salary, job_id)
VALUES ((seq_emp_ibu.currval) +1,'n2','e2', SYSDATE, 5000,'SA_REP');

--19. S� se selecteze valorile curente ale celor 2 secven�e.
SELECT seq_emp_ibu.currval FROM dual ;

--6. S� se creeze vizualizarea VIZ_DEPT_SUM_PNU, care con�ine codul departamentului
--�i pentru fiecare departament salariul minim, maxim si media salariilor.
--Ce fel de vizualizare se ob�ine (complex� sau simpl�)?
--Se poate actualiza vreo coloan� prin intermediul acestei vizualiz�ri?

create view VIZ_DEPT_SUM_ibu(dep, maxim, minim, average) as
(select department_id, max(salary), min(salary), avg(salary) from emp_ibu group by department_id) ;
drop view VIZ_DEPT_SUM_ibu;
--exercitiul 17 din laboratorul 7
--1. S� se afi�eze numele, job-ul �i salariul angaja�ilor care au salariul cuprins �ntre 2 
--numere introduse de utilizator.
ACCEPT n PROMPT 'n='
ACCEPT m PROMPT 'm='
SELECT last_name, job_id, salary
FROM employees
WHERE salary BETWEEN &n AND &m;

--2. S� se men�in� �ntr-o variabil� de leg�tur� numele salariatului av�nd codul 100.
VARIABLE v_nume VARCHAR2(20)
BEGIN
SELECT last_name
INTO :v_nume
FROM employees
WHERE employee_id = 100;
END;
/
PRINT v_nume

