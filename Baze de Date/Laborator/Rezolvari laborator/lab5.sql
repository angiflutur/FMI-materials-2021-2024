--1.
--a) Sã se afiºeze numele departamentelor, titlurile job-urilor ºi valoarea medie a salariilor, pentru:
--fiecare departament ºi, în cadrul sãu pentru fiecare job;
--fiecare departament (indiferent de job);
--întreg tabelul.
--b) Analog cu a), afiºând ºi o coloanã care aratã intervenþia coloanelor department_name, job_title, în obþinerea rezultatului.

select department_name, job_title, round(avg(salary), 0), GROUPING(department_name) dn, GROUPING(job_title) jt FROM
employees e, departments d, jobs j where e.department_id=d.department_id and e.job_id=j.job_id
GROUP BY ROLLUP(department_name, job_title);

--2.
--a) Sã se afiºeze numele departamentelor, titlurile job-urilor ºi valoarea medie a salariilor, pentru:

--fiecare departament ºi, în cadrul sãu pentru fiecare job;
--fiecare departament (indiferent de job);
--fiecare job (indiferent de departament)
--întreg tabelul.

SELECT department_name, job_title, AVG(salary) medie,
GROUPING(department_name) dep,
GROUPING(job_title) job
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
GROUP BY CUBE(department_name, job_title);

--b) Cum intervin coloanele în obþinerea rezultatului? Sã se afiºeze ’Dep’, dacã departamentul a intervenit în agregare, ºi ‘Job’, dacã job-ul a intervenit în agregare.

SELECT department_name, job_title, AVG(salary) medie,
DECODE(GROUPING(department_name), 0, 'Dep') dep,
DECODE(GROUPING(job_title), 0, 'Job') job
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
GROUP BY CUBE(department_name, job_title);
--5. a)Sã se afiºeze informaþii despre angajaþii al cãror salariu depãºeºte valoarea medie a
--salariilor colegilor sãi de departament.

SELECT employee_id, last_name, first_name, department_id, salary from employees where 
salary >all(select avg(e.salary) from employees e where
e.department_id=department_id);

--b) Analog cu cererea precedentã, afiºându-se ºi numele departamentului ºi media salariilor acestuia ºi numãrul de angajaþi 
--(2 solutii: subcerere necorelatã în clauza FROM, subcerere corelatã în clauza SELECT).
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
--subcerere corelatã în clauza SELECT
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

--8.Pentru fiecare departament, sã se obtina numele salariatului avand cea mai mare vechime din
--departament. Sã se ordoneze rezultatul dupã numele departamentului.
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
--12. Sã se determine locaþiile în care se aflã cel puþin un departament.
SELECT location_id, city
FROM locations l
WHERE EXISTS (SELECT 'x'
FROM departments
WHERE location_id = l.location_id);

SELECT location_id, city from locations l where EXISTS(select department_id from departments  where 
location_id= l.location_id);
--aici se putea pune orice, important e ca in tabelul departments  sa existe acel location_id, pentru ca oricum fiecare rand
--are department_id

--Obs: Întrucât nu este necesar ca instrucþiunea SELECT interioarã sã returneze o anumitã valoare,
--se poate selecta o constantã (‘x’, ‘’, 1 etc.). De altfel, din punct de vedere al performanþei,
--selectarea unei constante asigurã mai multã rapiditate decât selectarea unei coloane.

--Obs: Ca alternativã a lui EXISTS, poate fi utilizat operatorul IN. Exemplul precedent poate fi
--rezolvat prin instrucþiunea urmãtoare:
SELECT location_id, city
FROM locations
WHERE location_id IN (SELECT location_id
FROM departments);
--13. Sã se determine departamentele în care nu existã nici un angajat (operatorul exists; cererea a mai fost rezolvata si printr-o cerere necorelata).
SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (SELECT 'x'
FROM employees
WHERE department_id = d.department_id);
/
SELECT * FROM employees
WHERE ROWNUM < 11  ORDER BY salary DESC;