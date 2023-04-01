select * from user_tables;

select * from all_tables;

select * from user_objects;



create table employees_cpy as select * from employees;
create table departments_cpy as select * from departments;

alter table employees_cpy 
add constraint pk_emp_cpy primary key (employee_id); 

alter table departments_cpy 
add constraint pk_dep_cpy primary key (department_id); 

select * from user_constraints;

alter table employees_cpy 
add constraint fk_dep_emp foreign key (department_id) references departments(department_id); 

create or replace view info_emp as
select employee_id, last_name, salary 
from employees_cpy;

select * from info_emp;

select * 
from (
    select employee_id, last_name, salary 
    from employees_cpy
);

update info_emp
set salary = 30000
where employee_id = 100;

select * from employees_cpy 
where employee_id = 100;


create or replace view info_emp as
select employee_id, last_name, salary * 12 sal_anual 
from employees_cpy;

update info_emp
set sal_anual = 30000
where employee_id = 100;

select  * from user_updatable_columns where table_name = 'INFO_EMP';


--14. Crearea unei vizualiz?ri compuse. 
--Da?i un exemplu de opera?ie LMD permis? pe vizualizarea respectiv? ?i un exemplu de opera?ie LMD nepermis?.

create or  replace  view v_emp_dep as
select e.last_name, d.department_name
from employees_cpy e join departments_cpy d on (e.department_id = d.department_id);

select  * from user_updatable_columns where table_name = 'V_EMP_DEP';
