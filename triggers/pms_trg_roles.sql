create or replace trigger "PMS_TRG_ROLES"
before
insert or update or delete on "PMS_ROLES_TBL"
for each row
begin
        IF INSERTING THEN
        IF :NEW.ROLE_ID IS NULL THEN
            :NEW.ROLE_ID := PMS_SEQ_ROLE.NEXTVAL;
        END IF;
    END IF;
end;
/