ALTER TABLE emp_ibu ADD CONSTRAINT pk_emp_ibu PRIMARY KEY(employee_id);
ALTER TABLE dept_ibu ADD CONSTRAINT pk_dept_ibu PRIMARY KEY(department_id);
ALTER TABLE emp_ibu ADD CONSTRAINT fk_emp_dept_ibu FOREIGN KEY(department_id) REFERENCES dept_ibu(department_id);

INSERT INTO DEPT_ibu
VALUES (300, 'Programare');
--Exercitiul 8

INSERT INTO emp_ibu (employee_id, last_name, email, hire_date,
job_id, salary, commission_pct)
VALUES (252, 'Nume252', 'nume252@emp.com',SYSDATE, 'SA_REP', 5000, NULL);


SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct
FROM emp_ibu
WHERE employee_id=252;

ROLLBACK;

INSERT INTO
(SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct
FROM emp_ibu)
VALUES (252, 'Nume252', 'nume252@emp.com',SYSDATE, 'SA_REP', 5000, NULL);

--Introduce?i un angajat precizând pentru valoarea 
--employee_id o subcerere care returneazã (codul maxim +1).

SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct
FROM emp_ibu
WHERE employee_id=252;

ROLLBACK;


INSERT INTO
(SELECT employee_id, last_name, email, hire_date, job_id, salary, commission_pct
FROM emp_ibu)
VALUES ((select max(employee_id)+1 from emp_ibu), 'Nume252', 'nume252@emp.com',SYSDATE, 'SA_REP', 5000, NULL);

RollBACK;
 

-- Exercitiul 10
--Creaþi un nou tabel, numit EMP1_PNU, care va avea aceeaºi structurã ca ºi EMPLOYEES, dar nicio înregistrare.
--Copiaþi în tabelul EMP1_PNU salariaþii (din tabelul EMPLOYEES) al cãror comision depãºeºte 25% din salariu.
CREATE TABLE emp1_ibu AS SELECT * FROM employees WHERE 1=0;
--DELETE FROM emp1_pnu; --necesar daca nu aveam clauza WHERE de mai sus 
INSERT INTO emp1_ibu SELECT * FROM employees WHERE commission_pct > 0.25;
SELECT employee_id, last_name, salary, commission_pct FROM emp1_ibu; 
ROLLBACK;

--11.Inseraþi o nouã înregistrare în tabelul EMP_PNU care sã totalizeze salariile,
--sã calculeze media comisioanelor, iar câmpurile de tip datã sã conþinã data curentã 
--ºi câmpurile de tip caracter sã conþinã textul 'TOTAL'.
--Numele ºi prenumele angajatului vor corespunde utilizatorului curent (USER).
--Pentru câmpul employee_id se va introduce valoarea 0,
--iar manager_id ºi department_id vor avea valoarea null.

INSERT INTO emp_ibu 
SELECT 0,USER,USER, 'TOTAL','TOTAL',SYSDATE, 'TOTAL', SUM(salary), 
ROUND(AVG(commission_pct)), null, null FROM employees;
SELECT * FROM emp_ibu where employee_id=0;
ROLLBACK;