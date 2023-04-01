--1.
--a) S� se afi�eze numele departamentelor, titlurile job-urilor �i valoarea medie a salariilor, pentru:
--fiecare departament �i, �n cadrul s�u pentru fiecare job;
--fiecare departament (indiferent de job);
--�ntreg tabelul.
--b) Analog cu a), afi��nd �i o coloan� care arat� interven�ia coloanelor department_name, job_title, �n ob�inerea rezultatului.

select department_name, job_title, round(avg(salary), 0), GROUPING(department_name) dn, GROUPING(job_title) jt FROM
employees e, departments d, jobs j where e.department_id=d.department_id and e.job_id=j.job_id
GROUP BY ROLLUP(department_name, job_title);

--2.
--a) S� se afi�eze numele departamentelor, titlurile job-urilor �i valoarea medie a salariilor, pentru:

--fiecare departament �i, �n cadrul s�u pentru fiecare job;
--fiecare departament (indiferent de job);
--fiecare job (indiferent de departament)
--�ntreg tabelul.

SELECT department_name, job_title, AVG(salary) medie,
GROUPING(department_name) dep,
GROUPING(job_title) job
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
GROUP BY CUBE(department_name, job_title);

--b) Cum intervin coloanele �n ob�inerea rezultatului? S� se afi�eze �Dep�, dac� departamentul a intervenit �n agregare, �i �Job�, dac� job-ul a intervenit �n agregare.

SELECT department_name, job_title, AVG(salary) medie,
DECODE(GROUPING(department_name), 0, 'Dep') dep,
DECODE(GROUPING(job_title), 0, 'Job') job
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
GROUP BY CUBE(department_name, job_title);
--5. a)S� se afi�eze informa�ii despre angaja�ii al c�ror salariu dep�e�te valoarea medie a
--salariilor colegilor s�i de departament.

SELECT employee_id, last_name, first_name, department_id, salary from employees where 
salary >all(select avg(e.salary) from employees e where
e.department_id=department_id);

--b) Analog cu cererea precedent�, afi��ndu-se �i numele departamentului �i media salariilor acestuia �i num�rul de angaja�i 
--(2 solutii: subcerere necorelat� �n clauza FROM, subcerere corelat� �n clauza SELECT).
-- DE FACUT IMPREUNA

--subcerere necorelata in clauza from (numita si view in line)

SELECT last_name, salary, e.department_id, department_name, sal_med, nr_sal
FROM employees e, departments d, (SELECT department_id, round(AVG(salary), 0) sal_med,
COUNT(*) nr_sal
FROM employees
GROUP BY department_id) sm
WHERE e.department_id = d.department_id
AND d.department_id = sm.department_id
AND salary > (SELECT AVG(salary)
FROM employees
WHERE department_id = e.department_id);
/
--subcerere corelat� �n clauza SELECT
--mai sus am creat un view in from, aici puneti direct cererea care creeaza coloanele in select
SELECT last_name, salary, e. department_id, department_name,
(SELECT round(AVG(salary),0)
FROM employees
WHERE department_id = e. department_id) salariu_mediu,
(SELECT COUNT(*)
FROM employees
WHERE department_id = e. department_id) Nr_angajati
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND salary >(SELECT AVG(salary)
FROM employees
WHERE department_id = e.department_id);

--8.Pentru fiecare departament, s� se obtina numele salariatului avand cea mai mare vechime din
--departament. S� se ordoneze rezultatul dup� numele departamentului.
select e.first_name, e.last_name, d.department_name from employees e, departments d where d.department_id=e.department_id and e.hire_date = (SELECT MIN(hire_date)
FROM employees
WHERE department_id = e.department_id) order by 3;

--9. Sa se obtina numele salariatilor care lucreaza intr-un departament in care
--exista cel putin un angajat cu salariul egal cu salariul maxim 
--din departamentul 30 (operatorul exists).
SELECT  e.last_name, e.department_id, e.salary from employees e where
EXISTS ( select p.employee_id from employees p  where  p.department_id = e.department_id
and p.salary =(select max(salary)from employees
where department_id=30));
/
SELECT last_name, department_id
FROM employees e
WHERE EXISTS (SELECT *
FROM employees
WHERE e.department_id = department_id
AND salary = (SELECT MAX(salary)
FROM employees
WHERE department_id =30));
/
--12. S� se determine loca�iile �n care se afl� cel pu�in un departament.
SELECT location_id, city
FROM locations l
WHERE EXISTS (SELECT 'x'
FROM departments
WHERE location_id = l.location_id);

SELECT location_id, city from locations l where EXISTS(select department_id from departments  where 
location_id= l.location_id);
--aici se putea pune orice, important e ca in tabelul departments  sa existe acel location_id, pentru ca oricum fiecare rand
--are department_id

--Obs: �ntruc�t nu este necesar ca instruc�iunea SELECT interioar� s� returneze o anumit� valoare,
--se poate selecta o constant� (�x�, ��, 1 etc.). De altfel, din punct de vedere al performan�ei,
--selectarea unei constante asigur� mai mult� rapiditate dec�t selectarea unei coloane.

--Obs: Ca alternativ� a lui EXISTS, poate fi utilizat operatorul IN. Exemplul precedent poate fi
--rezolvat prin instruc�iunea urm�toare:
SELECT location_id, city
FROM locations
WHERE location_id IN (SELECT location_id
FROM departments);
--13. S� se determine departamentele �n care nu exist� nici un angajat (operatorul exists; cererea a mai fost rezolvata si printr-o cerere necorelata).
SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (SELECT 'x'
FROM employees
WHERE department_id = d.department_id);
/
SELECT * FROM employees
WHERE ROWNUM < 11  ORDER BY salary DESC;