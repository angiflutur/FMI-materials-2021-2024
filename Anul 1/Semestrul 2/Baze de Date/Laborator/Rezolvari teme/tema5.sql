-- 14. S� se afi�eze:
--� suma salariilor, pentru job-urile al c�ror cod �ncepe cu litera S;
--� media general� a salariilor, pentru job-ul av�nd salariul maxim;
--� salariul minim pe job, pentru fiecare dintre celelalte job-uri.

SELECT SUM(salary) FROM  employees WHERE job_id LIKE 'S%' group by  job_id;

SELECT AVG(salary) FROM  employees WHERE job_id =(select job_id from employees where salary=(select max(salary) from employees));  

SELECT job_id, min(salary) FROM employees WHERE job_id != (select job_id from employees where salary = (select max(salary) from employees)) group by job_id;

