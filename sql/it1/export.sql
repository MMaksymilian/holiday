--------------------------------------------------------
--  File created - pi¹tek-sierpieñ-10-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence HOLIDAY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOLIDAY"."HOLIDAY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SERVICE_USER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HOLIDAY"."SERVICE_USER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 74 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table HOLIDAY
--------------------------------------------------------

  CREATE TABLE "HOLIDAY"."HOLIDAY" 
   (	"ID" NUMBER(20,0), 
	"SERVICE_USER_ID" NUMBER(20,0), 
	"DATE_FROM" DATE, 
	"DATE_TO" DATE, 
	"CAUSE" VARCHAR2(1000), 
	"STATUS" VARCHAR2(15)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVICE_USER
--------------------------------------------------------

  CREATE TABLE "HOLIDAY"."SERVICE_USER" 
   (	"ID" NUMBER(20,0), 
	"LOGIN" VARCHAR2(50), 
	"PASSWORD" VARCHAR2(100), 
	"ROLE" VARCHAR2(15), 
	"FIRST_NAME" VARCHAR2(50), 
	"LAST_NAME" VARCHAR2(50), 
	"EMAIL" VARCHAR2(50)
   ) ;
   
   --------------------------------------------------------
--  DDL for Index SERVICE_USER_UK_LOGIN
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOLIDAY"."SERVICE_USER_UK_LOGIN" ON "HOLIDAY"."SERVICE_USER" ("LOGIN") 
  ;
--------------------------------------------------------
--  DDL for Index SERVICE_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOLIDAY"."SERVICE_USER_PK" ON "HOLIDAY"."SERVICE_USER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index HOLIDAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOLIDAY"."HOLIDAY_PK" ON "HOLIDAY"."HOLIDAY" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table SERVICE_USER
--------------------------------------------------------

  ALTER TABLE "HOLIDAY"."SERVICE_USER" ADD CONSTRAINT "SERVICE_USER_UK_LOGIN" UNIQUE ("LOGIN") ENABLE;
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."SERVICE_USER" ADD CONSTRAINT "SERVICE_USER_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "HOLIDAY"."SERVICE_USER" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("CAUSE" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("DATE_TO" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("DATE_FROM" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("SERVICE_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "HOLIDAY"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "HOLIDAY"."HOLIDAY" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "HOLIDAY"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_SERVICE_USER_FK1" FOREIGN KEY ("SERVICE_USER_ID")
	  REFERENCES "HOLIDAY"."SERVICE_USER" ("ID") ENABLE;

