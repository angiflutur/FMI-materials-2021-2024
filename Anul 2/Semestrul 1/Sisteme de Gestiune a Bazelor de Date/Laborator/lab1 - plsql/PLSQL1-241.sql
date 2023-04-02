--LAB PLSQL 1
--Definire de variable

declare
--  idul member.member_id%type not null; --a variable declared NOT NULL must have an initialization assignment
  idul member.member_id%type not null;
  membru member%rowtype; --- membru.member_id, membru.last_name
  begin
    null;
  end;
  /
  
declare
--  idul member.member_id%type not null; --a variable declared NOT NULL must have an initialization assignment
  idul member.member_id%type not null := 1;
  membru member%rowtype; --- membru.member_id, membru.last_name
  begin
    --null;
    DBMS_OUTPUT.PUT('test1 ');
    DBMS_OUTPUT.PUT_LINE('hello world! Id-ul este '|| idul);
    DBMS_OUTPUT.PUT_LINE('test2');
    DBMS_OUTPUT.PUT_LINE('test3 ');
  end;
  /

--1
--a
DECLARE
    v_nume, v_prenume VARCHAR2(35);
  begin
    null;
  end;
/
--corecta
DECLARE
    v_nume VARCHAR2(35);
    v_prenume VARCHAR2(35);
  begin
    null;
  end;
/
--b
DECLARE
       v_nr  NUMBER(5);
  begin
    null;
  end;
/
--c
DECLARE
       v_nr NUMBER(5,2) = 10; --nu
  begin
    null;
  end;
/

DECLARE
       v_nr NUMBER(5,2) := 10; --da
  begin
    null;
  end;
/
--d
DECLARE
       v_test   BOOLEAN:= SYSDATE;  --nu
 begin
    null;
  end;
/

DECLARE
       v_test   BOOLEAN:= false;  --da
 begin
    null;
  end;
/

DECLARE
       v_test   date:= SYSDATE;  --nu
 begin
    null;
  end;
/

--e
DECLARE
       v1  NUMBER(5) :=10;
       v2  NUMBER(5) :=15;
       v3  NUMBER(5) := v1< v2;  -- expression is of wrong type
 begin
    null;
  end;
/


DECLARE
       v1  NUMBER(5) :=10;
       v2  NUMBER(5) :=15;
       v3  Boolean := v1< v2;  -- ok
 begin
   null;
  end;
/
--2
<< principal >> 
DECLARE
    v_client_id       NUMBER(4) := 1600;
    v_client_nume     VARCHAR2(50) := 'N1';
    v_nou_client_id   NUMBER(3) := 500;
    v_nou_client_nume   VARCHAR2(50);
BEGIN
    << secundar >> 
    DECLARE
        var  NUMBER(4) := 0;
        v_client_id         NUMBER(4) := 0;
        v_client_nume       VARCHAR2(50) := 'N2';
        v_nou_client_id     NUMBER(3) := 300;
        v_nou_client_nume   VARCHAR2(50) := 'N3';
    BEGIN
        v_client_id := v_nou_client_id;
        principal.v_client_nume := v_client_nume
                                   || ' '
                                   || v_nou_client_nume; 
        DBMS_OUTPUT.PUT_LINE('Pozitia 1');                 
        DBMS_OUTPUT.PUT_LINE(v_client_id);
        DBMS_OUTPUT.PUT_LINE( v_client_nume);
        DBMS_OUTPUT.PUT_LINE (v_nou_client_id);
        DBMS_OUTPUT.PUT_LINE (v_nou_client_nume);
       --pozitia 1 
      END;
    v_client_id := ( v_client_id * 12 ) / 10; 
    --pozitia 2 
    DBMS_OUTPUT.PUT_LINE('Pozitia 2');
    DBMS_OUTPUT.PUT_LINE (v_client_id);
    DBMS_OUTPUT.PUT_LINE (v_nou_client_nume);
    DBMS_OUTPUT.PUT_LINE (v_client_nume );
       --DBMS_OUTPUT.PUT_LINE (var );    
END;
/



