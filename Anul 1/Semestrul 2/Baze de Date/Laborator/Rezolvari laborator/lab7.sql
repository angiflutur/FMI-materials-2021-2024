--16.Schimbaþi jobul tuturor salariaþilor din  departamentul  80  care  au  comision  în  'SA_REP'.
--Anulaþi modificãrile.

UPDATE emp_ibu 
SET job_id = 'SA_REP' 
where department_id=80 AND commission_pct is not NULL;

 ROLLBACK;
 
--17.Sã se promoveze Douglas Grant la manager în departamentul 20, având o creºtere de salariu cu 1000$.
--Se poate realiza modificarea prin intermediul unei singure comenzi?

UPDATE emp_ibu  SET manager_id= (select employee_id from emp_ibu where 
last_name= 'Grant' and first_name='Douglas' ) where department_id=20;
 SELECT * FROM  emp_ibu where employee_id=199;
 UPDATE emp_ibu  SET salary=salary+1000 where 
last_name= 'Grant' and first_name='Douglas';
 SELECT * FROM  emp_ibu where employee_id=199;
 ROLLBACK;
 
--18.Schimbaþi salariul ºi comisionul celui mai prost plãtit salariat din firmã, 
--astfel încât sã fie egale cu salariul si comisionul ºefului sãu.
 UPDATE emp_ibu e SET
 (salary,commission_pct) = ( SELECT salary,commission_pct FROM emp_ibu WHERE employee_id = e.manager_id) 
 WHERE salary = (SELECT min(salary) FROM emp_ibu);
 

  ROLLBACK;
  


--23.ªtergeþi toate înregistrãrile din tabelul DEPT_PNU. Ce înregistrãri se pot ºterge?

DELETE FROM emp_ibu;
ROLLBACK;

--24.ªtergeþi angajaþii care nu au comision. Anulaþi modificãrile.

DELETE FROM emp_ibu WHERE commission_pct IS NULL;
ROLLBACK;

--13.Creaþi 2 tabele emp2_pnu ºi emp3_pnu cu  aceeaºi structurã ca tabelul EMPLOYEES, 
--dar fãrã înregistrãri(acceptãm omiterea constrângerilor de integritate). 
--Prin intermediul unei singure comenzi,
--copiaþi din tabelul EMPLOYEES:-în tabelul EMP1_PNU salariaþii care au salariul mai mic decât 5000;
--în tabelul EMP2_PNU salariaþii care au salariul cuprins între 5000 ºi 10000;
---în tabelul EMP3_PNU salariaþii care au salariul mai mare decât 10000.
--Verificaþi rezultatele, 
--apoi ºtergeþi toate înregistrãrile din aceste tabele.

CREATE TABLE emp2_ibu AS SELECT * FROM employees;
DELETE FROM emp2_ibu;
CREATE TABLE emp3_ibu AS SELECT * FROM employees;
DELETE FROM emp3_ibu;

INSERT FIRST
WHEN salary< 5000 THEN
INTO emp1_ibu 
WHEN  salary > = 5000 AND salary <= 10000 THEN INTO emp2_ibu
WHEN salary > = 10000 THEN INTO emp3_ibu 
SELECT * FROM employees;



