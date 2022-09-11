--T1
drop table emp;
create table emp as select * from employees; 

--dirty write 

--T1
select salary from emp where employee_id = 104;
--6000 

update emp
set salary = salary  + 1000
where employee_id = 104;

--T2
    update emp
    set salary = salary  + 2000
    where employee_id = 104;

--T1
rollback;


--T2
    select salary from emp where employee_id = 104;
    --8000
    
    commit;


--T1
select salary from emp where employee_id = 104;
--8000   !!! corect, nu se inregistreaza 9000



--lost update 

--T1
select salary from emp where employee_id = 104;
--8000 

update emp
set salary = salary  + 1000
where employee_id = 104;

--T2
    update emp
    set salary = salary  + 2000
    where employee_id = 104;

--T1
commit;


--T2

    
    select salary from emp where employee_id = 104;
    
    commit;
    --11000 corect, nu se inregistreaza 10000


--T1
select salary from emp where employee_id = 104;
--11000 


--T1
--dirty read
select salary, commission_pct, department_id from emp where employee_id = 145;
--14000 0.4  80

update emp
set department_id  = 70
where employee_id = 145;

--T2
    
    update emp
    set commission_pct = 0.2
    where department_id = 70;
    
    select salary, commission_pct, department_id from emp where employee_id = 145;

--T1
rollback;

--T2
    select salary, commission_pct, department_id from emp where employee_id = 145;
    
    commit;


--T1
--non-repeatable reads possible
select salary, commission_pct, department_id from emp where employee_id = 145;
--14000 0.4  80
update emp 
set commission_pct = 0.5
where employee_id = 145;


--T2
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    select salary, commission_pct, department_id from emp 
    where employee_id = 145;

--T1
commit;

--T2
    --update emp
    --set commission_pct = commission_pct + 0.1
    --where employee_id = 145 ;

    select salary, commission_pct, department_id from emp 
    where employee_id = 145;

    --14000 0.6  80
    
    rollback;
  

--T1
--non-repeatable reads not possible
select salary, commission_pct, department_id from emp where employee_id = 145;
--14000 0.6  80
update emp 
set commission_pct = 0.7
where employee_id = 145;


--T2
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    select salary, commission_pct, department_id from emp 
    where employee_id = 145;

--T1
commit;

--T2
    --can't serialize access for transaction
    
    update emp
    set commission_pct = commission_pct + 0.1
    where employee_id = 145 ;

    select salary, commission_pct, department_id from emp 
    where employee_id = 145;

    --14000 0.6  80

    commit;

--T2
--phantom possible
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    select avg(salary) from emp;
--6508.41121

--T1
insert into emp(employee_id, last_name, first_name, job_id, salary, hire_date, email)
values (300, 'A', 'B', 'IT_PROG', 45000, sysdate, 'ab');
   
commit;
   
--T2    
    select avg(salary) from emp;
--6864.8148
    commit;


--T2
--phantom possible
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    select avg(salary) from emp;
--6864.8148



--T1
insert into emp(employee_id, last_name, first_name, job_id, salary, hire_date, email)
values (301, 'A', 'B', 'IT_PROG', 50000, sysdate, 'ab');

select avg(salary) from emp;   
--7260.5504
commit;
   
--T2    
    select avg(salary) from emp;
--6864.8148