valoarea variabilei v_client_id la pozi?ia 1; --300
- valoarea variabilei v_client_nume la pozi?ia 1; --n2
- valoarea variabilei v_nou_client_id la pozi?ia 1; --300
- valoarea variabilei v_nou_client_nume la pozi?ia 1;--n3
- valoarea variabilei v_id_client la pozi?ia 2; --1920
- valoarea variabilei v_client_nume la pozi?ia 2.--n2 n3

--3
VARIABLE g_mesaj VARCHAR2(50)
BEGIN
  :g_mesaj := 'Invat PL/SQL';
END;
/
PRINT g_mesaj

G_MESAJ
------------
Invat PL/SQL

print  v_client_id;
Bind Variable "V_CLIENT_ID" is NOT DECLARED

BEGIN
  DBMS_OUTPUT.PUT_LINE('Invat PL/SQL');
END;
/


---exercitiul 1:
DECLARE
  numar  NUMBER(3)    :=100;
  mesaj1 VARCHAR2(255):='text 1';
  mesaj2 VARCHAR2(255):='text 2';
BEGIN
  DECLARE
    numar  NUMBER(3)    :=1;
    mesaj1 VARCHAR2(255):='text 2';
    mesaj2 VARCHAR2(255):='text 3';
  BEGIN
    numar :=numar+1;
    mesaj2:=mesaj2||' adaugat in sub-bloc';
    DBMS_OUTPUT.PUT_LINE(numar);
    DBMS_OUTPUT.PUT_LINE(mesaj1);
    DBMS_OUTPUT.PUT_LINE(mesaj2);
  END;
  numar :=numar+1;
  mesaj1:=mesaj1||' adaugat un blocul principal';
  mesaj2:=mesaj2||' adaugat in blocul principal';
   DBMS_OUTPUT.PUT_LINE(numar);
    DBMS_OUTPUT.PUT_LINE(mesaj1);
    DBMS_OUTPUT.PUT_LINE(mesaj2);
END;
/

a) Valoarea variabilei numar în subbloc este: --2
b) Valoarea variabilei mesaj1 în subbloc este: --text 2
c) Valoarea variabilei mesaj2 în subbloc este: -- text 3 adaugat in sub-bloc
d) Valoarea variabilei numar în bloc este: --101
e) Valoarea variabilei mesaj1 în bloc este: --text 1 adaugat un blocul principal
f) Valoarea variabilei mesaj2 în bloc este: --text 2 adaugat un blocul principal



--4
4. Defini?i un bloc anonim în care s? se afle numele departamentului
cu cei mai mul?i angaja?i. Comenta?i cazul în care exist? cel pu?in
dou? departamente cu num?r maxim de angaja?i.
DECLARE
  v_dep departments.department_name%TYPE;
BEGIN
  SELECT department_name
  INTO   v_dep
  FROM   employees e, departments d
  WHERE  e.department_id=d.department_id 
  GROUP BY department_name
  HAVING COUNT(*) = (SELECT max(COUNT(*))  --nr-ul maxim de ang dintr-un dep
                     FROM   employees
                     where department_id is not null
                     GROUP BY department_id);
  DBMS_OUTPUT.PUT_LINE('Departamentul '|| v_dep|| ' are numar maxima de angajati.');
END;
/
SELECT department_id, COUNT(*)
FROM   employees
where department_id is not null
GROUP BY department_id;
100	6
30	6
90	3
20	2
70	1
110	2
50	45
80	34
40	1
60	5
10	1

SELECT max(COUNT(*))
FROM   employees
where department_id is not null
GROUP BY department_id; --45

  SELECT d.department_id, department_name, count(*)
  FROM   employees e, departments d
  WHERE  e.department_id=d.department_id 
  GROUP BY department_name, d.department_id
  HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM   employees
                     where department_id is not null
                     GROUP BY department_id);
--Shipping	45

--departamentele cu numar minim de angajati
  SELECT department_name, count(*)
  FROM   employees e, departments d
  WHERE  e.department_id=d.department_id 
  GROUP BY department_name
  HAVING COUNT(*) = (SELECT Min(COUNT(*))
                     FROM   employees
                     where department_id is not null
                     GROUP BY department_id);
                     
--Administration	1
--Human Resources	1
--Public Relations	1
/

DECLARE
  v_dep departments.department_name%TYPE;
