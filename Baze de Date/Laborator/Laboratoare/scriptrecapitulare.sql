alter session set nls_language=American;

CREATE TABLE TURIST 
(
  ID_TURIST NUMBER(9, 0) NOT NULL 
, NUME VARCHAR2(25) 
, PRENUME VARCHAR2(20) 
, DATA_NASTERE DATE 
, CONSTRAINT TURIST_PK PRIMARY KEY 
  (
    ID_TURIST 
  ) 
);

CREATE TABLE AGENTIE 
(
  ID_AGENTIE NUMBER(9, 0) NOT NULL 
, DENUMIRE VARCHAR2(20) 
, ORAS VARCHAR2(20) 
, CONSTRAINT AGENTIE_PK PRIMARY KEY 
  (
    ID_AGENTIE 
  )
);


CREATE TABLE EXCURSIE
  (
    ID_EXCURSIE NUMBER(9,0) NOT NULL,
    DENUMIRE    VARCHAR2(30 BYTE),
    PRET        NUMBER(9, 2),
    DESTINATIE  VARCHAR2(20 BYTE),
    DURATA      NUMBER(9,0),
    COD_AGENTIE NUMBER(9,0),
    NR_LOCURI   NUMBER(9,0),
    CONSTRAINT EXCURSIE_PK PRIMARY KEY (ID_EXCURSIE) ,
    CONSTRAINT EXCURSIE_AGENTIE_FK1 FOREIGN KEY (COD_AGENTIE) REFERENCES AGENTIE(ID_AGENTIE)
 );

CREATE TABLE ACHIZITIONEAZA 
(
  COD_EXCURSIE NUMBER(9, 0) NOT NULL 
, COD_TURIST NUMBER(9, 0) NOT NULL 
, DATA_START DATE NOT NULL 
, DATA_END DATE 
, DATA_ACHIZITIE DATE 
, DISCOUNT NUMBER(9, 2) 
, CONSTRAINT ACHIZITIONEAZA_PK PRIMARY KEY 
  (
    COD_EXCURSIE 
  , COD_TURIST 
  , DATA_START 
  )
);

ALTER TABLE ACHIZITIONEAZA
ADD CONSTRAINT ACHIZITIONEAZA_EXCURSIE_FK1 FOREIGN KEY
(
  COD_EXCURSIE 
)
REFERENCES EXCURSIE
(
  ID_EXCURSIE 
)
;

ALTER TABLE ACHIZITIONEAZA
ADD CONSTRAINT ACHIZITIONEAZA_TURIST_FK1 FOREIGN KEY
(
  COD_TURIST 
)
REFERENCES TURIST
(
  ID_TURIST 
)
;

Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (5,'Dragomir','Alina',to_timestamp('02-DEC-84','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (6,'Popescu','Tudor',to_timestamp('03-SEP-54','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (7,'Sava','Teodora',null);
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (8,'Popa','Iulian',to_timestamp('02-OCT-65','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (1,'Stanescu','Bogdan',to_timestamp('30-JUN-75','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (2,'Marin','Mihai',to_timestamp('15-MAY-85','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (3,'Anton','Maria',to_timestamp('01-SEP-85','DD-MON-RR HH.MI.SSXFF AM'));
Insert into TURIST (ID_TURIST,NUME,PRENUME,DATA_NASTERE) values (4,'Stanciu','Adela',to_timestamp('15-FEB-60','DD-MON-RR HH.MI.SSXFF AM'));

Insert into AGENTIE (ID_AGENTIE,DENUMIRE,ORAS) values (10,'Smart Tour','Iasi');
Insert into AGENTIE (ID_AGENTIE,DENUMIRE,ORAS) values (20,'Perfect Tour','Bucuresti');
Insert into AGENTIE (ID_AGENTIE,DENUMIRE,ORAS) values (30,'Eximtour','Constanta');
Insert into AGENTIE (ID_AGENTIE,DENUMIRE,ORAS) values (40,'Europa Travel','Bucuresti');

Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (401,'Nisipurile de aur',500,'Bulgaria',21,40,500);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (20,'1 Mai Litoral',600,'Mamaia',7,20,10);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (101,'Orasul luminilor',1500,'Paris',3,10,5);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (102,'Misterul Piramidelor',1000,'Egipt',2,10,2);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (103,'Coasta de Azur',900,'Coasta de Azur',10,10,100);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (201,'Litoral',2500,'Mamaia',7,30,2);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (301,'Insulele Maldive',1400,'Insulele Maldive',5,30,3);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (302,'week-end 1 Mai',1900,'Valea Prahovei',5,30,150);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (104,'Circuit Franta',2100,'Paris',3,10,30);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (1,'Malta 2010',3000,'Malta',10,null,70);
Insert into EXCURSIE (ID_EXCURSIE,DENUMIRE,PRET,DESTINATIE,DURATA,COD_AGENTIE,NR_LOCURI) values (303,'Orasul luminilor',800,'Paris',10,30,450);

Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (1,6,to_timestamp('02-SEP-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('12-SEP-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-MAY-09','DD-MON-RR HH.MI.SSXFF AM'),0.2);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (102,7,to_timestamp('14-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (20,8,to_timestamp('28-APR-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('05-MAY-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('15-FEB-10','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (101,2,to_timestamp('03-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('02-JUN-10','DD-MON-RR HH.MI.SSXFF AM'),0.2);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (102,2,to_timestamp('14-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('16-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('15-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),0.3);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (101,3,to_timestamp('01-MAY-01','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('04-MAY-01','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-APR-01','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (104,4,to_timestamp('06-SEP-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-SEP-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('07-AUG-09','DD-MON-RR HH.MI.SSXFF AM'),0.1);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (201,1,to_timestamp('14-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('21-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('09-APR-09','DD-MON-RR HH.MI.SSXFF AM'),0.2);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (201,4,to_timestamp('14-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('21-AUG-11','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('01-APR-09','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (301,3,to_timestamp('10-SEP-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('15-SEP-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('11-AUG-09','DD-MON-RR HH.MI.SSXFF AM'),0.3);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (302,1,to_timestamp('01-MAY-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('06-MAY-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('01-APR-10','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (303,2,to_timestamp('15-JUN-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('25-JUN-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('20-MAY-10','DD-MON-RR HH.MI.SSXFF AM'),0.1);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (103,1,to_timestamp('20-JUL-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('25-JUL-09','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('15-JUN-09','DD-MON-RR HH.MI.SSXFF AM'),null);
Insert into ACHIZITIONEAZA (COD_EXCURSIE,COD_TURIST,DATA_START,DATA_END,DATA_ACHIZITIE,DISCOUNT) values (303,3,to_timestamp('14-AUG-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('24-AUG-10','DD-MON-RR HH.MI.SSXFF AM'),to_timestamp('15-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),0.1);

commit;