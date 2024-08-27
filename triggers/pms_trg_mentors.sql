create or replace trigger "PMS_TRG_MENTORS"
before
insert or update or delete on "PMS_MENTORS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.MENTOR_ID IS NULL THEN
            :NEW.MENTOR_ID := PMS_SEQ_MENTORS.NEXTVAL;
        END IF;
    END IF;
END;
/