BEGIN
  SELECT department_name
  INTO   v_dep
  FROM   employees e, departments d
  WHERE  e.department_id=d.department_id 
  GROUP BY department_name
  HAVING COUNT(*) = (SELECT min(COUNT(*))
                     FROM   employees
                     where department_id is not null
                     GROUP BY department_id);
  DBMS_OUTPUT.PUT_LINE('Departamentul '|| v_dep|| ' are numar minim de angajati.');
  exception
    when too_many_rows then
      DBMS_OUTPUT.PUT_LINE ('Mai multe departamente cu numar minim de angajati.');
   --when no_data_found then... -> nu are sens in cazul de fata
END;
/
--5
--5. Rezolva?i problema anterioar? utilizând variabile de leg?tur?. 
--Afi?a?i rezultatul atât din bloc, cât ?i din exteriorul acestuia.

VARIABLE rezultat VARCHAR2(35)
BEGIN
  SELECT department_name
  INTO   :rezultat
FROM   employees e, departments d
  WHERE  e.department_id=d.department_id 
  GROUP BY department_name
  HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                     FROM   employees
                     where department_id is not null
                     GROUP BY department_id);
  DBMS_OUTPUT.PUT_LINE('Departamentul '|| :rezultat);
END;
/
PRINT rezultat

--6. Modifica?i exerci?iul anterior astfel încât sã ob?ine?i 
--?i numãrul de angaja?i din departamentul respectiv.

/
DECLARE
  v_dep departments.department_name%TYPE;
  v_nrang NUMBER(2);
BEGIN
  SELECT department_name, COUNT(*)
  INTO v_dep, v_nrang
  FROM employees e,
    departments d
  WHERE e.department_id=d.department_id
  GROUP BY department_name
  HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) FROM employees GROUP BY department_id
    );
  DBMS_OUTPUT.PUT_LINE('Departamentul '|| v_dep ||' care are nr angajati= '||v_nrang);
END;
/
--7
7. Determina?i salariul anual ?i bonusul pe care îl prime?te un salariat al 
c?rui cod este dat de la tastatur?. Bonusul este determinat astfel:
dac? salariul anual este cel pu?in 200001, atunci bonusul este 20000; 
dac? salariul anual este cel pu?in 100001 ?i cel mult 200000, atunci bonusul este 10000, 
iar dac? salariul anual este cel mult 100000, atunci bonusul este 5000. 
Afi?a?i bonusul ob?inut. Comenta?i cazul în care nu exist? niciun angajat 
cu codul introdus.

Obs. Se folose?te instruc?iunea IF.
IF condi?ie1 THEN
secven?a_de_comenzi_1
[ELSIF condi?ie2 THEN
secven?a_de_comenzi_2]
…
[ELSE
secven?a_de_comenzi_n]
END IF;


SET VERIFY OFF
DECLARE
   v_cod           employees.employee_id%TYPE:=&p_cod;
   v_bonus         NUMBER(8);
   v_salariu_anual NUMBER(8);
BEGIN
   SELECT salary*12 
   INTO   v_salariu_anual
   FROM   employees 
   WHERE  employee_id = v_cod;
   
   IF v_salariu_anual>=200001 
      THEN v_bonus:=20000;
      ELSIF v_salariu_anual BETWEEN 100001 AND 200000 
        THEN v_bonus:=10000;
        ELSE v_bonus:=5000;
   END IF;
   DBMS_OUTPUT.PUT_LINE('Bonusul este ' || v_bonus|| ' pentru ca angajatul ' || 
   v_cod || ' are salariul anul de ' || v_salariu_anual);
END;
/
SET VERIFY ON

-- tratam exceptia cand introducem un id de angajat care nu exista in firma

DECLARE
   v_cod           employees.employee_id%TYPE:=&p_cod;
   v_bonus         NUMBER(8);
   v_salariu_anual NUMBER(8);
BEGIN
   SELECT salary*12 
   INTO   v_salariu_anual
   FROM   employees 
   WHERE  employee_id = v_cod;
   IF v_salariu_anual>=200001 
      THEN v_bonus:=20000;
      ELSIF v_salariu_anual BETWEEN 100001 AND 200000 
        THEN v_bonus:=10000;
        ELSE v_bonus:=5000;
   END IF;
   DBMS_OUTPUT.PUT_LINE('Bonusul este ' || v_bonus|| ' pentru ca angajatul ' || 
   v_cod || ' are salariul anul de ' || v_salariu_anual);
   exception
      when no_data_found then 
      DBMS_OUTPUT.PUT_LINE('angajatul '|| v_cod || ' nu exista in firma');
      --when too_many_rows then... -- nu are sens pt ca id-ul este unic
