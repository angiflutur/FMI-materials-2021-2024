tema 9

-- 8
--a) Definiti o vizualizare, VIZ_EMP_S_PNU, care sa contina detalii 
--despre angajatii corespunzatori departamentelor care încep cu litera S. 
--Se pot insera/actualiza linii prin intermediul acestei vizualizari
--În care dintre tabele?
--Ce se întâmpla la stergerea prin intermediul vizualizarii? 

create view viz_emp_S_af(cod, nume, prenume, email, salariu, data, job)
as select employee_id, last_name, first_name, email, salary, hire_date, job_id
from emp_af where department_id in (select department_id
                                    from dept_af
                                    where lower(department_name) like 's%');
select cod from viz_emp_S_af;
delete from viz_emp_S_af where cod = 120;
rollback;
-- nu putem actualiza cod, 
-- putem actualiza salariu, nume, prenume, email, job, data
-- nu putem insera - unique constraint violated
-- putem sterge linii
drop view viz_emp_S_af;


-- b) Recreati vizualizarea astfel încât sa nu se permita nici o 
-- operatie asupra tabelelor de baza prin intermediul ei. 
-- Încercati sa introduceti sau sa actualizati înregistrari 
-- prin intermediul acestei vizualizari.

create view viz_emp_S_af(cod, nume, prenume, email, salariu, data, job)
as select employee_id, last_name, first_name, email, salary, hire_date, job_id
from emp_af where department_id in (select department_id
                                    from dept_af
                                    where lower(department_name) like 's%') with read only;
update viz_emp_S_af set salariu = 1000;

drop view viz_emp_S_af;