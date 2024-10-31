create or replace trigger "PMS_TRG_DEVELOPERS"
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