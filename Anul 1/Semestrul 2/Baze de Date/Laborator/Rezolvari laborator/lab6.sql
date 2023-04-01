--10.Utiliz�nd clauza WITH, s� se scrie o cerere care afi�eaz� numele departamentelor �i
--valoarea total� a salariilor din cadrul acestora. Se vor considera departamentele a c�ror valoare
--total� a salariilor este mai mare dec�t media valorilor totale ale salariilor tuturor angajatilor.

WITH val_dep AS (SELECT department_name, SUM(salary) AS total
FROM departments d, employees e
WHERE d.department_id = e.department_id
GROUP BY department_name),
val_medie AS (SELECT SUM(total)/COUNT(*) AS medie
FROM val_dep)
SELECT *
FROM val_dep
WHERE total > (SELECT medie
FROM val_medie)
ORDER BY department_name;

--val_dep pentru numele departamentului si pentru suma salariilor pe dep. respectiv si val_medie
--a salariilor.

--11.S� se afi�eze ierarhic codul, prenumele �i numele (pe aceea�i coloan�), codul job-ului �i data
--angaj�rii, pornind de la subordona�ii direc�i ai lui Steven King care au cea mai mare vechime.
--Rezultatul nu va con�ine angaja�ii �n anul 1970.
WITH emp_sk AS
(SELECT employee_id, hire_date
FROM employees
WHERE manager_id = (SELECT employee_id
FROM employees
WHERE INITCAP(last_name) = 'King'
AND INITCAP(first_name) = 'Steven'))
SELECT employee_id, INITCAP(first_name) ||' '||UPPER(last_name)Nume,
job_id, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'yyyy') != 1970
START WITH (employee_id, hire_date) IN
(SELECT employee_id, hire_date
FROM emp_sk
WHERE hire_date = (SELECT MIN(hire_date)
FROM emp_sk))
CONNECT BY PRIOR employee_id = manager_id;

--13.S� se determine cele mai slab pl�tite 3 job-uri, din punct de vedere al mediei salariilor
--acestora.

SELECT * FROM (SELECT avg(salary), job_id FROM employees GROUP BY job_id ORDER BY avg(salary) ASC)?
WHERE ROWNUM < 4;
 
--creare tabele 
CREATE TABLE EMP_ibu AS SELECT * FROM employees;
CREATE TABLE DEPT_ibu AS SELECT * FROM departments;

INSERT INTO DEPT_ibu (department_id, department_name)VALUES (200, 'Iuliana');

select * from DEPT_ibu where department_name='Iuliana';