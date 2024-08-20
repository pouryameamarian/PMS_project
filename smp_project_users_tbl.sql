
  CREATE TABLE "SMP_PROJECT_USERS_TBL" 
   (	"PROJECT_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"ROLE" NUMBER, 
	 CONSTRAINT "SMP_PROJECT_USERS_TBL_CON" PRIMARY KEY ("PROJECT_ID", "USER_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "SMP_PROJECT_USERS_TBL" ADD CONSTRAINT "SMP_PROJECT_USERS_TBL_CON_F" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES "SMP_PROJECTS_TBL" ("PROJECT_ID") ENABLE;
  ALTER TABLE "SMP_PROJECT_USERS_TBL" ADD CONSTRAINT "SMP_PROJECT_USERS_TBL_CON_F_K" FOREIGN KEY ("USER_ID")
	  REFERENCES "SMP_USERS_TBL" ("USER_ID") ENABLE;