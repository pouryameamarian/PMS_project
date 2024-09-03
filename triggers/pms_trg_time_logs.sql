create or replace trigger "PMS_TRG_TIME_LOGS"
before
insert or update or delete on "PMS_TIME_LOGS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.LOG_ID IS NULL THEN
            :NEW.LOG_ID := PMS_SEQ_TIME_LOGS.NEXTVAL;
        END IF;
    END IF;
END;
/