
  CREATE TABLE "PMS_STATUS_TBL" 
   (	"STATUS_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"STATUS_NAME" VARCHAR2(100 CHAR), 
	 CONSTRAINT "PMS_STATUS_TBL_PK" PRIMARY KEY ("STATUS_ID")
  USING INDEX  ENABLE
   ) ;