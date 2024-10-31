create or replace trigger "PMS_TRG_DOCUMENTS"
before
insert or update or delete on "PMS_DOCUMENTS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.DOCUMENT_ID IS NULL THEN
            :NEW.DOCUMENT_ID := PMS_SEQ_DOCUMENT.NEXTVAL;
        END IF;
    END IF;
END;
/