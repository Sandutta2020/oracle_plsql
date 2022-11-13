------------------------------------------------------------------
alter table table_of_content add date_temp varchar2(30);
----------------------------------------------------------------
update table_of_content t
set
t.date_temp=to_char(t.date1,'yyyy-mm-dd HH24:MI:SS');
commit;
------------------------------------------------------------------
alter table table_of_content drop column date1;
-----------------------------------------------------------------
alter table table_of_content add date1 varchar2(30);
update table_of_content t
set
t.date1=t.date_temp;
commit;
------------------------------------------------------------------
alter table table_of_content drop column date_temp;
------------------------------------------------------------------