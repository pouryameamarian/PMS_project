
  CREATE TABLE "PMS_COMMENTS_TBL" 
   (	"COMMENT_ID" NUMBER, 
	"PROJECT_ID" NUMBER, 
	"TASK_ID" NUMBER, 
	"DEVELOPER_ID" NUMBER, 
	"COMMENT_TEXT" VARCHAR2(1000), 
	"COMMENT_DATE" DATE DEFAULT SYSDATE, 
	 PRIMARY KEY ("COMMENT_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "PMS_COMMENTS_TBL" ADD CONSTRAINT "SMP_COMMENTS_TBL_CON" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "PMS_PROJECTS_TBL" ("PROJECT_ID") ENABLE;
  ALTER TABLE "PMS_COMMENTS_TBL" ADD CONSTRAINT "SMP_COMMENTS_TBL_CON_F" FOREIGN KEY ("TASK_ID")
	  REFERENCES "PMS_TASK_TBL" ("TASK_ID") ENABLE;
  ALTER TABLE "PMS_COMMENTS_TBL" ADD CONSTRAINT "SMP_COMMENTS_TBL_CON_F_K" FOREIGN KEY ("DEVELOPER_ID")
	  REFERENCES "PMS_DEVELOPERS_TBL" ("DEVELOPER_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "PMS_TRG_COMMENTS" 
before
insert or update or delete on "PMS_COMMENTS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.COMMENT_ID IS NULL THEN
            :NEW.COMMENT_ID := PMS_SEQ_COMMENT.NEXTVAL;
        END IF;
    END IF;
END;
/
ALTER TRIGGER "PMS_TRG_COMMENTS" ENABLE;