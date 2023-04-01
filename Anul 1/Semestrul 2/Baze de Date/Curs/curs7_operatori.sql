select e.last_name, e.first_name, m.last_name, m.first_name
from employees e join employees m
on e.hire_date < m.hire_date;




select e.last_name, e.first_name, m.last_name, m.first_name
from employees_cpy e join employees_cpy m
on (e.manager_id = m.employee_id or e.hire_date < m.hire_date);



select e.last_name, e.first_name, m.last_name, m.first_name
from employees_cpy e join employees_cpy m
on (e.manager_id = m.employee_id )
union all 
select e.last_name, e.first_name, m.last_name, m.first_name
from employees_cpy e join employees_cpy m
on
(e.hire_date < m.hire_date);







select e.last_name, e.salary, j.job_title
from employees e, jobs j
where e.job_id  <> j.job_id;


--equivalent proiectie

select distinct last_name, first_name from employees;

select last_name, first_name from employees group by last_name, first_name;

    select last_name, first_name, salary
    from 
      (select last_name, first_name, salary, job_id
       from employees);





--selection
select distinct last_name, first_name from employees
where last_name = 'King' or first_name = 'Steven';

--selection and projection
select job_id, job_title, min_salary, max_salary 
from 
(select job_id, job_title, min_salary, max_salary 
from jobs
where min_salary > 8000)
where min_salary < 10000;

select job_id, job_title, min_salary, max_salary 
from jobs
where min_salary > 8000 and min_salary < 10000;

select job_title, min_salary
 from 
     (select job_title, min_salary 
      from jobs)
where min_salary > 8000;
      
select job_title, min_salary
 from 
      (select job_title, min_salary, max_salary 
      from jobs
      where min_salary > 8000 
                  and max_salary <10000);
   

--union and selection
select employee_id, start_date from job_history   
where employee_id > 110
union all
select employee_id, hire_date from employees
where employee_id > 110
order by employee_id;
      
     
select employee_id, start_date data_ang from job_history   
where employee_id > 110
union
select employee_id, hire_date from employees
where employee_id > 110;     
      

select employee_id, start_date data_ang, 1 tip from job_history   
where employee_id > 110
union
select employee_id, hire_date, 2 from employees
where employee_id > 110;     
      
      
      
      
select employee_id, start_date from (      
select employee_id, start_date from job_history   
union all
select employee_id, hire_date from employees
)
where employee_id > 110;      


select last_name, first_name from employees
where department_id = 80;

select last_name, first_name from employees
where department_id = 80
union  
select last_name, first_name from employees
where department_id = 30;



--union optimizations
select * from employees
where last_name like 'K%'
union 
select * from employees
where first_name like 'A%';

select * from employees
where last_name like 'K%' or first_name like 'A%';


    select last_name, 'level 1' from employees
    where salary > 10000
    union 
    select last_name, 'level 2' from employees
    where salary <=10000;


select last_name, case when salary > 10000 then 'level 1' else 'level 2' end 
from employees;

--minus

select department_id
from departments
minus 
select department_id
from employees;

select department_id
from departments d
where d.department_id not in 
    (select department_id 
     from employees 
     where department_id is not null);

select department_id
from departments d
where not exists (select 0 from employees where department_id = d.department_id);

--in  exists

select department_name
from departments 
where department_id  in (select department_id from employees);

select department_name
from departments d
where exists (select 'x' from employees where department_id = d.department_id);



--selection and difference
select department_id
from departments
where department_id > 120
minus 
select department_id
from employees
where department_id > 120;


select * from (
select department_id
from departments
minus 
select department_id
from employees
)
where department_id > 120;


--intersect

    select department_id 
    from employees
    intersect
    select department_id
    from job_history;
    
    
    
    
select * from works_on;

--angajatii care au lucrat la toate proiectele cu un buget mai mic decat 10000

-- angajatii pentru care nu exista proiecte cu un buget mai mic decat 10000
-- la care nu a lucrat angajatul.

select e.last_name
from employees e
where not exists  (/*nu exista proiecte */
                     select 'x' from project p
                     where  budget < 10000
                     and  not exists   (/* la care nu a lucrat angajatul*/ 
                            select 'x'                      
                            from works_on w
                            where w.project_id = p.project_id
                            and w.employee_id = e.employee_id
                       )
                );










select distinct employee_id
from works_on w
where not exists ( /*proiecte cu un buget mai mic decat 10000
-- la care nu a lucrat angajatul
*/ 
        select 'x' from project p
        where budget <=10000
        --la care angajatul nu a lucrat
        and not exists  ( select 'x' from works_on w1
                            where w1.employee_id = w.employee_id
                            and   w1.project_id = p.project_id)
);    
    
    
    


