--20. Sã se obþinã numãrul departamentelor care au cel puþin 15 angajaþi.
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
--Obs: Plasaþi condiþia department_id > 80, pe rând, în clauzele WHERE ºi HAVING.
--Testaþi în fiecare caz. Ce se observã? Care este diferenþa dintre cele douã abordãri?

SELECT department_id,department_name,city,job_id,sum(salary)
FROM employees JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE department_id>80
GROUP BY department_id,department_name, job_id,city;
--HAVING department_id>80;

--erau acceptate ambele variante, atat cu where cat si cu having, iar rezultatul era la fel.