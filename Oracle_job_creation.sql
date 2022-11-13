grant execute on dbms_job to dev_odw;
------------------------------------------------------------------
create table t_temp(ent_date date);
------------------------------------------------------------------
One time JOB:

DECLARE
vjobnumber BINARY_INTEGER;
BEGIN
  DBMS_job.submit(
   job => vjobnumber,
   next_date => sysdate+1/86400,
   INTERVAL => 'null',
   what => 'begin insert into t_temp select sysdate from dual;end;');
COMMIT;
END;
------------------------------------------------------------------
job runs at fixed time:

DECLARE
vjobnumber BINARY_INTEGER;
BEGIN
DBMS_job.submit(job => vjobnumber,
next_date => next_date => trunc(sysdate,'HH24') +(15*(floor(to_number(to_char(SYSDATE,'MI'))/15)+1)/1440),
INTERVAL => 'trunc(sysdate,''HH24'') +(15*(floor(to_number(to_char(SYSDATE,''MI''))/15)+1)/1440)',
what => 'begin insert into t_temp select sysdate from dual;end;');
COMMIT;
END;
------------------------------------------------------------------
Checking jobs:

SELECT *
FROM sys.user_jobs t
WHERE t.WHAT = 'begin insert into t_temp select sysdate from dual;end;';
------------------------------------------------------------------
Removing Jobs :

DECLARE
vjobnumber BINARY_INTEGER;
BEGIN
SELECT t.JOB
INTO vjobnumber
FROM sys.user_jobs t
WHERE t.WHAT = 'begin insert into t_temp select sysdate from dual;end;';
dbms_job.remove(vjobnumber);
COMMIT;
END;
------------------------------------------------------------------