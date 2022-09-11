--Creaþi o secvenþã pentru generarea codurilor de departamente, SEQ_DEPT_PNU.
--Secvenþa va începe de la 400, va creºte cu 10 de fiecare datã ºi va avea valoarea maximã
--10000, nu va cicla ºi nu va încãrca nici un numãr înainte de cerere.
CREATE SEQUENCE SEQ_DEPT_IBU
		INCREMENT BY 10
		START WITH 400
		MAXVALUE 10000
		NOCACHE
		NOCYCLE;
  
DROP SEQUENCE SEQ_DEPT_IBU;

--15. Sã se selecteze informaþii despre secvenþele utilizatorului curent
--(nume, valoare minimã, maximã, de incrementare, ultimul numãr generat).
SELECT * FROM USER_SEQUENCES;

--16.Creaþi o secvenþã pentru generarea codurilor de angajaþi, SEQ_EMP_PNU.
CREATE SEQUENCE SEQ_EMP_IBU
		INCREMENT BY 1
		START WITH 1
		MAXVALUE 10000
		NOCACHE
		NOCYCLE;
DROP SEQUENCE SEQ_EMP_IBU;

--17.Sã se modifice toate liniile din EMP_PNU (dacã nu mai existã, îl recreaþi),
--regenerând codul angajaþilor astfel încât sã utilizeze secvenþa SEQ_EMP_PNU 
--ºi sã avem continuitate în codurile angajaþilor.
UPDATE emp_ibu set employee_id= SEQ_EMP_IBU.nextval ; 
select* from emp_ibu;
ROLLBACK;
DROP TABLE emp_ibu;

--18. Sã se insereze câte o inregistrare nouã în EMP_PNU 
--ºi DEPT_PNU utilizând cele 2 secvenþe create
INSERT INTO emp_ibu(employee_id, last_name, email ,hire_date, salary, job_id)
VALUES ((seq_emp_ibu.currval) +1,'n2','e2', SYSDATE, 5000,'SA_REP');

--19. Sã se selecteze valorile curente ale celor 2 secvenþe.
SELECT seq_emp_ibu.currval FROM dual ;

--6. Sã se creeze vizualizarea VIZ_DEPT_SUM_PNU, care conþine codul departamentului
--ºi pentru fiecare departament salariul minim, maxim si media salariilor.
--Ce fel de vizualizare se obþine (complexã sau simplã)?
--Se poate actualiza vreo coloanã prin intermediul acestei vizualizãri?

create view VIZ_DEPT_SUM_ibu(dep, maxim, minim, average) as
(select department_id, max(salary), min(salary), avg(salary) from emp_ibu group by department_id) ;
drop view VIZ_DEPT_SUM_ibu;
--exercitiul 17 din laboratorul 7
--1. Sã se afiºeze numele, job-ul ºi salariul angajaþilor care au salariul cuprins între 2 
--numere introduse de utilizator.
ACCEPT n PROMPT 'n='
ACCEPT m PROMPT 'm='
SELECT last_name, job_id, salary
FROM employees
WHERE salary BETWEEN &n AND &m;

--2. Sã se menþinã într-o variabilã de legãturã numele salariatului având codul 100.
VARIABLE v_nume VARCHAR2(20)
BEGIN
SELECT last_name
INTO :v_nume
FROM employees
WHERE employee_id = 100;
END;
/
PRINT v_nume

