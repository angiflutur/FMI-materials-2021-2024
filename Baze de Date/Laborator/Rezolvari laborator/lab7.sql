--16.Schimba�i jobul tuturor salaria�ilor din  departamentul  80  care  au  comision  �n  'SA_REP'.
--Anula�i modific�rile.

UPDATE emp_ibu 
SET job_id = 'SA_REP' 
where department_id=80 AND commission_pct is not NULL;

 ROLLBACK;
 
--17.S� se promoveze Douglas Grant la manager �n departamentul 20, av�nd o cre�tere de salariu cu 1000$.
--Se poate realiza modificarea prin intermediul unei singure comenzi?

UPDATE emp_ibu  SET manager_id= (select employee_id from emp_ibu where 
last_name= 'Grant' and first_name='Douglas' ) where department_id=20;
 SELECT * FROM  emp_ibu where employee_id=199;
 UPDATE emp_ibu  SET salary=salary+1000 where 
last_name= 'Grant' and first_name='Douglas';
 SELECT * FROM  emp_ibu where employee_id=199;
 ROLLBACK;
 
--18.Schimba�i salariul �i comisionul celui mai prost pl�tit salariat din firm�, 
--astfel �nc�t s� fie egale cu salariul si comisionul �efului s�u.
 UPDATE emp_ibu e SET
 (salary,commission_pct) = ( SELECT salary,commission_pct FROM emp_ibu WHERE employee_id = e.manager_id) 
 WHERE salary = (SELECT min(salary) FROM emp_ibu);
 

  ROLLBACK;
  


--23.�terge�i toate �nregistr�rile din tabelul DEPT_PNU. Ce �nregistr�ri se pot �terge?

DELETE FROM emp_ibu;
ROLLBACK;

--24.�terge�i angaja�ii care nu au comision. Anula�i modific�rile.

DELETE FROM emp_ibu WHERE commission_pct IS NULL;
ROLLBACK;

--13.Crea�i 2 tabele emp2_pnu �i emp3_pnu cu  aceea�i structur� ca tabelul EMPLOYEES, 
--dar f�r� �nregistr�ri(accept�m omiterea constr�ngerilor de integritate). 
--Prin intermediul unei singure comenzi,
--copia�i din tabelul EMPLOYEES:-�n tabelul EMP1_PNU salaria�ii care au salariul mai mic dec�t 5000;
--�n tabelul EMP2_PNU salaria�ii care au salariul cuprins �ntre 5000 �i 10000;
---�n tabelul EMP3_PNU salaria�ii care au salariul mai mare dec�t 10000.
--Verifica�i rezultatele, 
--apoi �terge�i toate �nregistr�rile din aceste tabele.

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



