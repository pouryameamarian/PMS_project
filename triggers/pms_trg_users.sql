create or replace trigger "PMS_TRG_USERS"
before
insert or update or delete on "PMS_USERS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.USER_ID IS NULL THEN
            :NEW.USER_ID := PMS_SEQ_USERS.NEXTVAL;
        END IF;
    END IF;
END;
/