create or replace trigger "PMS_TRG_PROJECTS"
before
insert or update or delete on "PMS_PROJECTS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.PROJECT_ID IS NULL THEN
            :NEW.PROJECT_ID := PMS_SEQ_PROJECTS.NEXTVAL;
        END IF;
    END IF;
END;
/