--19. Sã se modifice adresa de e-mail pentru angajaþii care câºtigã cel mai mult 
--în departamentul 
--în care lucreazã astfel încât acesta sã devinã iniþiala numelui concatenatã cu prenumele.
--Dacã nu are prenume atunci în loc de acesta apare caracterul ‘.’. Anulaþi modificãrile.

UPDATE emp_ibu
SET email = 
CASE 
WHEN first_name is NULL  THEN CONCAT('.', LOWER(SUBSTR(last_name,1,1))) 
ELSE
CONCAT(LOWER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(last_name,1,1)))
END
WHERE employee_id in(select employee_id from
(select employee_id,department_id, max(salary) from emp_ibu 
group by department_id, employee_id));

--25. Suprimaþi departamentele care un au nici un angajat. Anulaþi modificãrile.
delete from departments where department_id not in 
(SELECT unique(departments.department_id)
FROM departments 
INNER JOIN employees
ON departments.department_id = employees.department_id);

ROLLBACK;
-- saaau
delete from dept_lmo tbl1 where 
(select count(employee_id) from 
emp_lmo tbl2 where tbl1.department_id = tbl2.department_id)= 0;