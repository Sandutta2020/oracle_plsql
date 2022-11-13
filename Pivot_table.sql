CREATE TABLE EMP_COUNT_MONTH_WISE
(
  G_MONTH_NAME VARCHAR2(15 BYTE),
  MALE NUMBER,
  FEMALE NUMBER
)
----------------------------------------------------------------
SET DEFINE OFF;
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('March', 418, 184);
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('February', 1019, 416);
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('January', 670, 246);
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('November', 1158, 375);
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('October', 551, 181);
Insert into EMP_COUNT_MONTH_WISE(G_MONTH_NAME, MALE, FEMALE)
Values('September', 1485, 466);
COMMIT;
----------------------------------------------------------------
--Step 1:
select * from
(select G_MONTH_NAME,
  MALE,
  FEMALE
from EMP_COUNT_MONTH_WISE
)
UNPIVOT (CNT FOR GENDER IN (MALE,FEMALE));
----------------------------------------------------------------
--Final Step:

select * from
(select G_MONTH_NAME,
  MALE,
  FEMALE
from EMP_COUNT_MONTH_WISE)
UNPIVOT (CNT FOR GENDER IN (MALE,FEMALE))
PIVOT (SUM(CNT) FOR (G_MONTH_NAME) IN('March' AS "MAR",'February' AS "FEB",'January' AS "JAN",'November' AS "NOV",'October' AS "OCT",'September' AS "SEP"));
----------------------------------------------------------------