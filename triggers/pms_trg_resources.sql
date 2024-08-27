create or replace trigger PMS_TRG_RESOURCES
before
insert or update or delete on PMS_RESOURCES_TBL
for each row
begin
    IF INSERTING THEN
        IF :NEW.RESOURCE_ID IS NULL THEN
            :NEW.RESOURCE_ID := PMS_SEQ_RESOURCES.NEXTVAL;
        END IF;
    END IF;
END;
/