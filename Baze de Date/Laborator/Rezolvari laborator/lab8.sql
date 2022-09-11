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

--Introduce?i un angajat preciz�nd pentru valoarea 
--employee_id o subcerere care returneaz� (codul maxim +1).

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
--Crea�i un nou tabel, numit EMP1_PNU, care va avea aceea�i structur� ca �i EMPLOYEES, dar nicio �nregistrare.
--Copia�i �n tabelul EMP1_PNU salaria�ii (din tabelul EMPLOYEES) al c�ror comision dep�e�te 25% din salariu.
CREATE TABLE emp1_ibu AS SELECT * FROM employees WHERE 1=0;
--DELETE FROM emp1_pnu; --necesar daca nu aveam clauza WHERE de mai sus 
INSERT INTO emp1_ibu SELECT * FROM employees WHERE commission_pct > 0.25;
SELECT employee_id, last_name, salary, commission_pct FROM emp1_ibu; 
ROLLBACK;

--11.Insera�i o nou� �nregistrare �n tabelul EMP_PNU care s� totalizeze salariile,
--s� calculeze media comisioanelor, iar c�mpurile de tip dat� s� con�in� data curent� 
--�i c�mpurile de tip caracter s� con�in� textul 'TOTAL'.
--Numele �i prenumele angajatului vor corespunde utilizatorului curent (USER).
--Pentru c�mpul employee_id se va introduce valoarea 0,
--iar manager_id �i department_id vor avea valoarea null.

INSERT INTO emp_ibu 
SELECT 0,USER,USER, 'TOTAL','TOTAL',SYSDATE, 'TOTAL', SUM(salary), 
ROUND(AVG(commission_pct)), null, null FROM employees;
SELECT * FROM emp_ibu where employee_id=0;
ROLLBACK;