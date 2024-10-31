create or replace trigger "PMS_TRG_COMMENTS"
before
insert or update or delete on "PMS_COMMENTS_TBL"
for each row
begin
    IF INSERTING THEN
        IF :NEW.COMMENT_ID IS NULL THEN
            :NEW.COMMENT_ID := PMS_SEQ_COMMENT.NEXTVAL;
        END IF;
    END IF;
END;
/