create or replace trigger "PMS_TRG_GENDER"
before
insert or update or delete on "PMS_GENDER_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.GENDER_ID IS NULL THEN
            :NEW.GENDER_ID := PMS_SEQ_GENDER.NEXTVAL;
        END IF;
    END IF;
END;
/