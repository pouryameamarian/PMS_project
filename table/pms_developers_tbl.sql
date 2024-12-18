
  CREATE TABLE "PMS_DEVELOPERS_TBL" 
   (	"DEVELOPER_ID" NUMBER, 
	"USERNAME" VARCHAR2(50), 
	"PASSWORD" VARCHAR2(100), 
	"EMAIL" VARCHAR2(100), 
	"FIRST_NAME" VARCHAR2(50), 
	"LAST_NAME" VARCHAR2(50), 
	"ROLE_ID" NUMBER, 
	"GENDER_ID" NUMBER, 
	 PRIMARY KEY ("DEVELOPER_ID")
  USING INDEX  ENABLE, 
	 UNIQUE ("USERNAME")
  USING INDEX  ENABLE, 
	 UNIQUE ("EMAIL")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "PMS_DEVELOPERS_TBL" ADD CONSTRAINT "PMS_DEVELOPERS_TBL_CON" FOREIGN KEY ("GENDER_ID")
	  REFERENCES "PMS_GENDER_TBL" ("GENDER_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PMS_TRG_DEVELOPERS" 
before
insert or update or delete on "PMS_DEVELOPERS_TBL"
for each row
begin
        IF INSERTING THEN
        IF :NEW.DEVELOPER_ID IS NULL THEN
            :NEW.DEVELOPER_ID := PMS_SEQ_DEVELOPER.NEXTVAL;
        END IF;
    END IF;
end;
/
ALTER TRIGGER "PMS_TRG_DEVELOPERS" ENABLE;