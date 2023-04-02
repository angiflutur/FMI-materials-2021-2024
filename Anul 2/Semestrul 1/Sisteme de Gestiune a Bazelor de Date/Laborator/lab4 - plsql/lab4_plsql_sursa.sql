--lab 4 PLSQL
   
--1 
DECLARE
  v_nume employees.last_name%TYPE := Initcap('&p_nume');   

  FUNCTION f1 RETURN NUMBER IS
    salariu employees.salary%type; 
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
    RETURN salariu;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE('Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Alta eroare!');
  END f1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Salariul este '|| f1);

--EXCEPTION
--  WHEN OTHERS THEN
--    DBMS_OUTPUT.PUT_LINE('Eroarea are codul = '||SQLCODE
--            || ' si mesajul = ' || SQLERRM);
END;
/
--Bell, King, Kimball

--2
CREATE OR REPLACE FUNCTION f2_*** 
  (v_nume employees.last_name%TYPE DEFAULT 'Bell')    
RETURN NUMBER IS
    salariu employees.salary%type; 
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
    RETURN salariu;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
END f2_***;
/

-- metode de apelare
-- bloc plsql
BEGIN
  DBMS_OUTPUT.PUT_LINE('Salariul este '|| f2_***);
END;
/

BEGIN
  DBMS_OUTPUT.PUT_LINE('Salariul este '|| f2_***('King'));
END;
/

-- SQL
  SELECT f2_*** FROM DUAL;
  SELECT f2_***('King') FROM DUAL;

-- SQL*PLUS CU VARIABILA HOST
  VARIABLE nr NUMBER
  EXECUTE :nr := f2_***('Bell');
  PRINT nr
  
-- 3 
-- varianta 1
DECLARE
  v_nume employees.last_name%TYPE := Initcap('&p_nume');   
  
  PROCEDURE p3 
  IS 
      salariu employees.salary%TYPE;
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
    DBMS_OUTPUT.PUT_LINE('Salariul este '|| salariu);
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       DBMS_OUTPUT.PUT_LINE('Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Alta eroare!');
  END p3;

BEGIN
  p3;
END;
/

-- varianta 2
DECLARE
  v_nume employees.last_name%TYPE := Initcap('&p_nume');  
  v_salariu employees.salary%type;

  PROCEDURE p3(salariu OUT employees.salary%type) IS 
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000,'Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001,'Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
  END p3;

BEGIN
  p3(v_salariu);
  DBMS_OUTPUT.PUT_LINE('Salariul este '|| v_salariu);
END;
/
 
--4
-- varianta 1
CREATE OR REPLACE PROCEDURE p4_***
      (v_nume employees.last_name%TYPE)
  IS 
      salariu employees.salary%TYPE;
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
    DBMS_OUTPUT.PUT_LINE('Salariul este '|| salariu);
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
  END p4_***;
/

-- metode apelare
-- 1. Bloc PLSQL
BEGIN
  p4_***('Bell');
END;
/

-- 2. SQL*PLUS
EXECUTE p4_***('Bell');
EXECUTE p4_***('King');
EXECUTE p4_***('Kimball');

-- varianta 2
CREATE OR REPLACE PROCEDURE 
       p4_***(v_nume IN employees.last_name%TYPE,
               salariu OUT employees.salary%type) IS 
  BEGIN
    SELECT salary INTO salariu 
    FROM   employees
    WHERE  last_name = v_nume;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR(-20000, 'Nu exista angajati cu numele dat');
    WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi angajati cu numele dat');
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
  END p4_***;
/

-- metode apelare
-- Bloc PLSQL
DECLARE
   v_salariu employees.salary%type;
BEGIN
  p4_***('Bell',v_salariu);
  DBMS_OUTPUT.PUT_LINE('Salariul este '|| v_salariu);
END;
/

-- SQL*PLUS
VARIABLE v_sal NUMBER
EXECUTE p4_*** ('Bell',:v_sal)
PRINT v_sal

--5
VARIABLE ang_man NUMBER
BEGIN
 :ang_man:=200;
END;
/

CREATE OR REPLACE PROCEDURE p5_***  (nr IN OUT NUMBER) IS 
BEGIN
 SELECT manager_id INTO nr
 FROM employees
 WHERE employee_id=nr;
END p5_***;
/

EXECUTE p5_*** (:ang_man)
PRINT ang_man

--6
DECLARE
nume employees.last_name%TYPE;
PROCEDURE p6 (rezultat OUT employees.last_name%TYPE,
              comision IN  employees.commission_pct%TYPE:=NULL,
              cod      IN  employees.employee_id%TYPE:=NULL) 
 IS
 BEGIN
 IF (comision IS NOT NULL) THEN
    SELECT last_name 
    INTO rezultat
    FROM employees
    WHERE commission_pct= comision;
    DBMS_OUTPUT.PUT_LINE('numele salariatului care are comisionul ' 
                        ||comision||' este '||rezultat);
 ELSE 
    SELECT last_name 
    INTO rezultat
    FROM employees
    WHERE employee_id =cod;
    DBMS_OUTPUT.PUT_LINE('numele salariatului avand codul ' ||cod||' este '||rezultat);
 END IF;
END p6;

BEGIN
  p6(nume,0.4);
  p6(nume,cod=>200);
END;
/

--7
DECLARE
  medie1 NUMBER(10,2);
  medie2 NUMBER(10,2);
  FUNCTION medie (v_dept employees.department_id%TYPE) 
    RETURN NUMBER IS
    rezultat NUMBER(10,2);
  BEGIN
    SELECT AVG(salary) 
    INTO   rezultat 
    FROM   employees
    WHERE  department_id = v_dept;
    RETURN rezultat;
  END;
  
  FUNCTION medie (v_dept employees.department_id%TYPE,
                  v_job employees.job_id %TYPE) 
    RETURN NUMBER IS
    rezultat NUMBER(10,2);
  BEGIN
    SELECT AVG(salary) 
    INTO   rezultat 
    FROM   employees
    WHERE  department_id = v_dept AND job_id = v_job;
    RETURN rezultat;
  END;

BEGIN
  medie1:=medie(80);
  DBMS_OUTPUT.PUT_LINE('Media salariilor din departamentul 80' 
      || ' este ' || medie1);
  medie2 := medie(80,'SA_MAN');
  DBMS_OUTPUT.PUT_LINE('Media salariilor managerilor din'
      || ' departamentul 80 este ' || medie2);
END;
/

--8
CREATE OR REPLACE FUNCTION factorial_***(n NUMBER) 
 RETURN INTEGER 
 IS
 BEGIN
  IF (n=0) THEN RETURN 1;
  ELSE RETURN n*factorial_***(n-1);
  END IF;
END factorial_***;
/

--9
CREATE OR REPLACE FUNCTION medie_*** 
RETURN NUMBER 
IS 
rezultat NUMBER;
BEGIN
  SELECT AVG(salary) INTO   rezultat
  FROM   employees;
  RETURN rezultat;
END;
/
SELECT last_name,salary
FROM   employees
WHERE  salary >= medie_***;




