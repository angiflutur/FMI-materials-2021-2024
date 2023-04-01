--6. S� se afi�eze numele �i salariul angaja�ilor al c�ror salariu este mai mare dec�t salariile medii
--din toate departamentele.
SELECT last_name, salary
FROM employees
WHERE salary > ALL (SELECT AVG(salary)
FROM employees
GROUP BY department_id);
--Sau:
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT MAX( AVG(salary) )
FROM employees
GROUP BY department_id);
--7. Sa se afiseze numele si salariul celor mai prost platiti angajati din fiecare departament.

--Solu�ia 3: Subcerere �n clauza FROM (tem�)
select a.last_name, a.salary, a.department_id
from(select department_id dep,min(salary) as sal_min 
from employees group by department_id) sub, employees a
where a.department_id = sub.dep
and a.salary = sub.sal_min;