END;
/


--in locul id-ului, se va da de la tastatura numele unui angajat 
--Tratati si toate exceptiile care pot aparea
select * from employees
where upper(last_name)= upper('king'); --grant


--OConnell
--Bonusul este 5000 pt ca angajatul Oconnell are salariul anual de 31200

--atentie la spatiile din nume
DECLARE
  v_nume employees.last_name%TYPE:='&p_nume';
  v_bonus         NUMBER(8);
  v_salariu_anual NUMBER(8);
BEGIN
  SELECT salary*12
  INTO v_salariu_anual
  FROM employees
  WHERE upper ( last_name ) = upper ( v_nume );
  IF v_salariu_anual       >=200001 THEN
    v_bonus                :=20000;
  ELSIF v_salariu_anual BETWEEN 100001 AND 200000 THEN
    v_bonus:=10000;
  ELSE
    v_bonus:=5000;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Bonusul este ' || v_bonus || ' pt ca angajatul '|| 
  initcap(v_nume) ||' are salariul anual de '|| v_salariu_anual);
  EXCEPTION
        WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Angajatul '|| initcap(v_nume)|| ' nu exista');
        when too_many_rows then
        DBMS_OUTPUT.PUT_LINE('Mai multi angajati cu acelasi nume: '||
            initcap(v_nume));
END;
/
set verify on
DECLARE
  v_nume employees.last_name%TYPE:='&p_nume';
  v_bonus         NUMBER(8);
  v_salariu_anual NUMBER(8);
BEGIN
  SELECT salary*12
  INTO v_salariu_anual
  FROM employees
  WHERE trim(upper ( last_name )) = trim(upper ( v_nume ));
  IF v_salariu_anual       >=200001 THEN
    v_bonus                :=20000;
  ELSIF v_salariu_anual BETWEEN 100001 AND 200000 THEN
    v_bonus:=10000;
  ELSE
    v_bonus:=5000;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Bonusul este ' || v_bonus || ' pt ca angajatul '|| 
  initcap(v_nume) ||' are salariul anual de '|| v_salariu_anual);
  EXCEPTION
        WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Angajatul '|| initcap(v_nume)|| ' nu exista');
        when too_many_rows then
        DBMS_OUTPUT.PUT_LINE('Mai multi angajati cu acelasi nume: '||
            initcap(v_nume));
END;   
/
--8
--Rezolva?i problema anterioar? folosind instruc?iunea CASE.
set verify off
DECLARE
   v_cod           employees.employee_id%TYPE:=&p_cod;
   v_bonus         NUMBER(8);
   v_salariu_anual NUMBER(8);
BEGIN
   SELECT salary*12 
   INTO v_salariu_anual
   FROM   employees 
   WHERE  employee_id = v_cod;
   CASE WHEN v_salariu_anual>=200001 
             THEN v_bonus:=20000;
        WHEN v_salariu_anual BETWEEN 100001 AND 200000 
             THEN v_bonus:=10000;
        --ELSE v_bonus:=5000; --ORA-06592: CASE not found while executing CASE statement
   END CASE;
   DBMS_OUTPUT.PUT_LINE('Bonusul este ' || v_bonus);
   exception
         when case_not_found then 
         DBMS_OUTPUT.PUT_LINE('Nu are bonus');
END;
/
--107
--Nu are bonus

--9
--9. Scrie?i un bloc PL/SQL în care stoca?i prin variabile
--de substitu?ie un cod de angajat, un cod de departament 
--?i procentul cu care se m?re?te salariul acestuia. 
--S? se mute salariatul în noul departament ?i s? i 
--se creasc? salariul în mod corespunz?tor.
--Dac? modificarea s-a putut realiza (exist? în tabelul emp_***
--un salariat având codul respectiv) s? se afi?eze mesajul
--“Actualizare realizata”, iar în caz contrar mesajul 
--“Nu exista un angajat cu acest cod”. Anula?i modific?rile realizate.

drop table emp_ong;
create table emp_ong 
as select * from employees;

