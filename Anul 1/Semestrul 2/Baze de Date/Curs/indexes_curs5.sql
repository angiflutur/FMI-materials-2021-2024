select rowid, e.* from employees e;

select * from user_indexes 
where table_name = 'EMPLOYEES';

--FULL
select last_name from employees where salary > 100;

select * from employees where employee_id > 100;

--BY INDEX ROWID
select * from employees where employee_id > 100 and employee_id < 200;

--FULL
select last_name from employees where salary > 5000 and salary  < 9000;

create index idx_salary_emp on employees(salary);

--FULL
select last_name from employees where salary > 5000 and salary  < 10000;

--INDEX SCAN
select last_name from employees where salary > 5000 and salary  < 6000;


select * from employees where  employee_id = 101;


select * from user_indexes 
where table_name = 'EMPLOYEES';

select * from user_constraints 
where table_name = 'WITH_INDEX';

select ut.iot_type, ut.* from user_tables ut;

--15. Crearea unui index care s? optimizeze o cerere de tip c?utare cu 2 criterii. Specifica?i cererea.

CREATE TABLE dep_iot
(id           NUMBER(10),
 department_name  VARCHAR2(50)  NOT NULL,
 CONSTRAINT pk_dep_iot PRIMARY KEY (id)
)
ORGANIZATION INDEX; 

CREATE TABLE dep
(id           NUMBER(10),
 department_name  VARCHAR2(50)  NOT NULL,
 CONSTRAINT pk_dep PRIMARY KEY (id)
);

insert into dep_iot(id, department_name)
values(1, 'dep 1');

insert into dep_iot(id, department_name)
values(2, 'dep 2');

insert into dep_iot(id, department_name)
values(100, 'dep 100');

insert into dep_iot(id, department_name)
values(4, 'dep 4');

--FAST FULL SCAN
--database accesses the data in the index itself without accessing the table
select rowid, di.* from dep_iot di;

--UNIQUE SCAN
--index unique scan must have either 0 or 1 rowid associated with an index key.
select rowid, di.* from dep_iot di where di.id = 1;

insert into dep(id, department_name)
values(1, 'dep 1');


insert into dep(id, department_name)
values(2, 'dep 2');

insert into dep(id, department_name)
values(100, 'dep 100');

insert into dep(id, department_name)
values(4, 'dep 4');

commit;


select rowid, d.* from dep_iot d;

--UNIQUE SCAN
select rowid, d.* from dep_iot d where id = 1;

select * from employees where  employee_id = 101;









select rowid from employees;
select rowid, id from dep_iot;
select rowid, id from dep;


CREATE TABLE emp
(id           NUMBER(10),
 name         VARCHAR2(50)  NOT NULL,
 en           VARCHAR2(2),
 fr           VARCHAR2(2),
 CONSTRAINT pk_emp PRIMARY KEY (id)
);

insert into emp(id, name, en, fr)
values(1, 'Smith', 'A1', 'C1');

insert into emp(id, name, en, fr)
values(2, 'Adam', 'A1', 'C2');

insert into emp(id, name, en, fr)
values(3, 'Green', 'A2', 'C1');

commit;

select * from emp 
where en = 'A1' and fr = 'C1';



create bitmap index bidx_emp_en on emp(en);
create bitmap index bidx_emp_fr on emp(fr);

--BY INDEX ROWID
--BITMAP OR
select * from emp 
where en = 'A1' or fr = 'A2';

