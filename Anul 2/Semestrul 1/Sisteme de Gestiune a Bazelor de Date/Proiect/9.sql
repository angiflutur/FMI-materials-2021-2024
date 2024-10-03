--    9. Formulati in limbaj natural o problema pe care sa o rezolvati 
-- folosind un subprogram stocat  independent
-- de tip procedura care sa utilizeze intr-o singura comanda SQL 
-- 5 dintre tabelele definite. 
-- Tratati toate exceptiile care pot aparea, incluzând exceptiile 
-- NO_DATA_FOUND si TOO_MANY_ROWS. 
-- Apelati subprogramul astfel incât sa evidentiati toate cazurile tratate.


-- tabelele HOTELURI, CAMERE, REZERVARI, CLIENTI
-- FACILITATI

--Scrieti un program stocat independent care, pentru
--numele unui hotel dat de la tastatura,
--sa se afiseze informatii despre rezervari: camera (facilitati),
--client, data check-in si check-out.
select * from hoteluri;
insert into hoteluri(id_hotel, nume) values(11, 'Hotel Dunarea');
CREATE OR REPLACE PROCEDURE exercitul_9 (hotel_nume IN VARCHAR2) IS
   v_hotel_id hoteluri.id_hotel%TYPE;
BEGIN
   -- cautam id-ul hotelului in functie de numele dat de la tastatura
   SELECT id_hotel INTO v_hotel_id
   FROM hoteluri
   WHERE nume = hotel_nume;

   -- obtinem informatiile despre rezervare
   FOR rec_camera IN (SELECT h.nume AS nume_hotel, c.nr_camera, 
          (CASE WHEN COUNT(distinct fc.tip_facilitate) > 0 THEN LISTAGG(distinct fc.tip_facilitate, ', ') 
                                                  WITHIN GROUP (ORDER BY fc.tip_facilitate)
            ELSE 'Nu exista facilitati' END) AS facilitati,
          cl.nume as client,
          r.data_check_in as check_in,
          r.data_check_out as check_out
    FROM camere c
        JOIN hoteluri h ON c.id_hotel = h.id_hotel
        LEFT JOIN facilitati_camera fc ON c.id_camera = fc.id_camera
        LEFT JOIN rezervari r on c.id_camera = r.id_camera
        LEFT JOIN clienti cl on cl.id_client = r.id_client
    WHERE h.nume = hotel_nume
    AND r.id_camera IS NOT NULL 
    GROUP BY h.nume, c.nr_camera, cl.nume, r.data_check_in, r.data_check_out
    )
   LOOP
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Hotel: ' || rec_camera.nume_hotel);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Nr. camera: ' || rec_camera.nr_camera);
        DBMS_OUTPUT.PUT_LINE('Facilitati: ' || rec_camera.facilitati);
        DBMS_OUTPUT.PUT_LINE('Client: ' || rec_camera.client);
        DBMS_OUTPUT.PUT_LINE('Check-in: ' || rec_camera.check_in);
        DBMS_OUTPUT.PUT_LINE('Check-out: ' || rec_camera.check_out);
   END LOOP;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Hotelul "' || hotel_nume || '" nu a fost gasit.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exista mai multe hoteluri cu numele dat.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('A aparut o eroare: ' || SQLERRM);
END;
/
BEGIN
   exercitul_9('Hotel Splendid');
END;
/
BEGIN
   exercitul_9('Hotel Dunarea');
END;
/