select * from emp_ong
where employee_id = 200;

200	Jennifer	Whalen	JWHALEN 4400-salariul 10 -dept_id
--dupa rulare
200	Jennifer	Whalen	JWHALEN 5280-salariul 80 -dept_id
rollback;
set verify on
DEFINE p_cod_sal= 1
DEFINE p_cod_dept = 80
DEFINE p_procent =20
DECLARE
  v_cod_sal   emp_ong.employee_id%TYPE:= &p_cod_sal;
  v_cod_dept  emp_ong.department_id%TYPE:= &p_cod_dept;
  v_procent   NUMBER(8):=&p_procent;
BEGIN
  UPDATE emp_ong
  SET department_id = v_cod_dept, 
      salary=salary + (salary* v_procent/100)
  WHERE employee_id= v_cod_sal;
  IF SQL%ROWCOUNT =0 THEN 
     DBMS_OUTPUT.PUT_LINE('Nu exista un angajat cu acest cod');
  ELSE 
     DBMS_OUTPUT.PUT_LINE('Actualizare realizata');
  END IF;
END;
/
unDEFINE p_cod_sal
unDEFINE p_cod_dept 
unDEFINE p_procent
ROLLBACK;

--10
10. Crea?i tabelul zile_***(id, data, nume_zi). 
Introduce?i în tabelul zile_*** informa?iile corespunz?toare tuturor
zilelor care au r?mas din luna curent?.
LOOP
secven?a_de_comenzi
END LOOP;
Comanda se execut? cel pu?in o dat?.
Dac? nu este utilizat? comanda EXIT, ciclarea ar putea continua la infinit.

select last_day(sysdate)
from dual; --31-OCT-22

select last_day(sysdate) - sysdate
from dual; 

select sysdate+1
from dual;
select to_char(sysdate, 'Day')
from dual;

select to_char(sysdate, 'Day/MM/YYYY/year')
from dual;
drop table zile_ong;
create table zile_ong
 ( id number(3),
  data date,
  nume_zi varchar2(20) );

DECLARE
  contor  NUMBER(6) := 1;
  v_data  DATE;
  maxim   NUMBER(2) := LAST_DAY(SYSDATE)-SYSDATE;
BEGIN
  LOOP
    v_data := sysdate+contor;
    INSERT INTO zile_ong
    VALUES (contor,v_data,to_char(v_data,'Day'));
    contor := contor + 1;
    EXIT WHEN contor > maxim;
  END LOOP;
END;
/
select * from zile_ong;
--1	28-10-2021	Joi     
--2	29-10-2021	Vineri  
--3	30-10-2021	Sâmbata 
--4	31-10-2021	Duminica
--11
11. Rezolva?i cerin?a anterioar? folosind instruc?iunea WHILE.
WHILE condi?ie LOOP
secven?a_de_comenzi
END LOOP;
Dac? condi?ia este evaluat? ca fiind FALSE sau NULL, atunci secven?a
de comenzi nu este executat? ?i controlul trece la instruc?iunea 
imediat urm?toare dup? END LOOP.

DECLARE
  contor  NUMBER(6) := 1;
  v_data  DATE;
  maxim   NUMBER(2) := LAST_DAY(SYSDATE)-SYSDATE;
BEGIN
  WHILE contor <= maxim LOOP
    v_data := sysdate+contor;
    INSERT INTO zile_ong
    VALUES (contor,v_data,to_char(v_data,'Day'));
    contor := contor + 1;
  END LOOP;
END;
/

--12
FOR contor_ciclu IN [REVERSE] lim_inf..lim_sup LOOP
secven?a_de_comenzi;
END LOOP;
Variabila contor_ciclu nu trebuie declarat?, ea fiind implicit de tip BINARY_INTEGER.
Aceasta este neidentificat? în afara ciclului.
Pasul are implicit valoarea 1 ?i nu poate fi modificat.
Limitele domeniului pot fi variabile sau expresii, dar care pot fi convertite la întreg.

DECLARE
  v_data  DATE;
  maxim   NUMBER(2) := LAST_DAY(SYSDATE)-SYSDATE;
BEGIN
  FOR contor IN 1..maxim LOOP
    v_data := sysdate+contor;
    INSERT INTO zile_ong
    VALUES (contor,v_data,to_char(v_data,'Day'));
    --contor:= contor+1; -- nu se poate
  END LOOP;
