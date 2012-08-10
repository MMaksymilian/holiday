REM INSERTING into HOLIDAY.SERVICE_USER
SET DEFINE OFF;
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME,EMAIL) values ('1','kowalski','892ac0725ef3b9722b878231ccef0d3511bb9e9d','ROLE_USER','Maciek','Kowalski','maksymilian.malek@primaris.eu');
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME,EMAIL) values ('2','szef','2ce03212f4b4fa9351608cd11e0bba2335d3e382','ROLE_CHIEF','Wojciech','Nowak','maksymilian.malek@primaris.eu');
Insert into HOLIDAY.SERVICE_USER (ID,LOGIN,PASSWORD,ROLE,FIRST_NAME,LAST_NAME,EMAIL) values ('3','gmoch','0dbe9227b2599d549bcd94b825b7fb9749224aaa','ROLE_USER','Zuzia','Gmoch','maksymilian.malek@primaris.eu');

REM INSERTING into HOLIDAY.HOLIDAY
SET DEFINE OFF;
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('85','1',to_date('12/08/09','RR/MM/DD'),to_date('12/08/20','RR/MM/DD'),'Wyjazd z rodzin¹ na piknik.','APPROVED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('86','1',to_date('12/08/28','RR/MM/DD'),to_date('12/08/30','RR/MM/DD'),'Bez powodu','APPROVED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('87','1',to_date('12/08/22','RR/MM/DD'),to_date('12/08/23','RR/MM/DD'),'Miejsce na wpisanie powodu urlopu','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('88','1',to_date('12/08/24','RR/MM/DD'),to_date('12/08/25','RR/MM/DD'),'Miejsce na wpisanie powodu urlopu','APPROVED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('3','2',to_date('12/07/25','RR/MM/DD'),to_date('13/04/24','RR/MM/DD'),'Podró¿ dooko³a œwiata','APPLIED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('70','1',to_date('12/08/03','RR/MM/DD'),to_date('12/08/04','RR/MM/DD'),'Brak powodu.','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('2','3',to_date('12/09/02','RR/MM/DD'),to_date('12/09/10','RR/MM/DD'),'Wyjazd do senatorium','APPLIED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('4','3',to_date('12/08/24','RR/MM/DD'),to_date('12/08/29','RR/MM/DD'),'Wyjaz z rodzin¹','REJECTED');
Insert into HOLIDAY.HOLIDAY (ID,SERVICE_USER_ID,DATE_FROM,DATE_TO,CAUSE,STATUS) values ('5','2',to_date('12/07/24','RR/MM/DD'),to_date('12/07/24','RR/MM/DD'),'Wycieczka rowerowa','APPROVED');
