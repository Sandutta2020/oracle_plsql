create table T_LOG_HISTORY ( LOGID VARCHAR2(50),
MODULEID VARCHAR2(20),
OPRTYPE VARCHAR2(30),
LOGTIME DATE,
OPRTYME NUMBER,
STAFFID VARCHAR2(64),
STAFFNAME VARCHAR2(50),
OPERIP VARCHAR2(15),
LOGDESC VARCHAR2(300),
ISSUCCESS NUMBER(1) )
partition by range (LOGTIME)
(
partition JAN2012 values less than (TO_DATE(' 2012-01-02 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    tablespace USER_TABLESPACE ,
partition FEB2012 values less than (TO_DATE(' 2012-01-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
    tablespace USER_TABLESPACE ,
partition MAR2012 values less than (TO_DATE(' 2012-01-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
   tablespace USER_TABLESPACE ,
partition APR2012 values less than (TO_DATE(' 2012-01-05 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
   tablespace USER_TABLESPACE ,
partition REST values less than (MAXVALUE)
   tablespace USER_TABLESPACE
);
-- Add comments to the columns

comment on column T_LOG_HISTORY.LOGID is 'unique id for every log';
comment on column T_LOG_HISTORY.MODULEID is 'the log belong to which module say it data oriented or functional oriented';
comment on column T_LOG_HISTORY.OPRTYPE is 'Add,delete,or modify which type of operation';
comment on column T_LOG_HISTORY.LOGTIME is 'system time of a particular event';
comment on column T_LOG_HISTORY.OPRTYME is 'the number taken to do the event';
comment on column T_LOG_HISTORY.STAFFID is 'the id of the staff';
comment on column T_LOG_HISTORY.STAFFNAME is 'the name of the staff';
comment on column T_LOG_HISTORY.OPERIP is 'the ip of the client of the client machine';
comment on column T_LOG_HISTORY.LOGDESC is 'the total activity description';
comment on column T_LOG_HISTORY.ISSUCCESS is 'boolean shows true or false whether its success or not';