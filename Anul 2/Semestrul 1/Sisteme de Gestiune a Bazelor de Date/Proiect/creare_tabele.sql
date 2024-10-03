CREATE TABLE orase (
    id_oras NUMBER PRIMARY KEY,
    nume          VARCHAR2(200),
    judet         VARCHAR2(200),
    regiune       VARCHAR2(200)
);

CREATE TABLE hoteluri (
    id_hotel      NUMBER PRIMARY KEY,
    id_oras NUMBER,
    adresa        VARCHAR2(200),
    nume          VARCHAR2(200),
    nr_telefon    VARCHAR2(11),
    email         VARCHAR2(200),
    FOREIGN KEY ( id_oras )
        REFERENCES orase ( id_oras )
            ON DELETE SET NULL
);

CREATE TABLE camere (
    id_camera       NUMBER PRIMARY KEY,
    id_hotel        NUMBER,
    pret            DECIMAL(10, 2),
    nr_locuri       NUMBER,
    etaj            NUMBER,
    nr_camera       NUMBER,
    FOREIGN KEY ( id_hotel )
        REFERENCES hoteluri ( id_hotel )
            ON DELETE SET NULL
);

CREATE TABLE angajati (
    id_angajat   NUMBER PRIMARY KEY,
    id_hotel     NUMBER,
    nume         VARCHAR2(200),
    email        VARCHAR2(200),
    nr_telefon   VARCHAR2(200),
    tip_angajat  VARCHAR2(200) CHECK (tip_angajat IN ('manager', 'receptioner')),
    data_angajare DATE,
    salariu NUMBER,
    FOREIGN KEY (id_hotel) REFERENCES hoteluri (id_hotel) ON DELETE SET NULL
);
drop table angajati;
CREATE TABLE clienti (
    id_client    NUMBER PRIMARY KEY,
    nume         VARCHAR2(200),
    email        VARCHAR2(200),
    nr_telefon   VARCHAR2(200),
    data_nastere DATE
);

CREATE TABLE rezervari (
    id_rezervare   NUMBER PRIMARY KEY,
    id_client      NUMBER,
    id_camera      NUMBER,
    data_check_in  DATE,
    data_check_out DATE,
    nr_persoane NUMBER,
    pret_total     DECIMAL(10, 2),
    FOREIGN KEY ( id_client )
        REFERENCES clienti ( id_client )
            ON DELETE SET NULL,
    FOREIGN KEY ( id_camera )
        REFERENCES camere ( id_camera )
            ON DELETE SET NULL
);

CREATE TABLE facilitati_camera (
    id_facilitate  NUMBER PRIMARY KEY,
    id_camera      NUMBER,
    tip_facilitate  VARCHAR2(200) CHECK (tip_facilitate IN ('uscator de par', 'fier de calcat', 'WI-FI', 'aer conditionat', 'TV')),
    pret_aditional DECIMAL(10, 2),
    FOREIGN KEY ( id_camera )
        REFERENCES camere ( id_camera )
            ON DELETE SET NULL
);

CREATE TABLE servicii_hotel (
    id_serviciu  NUMBER PRIMARY KEY,
    id_hotel     NUMBER,
    tip_serviciu  VARCHAR2(200) CHECK (tip_serviciu IN ('parcare', 'restaurant', 'room service', 'sala fitness', 'spa')),
    FOREIGN KEY ( id_hotel )
        REFERENCES hoteluri ( id_hotel )
            ON DELETE SET NULL
);

-- SECVENTE incrementare ID
CREATE SEQUENCE seq_angajati
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_camere
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_clienti
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_facilitati_camera
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_hoteluri
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_orase
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_rezervari
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_servicii_hotel
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;
/
drop table LOCALITATI;
drop table ORASE;
drop table REZERVARI;
drop table CAMERE;
drop table ANGAJATI;
drop table FACILITATI_CAMERA;
drop table HOTELURI;
drop table SERVICII_HOTEL;
drop table CLIENTI;
/
SELECT * FROM user_triggers;
SELECT * FROM user_tables order by table_name;
SELECT * FROM user_sequences order by sequence_name;
/
drop sequence SEQ_ANGAJATI;
drop sequence SEQ_CAMERE;
drop sequence SEQ_CLIENTI;
drop sequence SEQ_FACILITATI_CAMERA;
drop sequence SEQ_HOTELURI;
drop sequence SEQ_ORASE;
drop sequence SEQ_REZERVARI;
drop sequence SEQ_SERVICII_HOTEL;
/
/
select * from ANGAJATI;
select * from CAMERE;
select * from CLIENTI;
select * from FACILITATI_CAMERA;
select * from HOTELURI;
select * from ORASE;
select * from REZERVARI;
select * from SERVICII_HOTEL;
/