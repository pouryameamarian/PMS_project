create or replace trigger "PMS_TRG_TASKMASTER"
before
insert or update or delete on "PMS_TASKMASTER_TBL"
for each row
begin
        IF INSERTING THEN
        IF :NEW.TASKMASTER_ID IS NULL THEN
            :NEW.TASKMASTER_ID := PMS_SEQ_TASKMASTER.NEXTVAL;
        END IF;
    END IF;
end;
/