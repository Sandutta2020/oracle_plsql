--creating tablespace:
---------------------------------------------------------
create tablespace user_tablespace  
    datafile 'c:\app\*******\oracle_64\oradata\orcl\user_tablespace.dbf' 
	size 500m
    autoextend on;
--creating oracle schema user:
---------------------------------------------------------
create user dev_edw identified by santanu123
    default tablespace user_tablespace 
    quota 10m on user_tablespace 
    temporary tablespace temp
    quota 5m on system 
    profile app_user 
    password expire;
--Creating role
---------------------------------------------------------
Create role dev_role;

--Granting Priviledges to role
---------------------------------------------------------
grant create session to dev_role;
grant connect to dev_role;
grant create table to dev_role;
grant create procedure to dev_role;
grant create trigger to  dev_role;
grant create synonym to dev_role;
grant create view to  dev_role;
grant create type to  dev_role;
grant create sequence to  dev_role;
grant execute on dbms_job   to dev_role;
grant execute on dbms_utility   to dev_role;
--granting user:
---------------------------------------------------------
grant dev_role to dev_edw;
alter user dev_edw default tablespace user_tablespace;
alter user dev_edw quota unlimited  on   user_tablespace;