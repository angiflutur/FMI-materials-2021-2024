--20. S� se ob�in� num�rul departamentelor care au cel pu�in 15 angaja�i.
SELECT count(*)
FROM (SELECT department_id, count(employee_id)
FROM employees
GROUP BY department_id
HAVING count(employee_id)>=15);

SELECT department_id, count(employee_id)
FROM employees
GROUP BY department_id
HAVING count(employee_id)>=15;

--23. Scrieti o cerere pentru a afisa, pentru departamentele avand codul > 80, salariul total
--pentru fiecare job din cadrul departamentului. Se vor afisa orasul, numele
--departamentului, jobul si suma salariilor. Se vor eticheta coloanele corespunzator.
--Obs: Plasa�i condi�ia department_id > 80, pe r�nd, �n clauzele WHERE �i HAVING.
--Testa�i �n fiecare caz. Ce se observ�? Care este diferen�a dintre cele dou� abord�ri?

SELECT department_id,department_name,city,job_id,sum(salary)
FROM employees JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE department_id>80
GROUP BY department_id,department_name, job_id,city;
--HAVING department_id>80;

--erau acceptate ambele variante, atat cu where cat si cu having, iar rezultatul era la fel.