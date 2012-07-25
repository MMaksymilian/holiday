--------------------------------------------------------
--  File created - wtorek-lipiec-24-2012   
--------------------------------------------------------
REM INSERTING into HOLIDAY.SERVICE_USER
SET DEFINE OFF;
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME) values ('1','kowalski','kowalski','USER','Jurek','Kowalski');
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME) values ('2','szef','szef','CHIEF','Wojciech','Nowak');
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME) values ('3','gmoch','bednarska','USER','Zuzia','Gmoch');

REM INSERTING into HOLIDAY.HOLIDAY
SET DEFINE OFF;
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('3','2',to_date('12/07/25','RR/MM/DD'),to_date('13/04/24','RR/MM/DD'),'Podró¿ dooko³a œwiata','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('1','1',to_date('12/08/06','RR/MM/DD'),to_date('12/08/24','RR/MM/DD'),'Urlop z rodzin¹','APPLIED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('2','3',to_date('12/09/02','RR/MM/DD'),to_date('12/09/10','RR/MM/DD'),'Wyjazd do senatorium','APPROVED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('4','3',to_date('12/08/24','RR/MM/DD'),to_date('12/08/29','RR/MM/DD'),'Wyjaz z rodzin¹','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('5','2',to_date('12/07/24','RR/MM/DD'),to_date('12/07/24','RR/MM/DD'),'Wycieczka rowerowa','APPROVED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('6','2',to_date('12/07/15','RR/MM/DD'),to_date('12/07/22','RR/MM/DD'),'Wyjazd na ryby','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('7','2',to_date('13/07/24','RR/MM/DD'),to_date('13/07/24','RR/MM/DD'),'Rocznica œlubu','APPROVED');