END;
/

select * from zile_ong;

--13
--Varianta 1
DECLARE
   i        POSITIVE:=1;
   max_loop CONSTANT POSITIVE:=10;
BEGIN
  LOOP
    i:=i+1;
    IF i>max_loop THEN
      DBMS_OUTPUT.PUT_LINE('in loop i=' || i);
      GOTO urmator;
    END IF;
  END LOOP;
  <<urmator>>
  i:=1;
  DBMS_OUTPUT.PUT_LINE('dupa loop i=' || i);
END;
/

--Varianta 2
DECLARE
  i        POSITIVE:=1;
  max_loop CONSTANT POSITIVE:=10;
BEGIN
  --i:=1;
  LOOP
    i:=i+1;
    DBMS_OUTPUT.PUT_LINE('in loop i=' || i);
    EXIT WHEN i>max_loop;
  END LOOP;
  i:=1;
  DBMS_OUTPUT.PUT_LINE('dupa loop i=' || i);
END;
/ 

3. Defini?i un bloc anonim în care sã se determine numãrul 
de filme (titluri) împrumutate de un membru al cãrui nume 
este introdus de la tastaturã. Trata?i urmãtoarele douã 
situa?ii: 
- nu existã nici un membru cu nume dat; 
- existã mai mul?i membrii cu acela?i nume.

select * from employees
where upper(last_name) = upper('&p_nume');



--ce filme(copii) a imprumutat un membru al carui nume este 
--dat de la tastatura

SELECT  r.title_id, r.copy_id
  FROM member m
  JOIN rental r
  ON (m.member_id   =r.member_id)
  WHERE upper(last_name) = upper('&p_nume');
  --Ngao
92	2
98	2
93	2
95	3

--Velasquez
92	1
98	1
95	3
93	1
93	2

--ce filme(titluri) a imprumutat un membru al carui nume 
--este dat de la tastatura

SELECT  distinct r.title_id
  FROM member m
  JOIN rental r
  ON (m.member_id   =r.member_id)
  WHERE upper(last_name) = upper('&p_nume');
--Velasquez
95
93
92
98
--info din rental
SELECT  r.title_id, r.copy_id, m.member_id
  FROM member m
  JOIN rental r
  ON (m.member_id   =r.member_id)
  order by 3,1;

DECLARE
  v_nume member.last_name%TYPE:='&p_nume';
  v_id member.member_id%type;
  v_nrfilme NUMBER(8);
BEGIN

  SELECT COUNT(distinct r.title_id)
  INTO v_nrfilme
  FROM member m
  JOIN rental r
  ON (m.member_id   =r.member_id)
   WHERE upper(last_name) = upper(v_nume); 
  
  if v_nrfilme >0 then
  DBMS_OUTPUT.PUT_LINE('Nr de filme imprumutate de ' || initcap(v_nume)
                ||' este '||v_nrfilme);
    else 
    DBMS_OUTPUT.PUT_LINE('Nu a imprumutat titluri');
    end if;
    
  EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista membru cu numele '|| initcap(v_nume));
  WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('Mai multi membri cu acelasi nume: '||initcap(v_nume));
END;
/
  
--rezolvare:
DECLARE
  v_nume member.last_name%TYPE:='&p_nume';
  v_id member.member_id%type;
  v_nrfilme NUMBER(8);
BEGIN
  SELECT member_id 
  into v_id
  FROM member 
  WHERE upper(last_name) = upper(v_nume); -- de aici apar exceptiile
  
  SELECT COUNT(distinct r.title_id)
  INTO v_nrfilme
  FROM member m
  JOIN rental r
  ON (m.member_id   =r.member_id)
  WHERE m.member_id =v_id;
  if v_nrfilme >0 then
  DBMS_OUTPUT.PUT_LINE('Nr de filme imprumutate de ' || initcap(v_nume)
                ||' este '||v_nrfilme);
    else 
    DBMS_OUTPUT.PUT_LINE('Nu a imprumutat titluri');
    end if;
    
  EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista membru cu numele '|| initcap(v_nume));
  WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('Mai multi membri cu acelasi nume: '||initcap(v_nume));
END;
/








