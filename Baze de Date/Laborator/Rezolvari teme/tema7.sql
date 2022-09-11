--20.Pentru fiecare departament sã se mãreascã salariul celor care au fost angajaþi primii 
--astfel încât sã devinã media salariilor din companie. 
--Þineþi cont de liniile introduse anterior.

update emp_ibu i
set salary = (select avg(salary)
              from emp_ibu)
where hire_date = (select min(hire_date)
                      from emp_ibu e
                      where i.department_id = e.department_id);

ROLLBACK;

UPDATE EMP_ibu SET salary = (SELECT ROUND(AVG(salary),0) FROM EMP_ibu)
WHERE employee_id IN (SELECT employee_id FROM EMP_ibu e JOIN DEPT_ibu d ON (e.department_id=d.department_id)
WHERE hire_date IN (SELECT MIN(hire_date) FROM EMP_ibu WHERE department_id=d.department_id));
--21. S? se modifice jobul si departamentul angajatului având codul 114, 
--astfel încât s? fie la fel cu cele ale angajatului având codul 205.

UPDATE emp_ibu
SET (job_id, department_id) = (SELECT job_id, department_id
FROM emp_ibu
WHERE employee_id = 205)
WHERE employee_id = 114;

ROLLBACK;