create table statements(
  account_id number(10) not null,
  st_time timestamp not null,
  type varchar2(30)
);


create table transactions(
  tx_time timestamp not null,
  tx_value number(10) not null,
  from_account number(10) not null,
  to_account  number(10) not null,
  observations varchar2(100)
)
PARTITION BY RANGE(tx_time)
(
  PARTITION p1 VALUES LESS THAN 
    (TIMESTAMP '2020-01-01 00:00:00'),
  PARTITION p2 VALUES LESS THAN 
    (TIMESTAMP '2021-01-01 00:00:00'),
  PARTITION p3 VALUES LESS THAN 
    (TIMESTAMP '2022-01-01 00:00:00')
);

insert into statements(account_id,  st_time, type)
values(1, to_date('01-02-2020','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(1, to_date('01-02-2021','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(1, to_date('01-04-2020','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(1, to_date('01-04-2021','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(2, to_date('01-02-2020','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(2, to_date('01-02-2021','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(2, to_date('01-04-2020','dd-mm-yyyy'), 'daily');

insert into statements(account_id,  st_time, type)
values(2, to_date('01-04-2021','dd-mm-yyyy'), 'daily');

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2020','dd-mm-yyyy'), 10, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2020','dd-mm-yyyy'), 70, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2020','dd-mm-yyyy'), 54, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2020','dd-mm-yyyy'), 73, 1, 2 );


insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2021','dd-mm-yyyy'), 67, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2021','dd-mm-yyyy'), 77, 1, 2 );


insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2021','dd-mm-yyyy'), 47, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2021','dd-mm-yyyy'), 31, 1, 2 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2020','dd-mm-yyyy'), 110, 2, 1 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2020','dd-mm-yyyy'), 701, 2, 1 );


insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2020','dd-mm-yyyy'), 524, 2, 1 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2020','dd-mm-yyyy'), 713, 2, 1 );


insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2021','dd-mm-yyyy'), 167, 2, 1 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-02-2021','dd-mm-yyyy'), 774, 2, 1 );


insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2021','dd-mm-yyyy'), 33, 2, 1 );

insert into transactions(tx_time,tx_value,from_account, to_account )
values( to_date('01-04-2021','dd-mm-yyyy'), 13, 2, 1 );


commit;

select * from transactions where tx_time = to_date('2021-04-01', 'yyyy-mm-dd') ;

select st.account_id, t.tx_time, t.tx_value  
from statements st , transactions t where (t.tx_time = st.st_time) 
and st.account_id = t.from_account
and st.type = 'daily';

SELECT * FROM table(DBMS_XPLAN.DISPLAY);

--drop table transactions;
--drop table statements;

create table tcode as select owner, name, text from all_source;
create table tproc as select owner, object_name from all_procedures where object_type = 'PROCEDURE';
create table tfunc as select owner, object_name from all_procedures where object_type = 'FUNCTION';

select
        tobj.object_name, tcode.text
from
        tcode,
        (select * from tproc union all select * from tfunc) tobj
where tcode.owner = 'BD2022'
and   tcode.name = tobj.object_name;


SELECT * FROM table(DBMS_XPLAN.DISPLAY);

--drop table tcode;
--drop table tproc;
--drop table tfunc;