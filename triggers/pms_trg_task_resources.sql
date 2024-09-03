create or replace trigger "PMS_TRG_TASK_RESOURCES"
before
insert or update or delete on "PMS_TASK_RESOURCES_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.TASK_ID IS NULL THEN
            :NEW.TASK_ID := PMS_SEQ_TSK_RESOURCES.NEXTVAL;
        END IF;
    END IF;
END;
/