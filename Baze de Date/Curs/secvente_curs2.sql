select * from dual;
select length(sys_guid()) from dual; 



create table tuple(
    code    number(4)  primary key,  
    value   varchar2(10),
    guid    varchar2(32)  default sys_guid()
);

create sequence seq_tuple
start with 10;

insert into tuple ( code, value )       
            values( seq_tuple.nextval, 'abc' );
            
insert into tuple ( code, value, guid )       
            values( seq_tuple.nextval, 'xyz', '75e95a' );      
            
select * from tuple;            