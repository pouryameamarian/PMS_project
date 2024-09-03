create or replace trigger "PMS_TRG_TASK"
before
insert or update or delete on "PMS_TASK_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.TASK_ID IS NULL THEN
            :NEW.TASK_ID := PMS_SEQ_TASK.NEXTVAL;
        END IF;
    END IF;
END;
/