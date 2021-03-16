--------------------------------------------------------
--  파일이 생성됨 - 화요일-3월-16-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CMM_CD
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."CMM_CD" 
   (	"CD_ID" VARCHAR2(50 CHAR), 
	"CD_NM" VARCHAR2(200 CHAR), 
	"PA_CD_ID" VARCHAR2(50 CHAR), 
	"USER_F" VARCHAR2(20 CHAR), 
	"CD_ORDER" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KIMI_WORK"."CMM_CD"."CD_ID" IS '공통코드';
   COMMENT ON COLUMN "KIMI_WORK"."CMM_CD"."CD_NM" IS '공통코드명';
   COMMENT ON COLUMN "KIMI_WORK"."CMM_CD"."PA_CD_ID" IS 'PA_CD_ID';
   COMMENT ON COLUMN "KIMI_WORK"."CMM_CD"."USER_F" IS '사용여부';
   COMMENT ON COLUMN "KIMI_WORK"."CMM_CD"."CD_ORDER" IS '순번';
   COMMENT ON TABLE "KIMI_WORK"."CMM_CD"  IS 'CMM_CD';
--------------------------------------------------------
--  DDL for Table DEPT_MGMT
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."DEPT_MGMT" 
   (	"DEPT_CODE" VARCHAR2(18 CHAR), 
	"DEPT_NM" VARCHAR2(255 BYTE), 
	"RGST_DAY" DATE, 
	"DEPT_LV" NUMBER, 
	"DEPT_PARENT" VARCHAR2(18 CHAR), 
	"DEPT_REMARKS" VARCHAR2(255 CHAR), 
	"DEPT_LOCATION" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_CODE" IS '부서코드 : 부서코드';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_NM" IS '부서명 : 부서명';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_LV" IS '상위부서, 하위부서 구분 : 상위부서, 하위부서 구분';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_PARENT" IS '상위부서 : 상위부서';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_REMARKS" IS '비고 : 비고';
   COMMENT ON COLUMN "KIMI_WORK"."DEPT_MGMT"."DEPT_LOCATION" IS '우선순위 : 우선순위';
   COMMENT ON TABLE "KIMI_WORK"."DEPT_MGMT"  IS 'DEPT_MGMT : 부서관리';
--------------------------------------------------------
--  DDL for Table EP_MGMT
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."EP_MGMT" 
   (	"EP_CODE" VARCHAR2(18 CHAR), 
	"EP_NM" VARCHAR2(30 BYTE), 
	"EP_MGMT_NM" VARCHAR2(14 BYTE), 
	"STATE" VARCHAR2(255 BYTE), 
	"RGST_DAY" DATE, 
	"MODI_DT" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."EP_CODE" IS '업체코드 : 업체코드';
   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."EP_NM" IS '업체명 : 업체명';
   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."EP_MGMT_NM" IS '업체담당자 : 업체담당자';
   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."STATE" IS '상태 : 상태';
   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."EP_MGMT"."MODI_DT" IS 'MODI_DT';
   COMMENT ON TABLE "KIMI_WORK"."EP_MGMT"  IS 'EP_MGMT : 업체관리';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."NOTICE" 
   (	"IDX" VARCHAR2(25 CHAR), 
	"USER_CODE" VARCHAR2(18 BYTE), 
	"SUBJECT" VARCHAR2(250 CHAR), 
	"CONTENT" CLOB, 
	"RGST_DAY" DATE, 
	"SEQ_NO" NUMBER, 
	"END_DAY" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."IDX" IS '공지사항 인덱스 번호 : 공지사항 인덱스 번호';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."USER_CODE" IS '사용자코드(등록자 : 사용자코드(등록자';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."SUBJECT" IS '제목 : 제목';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."CONTENT" IS '내용 : 내용';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."SEQ_NO" IS '번호 : 번호';
   COMMENT ON COLUMN "KIMI_WORK"."NOTICE"."END_DAY" IS '종료날짜 : 종료날짜';
   COMMENT ON TABLE "KIMI_WORK"."NOTICE"  IS 'NOTICE';
--------------------------------------------------------
--  DDL for Table PJT_MGMT
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."PJT_MGMT" 
   (	"PJT_CODE" VARCHAR2(18 CHAR), 
	"EP_CODE" VARCHAR2(18 CHAR), 
	"USER_CODE" VARCHAR2(18 CHAR), 
	"PJT_NM" VARCHAR2(30 BYTE), 
	"PJT_TERM_TO" CHAR(8 BYTE), 
	"PJT_TERM_FROM" CHAR(8 BYTE), 
	"RGST_DAY" DATE, 
	"PJT_PARTI" NUMBER, 
	"MODI_DT" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."PJT_CODE" IS '프로젝트코드 : 프로젝트코드';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."EP_CODE" IS '업체코드(업체명) : 업체코드(업체명)';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."USER_CODE" IS '사용자코드 : 사용자코드';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."PJT_NM" IS '프로젝트명 : 프로젝트명';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."PJT_TERM_TO" IS '프로젝트 기간 To : 프로젝트 기간 To';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."PJT_TERM_FROM" IS '프로젝트 기간 From : 프로젝트 기간 From';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."PJT_PARTI" IS '참여인원 : 참여인원';
   COMMENT ON COLUMN "KIMI_WORK"."PJT_MGMT"."MODI_DT" IS '수정일 : 수정일';
   COMMENT ON TABLE "KIMI_WORK"."PJT_MGMT"  IS 'PJT_MGMT : 프로젝트관리';
--------------------------------------------------------
--  DDL for Table USER_MGMT
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."USER_MGMT" 
   (	"USER_CODE" VARCHAR2(18 CHAR), 
	"DEPT_CODE" VARCHAR2(18 CHAR), 
	"USER_NM" VARCHAR2(20 BYTE), 
	"USER_ID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE), 
	"POSITION" VARCHAR2(6 BYTE), 
	"STATE" VARCHAR2(255 BYTE), 
	"RGST_DAY" DATE, 
	"MODI_DT" TIMESTAMP (6), 
	"USER_MAIL" VARCHAR2(50 CHAR), 
	"USER_PHONE" VARCHAR2(13 CHAR), 
	"USER_AUTH" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_CODE" IS '사용자코드 : 사용자코드';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."DEPT_CODE" IS '부서코드(부서명) : 부서코드(부서명)';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_NM" IS '사용자명 : 사용자명';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_ID" IS '사용자 아이디 : 사용자 아이디';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."PASSWORD" IS '비밀번호 : 비밀번호';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."POSITION" IS '직급 : 직급';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."STATE" IS '상태 : 상태';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."MODI_DT" IS '수정일 : 수정일';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_MAIL" IS '사용자 메일 : 사용자 메일';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_PHONE" IS '사용자 전화번호 : 사용자 전화번호';
   COMMENT ON COLUMN "KIMI_WORK"."USER_MGMT"."USER_AUTH" IS '사용자 권한 : 사용자 권한';
   COMMENT ON TABLE "KIMI_WORK"."USER_MGMT"  IS 'USER_MGMT : 사용자관리';
--------------------------------------------------------
--  DDL for Table WORK_MGMT
--------------------------------------------------------

  CREATE TABLE "KIMI_WORK"."WORK_MGMT" 
   (	"WEEK_CODE" VARCHAR2(12 CHAR), 
	"PJT_CODE" VARCHAR2(18 CHAR), 
	"USER_CODE" VARCHAR2(18 CHAR), 
	"DEPT_CODE" NVARCHAR2(18), 
	"EP_CODE" VARCHAR2(6 CHAR), 
	"EP_MGMT_NM" VARCHAR2(14 BYTE), 
	"WEEK_DAY" VARCHAR2(14 BYTE), 
	"CONTENT" CLOB, 
	"ISSUE" CLOB, 
	"RGST_DAY" DATE, 
	"MODF_DT" TIMESTAMP (6), 
	"SEQ_NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("ISSUE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."WEEK_CODE" IS '업무코드 : 업무코드';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."PJT_CODE" IS '프로젝트코드(프로젝트명) : 프로젝트코드(프로젝트명)';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."USER_CODE" IS '사용자코드(작성자) : 사용자코드(작성자)';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."DEPT_CODE" IS '소속부서코드 : 소속부서코드';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."EP_CODE" IS '업체코드 : 업체코드';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."EP_MGMT_NM" IS '업체담당자 : 업체담당자';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."WEEK_DAY" IS '날짜 : 날짜';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."CONTENT" IS '업무상세내용 : 업무상세내용';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."ISSUE" IS '이슈사항 : 이슈사항';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."RGST_DAY" IS '등록일 : 등록일';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."MODF_DT" IS '수정일 : 수정일';
   COMMENT ON COLUMN "KIMI_WORK"."WORK_MGMT"."SEQ_NO" IS 'SEQ_NO';
   COMMENT ON TABLE "KIMI_WORK"."WORK_MGMT"  IS 'WORK_MGMT : 금주업무';
--------------------------------------------------------
--  DDL for Index CMM_CD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."CMM_CD_PK" ON "KIMI_WORK"."CMM_CD" ("CD_ID", "PA_CD_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEPT_MGMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."DEPT_MGMT_PK" ON "KIMI_WORK"."DEPT_MGMT" ("DEPT_CODE", "DEPT_NM", "DEPT_LV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index EP_MGMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."EP_MGMT_PK" ON "KIMI_WORK"."EP_MGMT" ("EP_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NOTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."NOTICE_PK" ON "KIMI_WORK"."NOTICE" ("IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C00106457
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."SYS_C00106457" ON "KIMI_WORK"."PJT_MGMT" ("PJT_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index USER_MGMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."USER_MGMT_PK" ON "KIMI_WORK"."USER_MGMT" ("USER_CODE", "DEPT_CODE", "USER_ID", "PASSWORD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C00106464
--------------------------------------------------------

  CREATE UNIQUE INDEX "KIMI_WORK"."SYS_C00106464" ON "KIMI_WORK"."WORK_MGMT" ("WEEK_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CMM_CD
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."CMM_CD" ADD CONSTRAINT "CMM_CD_PK" PRIMARY KEY ("CD_ID", "PA_CD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."CMM_CD" MODIFY ("PA_CD_ID" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."CMM_CD" MODIFY ("CD_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPT_MGMT
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."DEPT_MGMT" ADD CONSTRAINT "DEPT_MGMT_PK" PRIMARY KEY ("DEPT_CODE", "DEPT_NM", "DEPT_LV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."DEPT_MGMT" MODIFY ("DEPT_PARENT" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."DEPT_MGMT" MODIFY ("DEPT_LV" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."DEPT_MGMT" MODIFY ("DEPT_NM" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."DEPT_MGMT" MODIFY ("DEPT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EP_MGMT
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."EP_MGMT" ADD CONSTRAINT "EP_MGMT_PK" PRIMARY KEY ("EP_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."EP_MGMT" MODIFY ("EP_MGMT_NM" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."EP_MGMT" MODIFY ("EP_NM" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."EP_MGMT" MODIFY ("EP_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."NOTICE" ADD CONSTRAINT "NOTICE_PK" PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."NOTICE" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."NOTICE" MODIFY ("USER_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."NOTICE" MODIFY ("IDX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PJT_MGMT
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."PJT_MGMT" ADD CONSTRAINT "SYS_C00106457" PRIMARY KEY ("PJT_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("MODI_DT" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("PJT_TERM_FROM" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("PJT_TERM_TO" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("PJT_NM" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("USER_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("EP_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."PJT_MGMT" MODIFY ("PJT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_MGMT
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."USER_MGMT" ADD CONSTRAINT "USER_MGMT_PK" PRIMARY KEY ("USER_CODE", "DEPT_CODE", "USER_ID", "PASSWORD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."USER_MGMT" MODIFY ("USER_AUTH" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."USER_MGMT" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."USER_MGMT" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."USER_MGMT" MODIFY ("DEPT_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."USER_MGMT" MODIFY ("USER_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WORK_MGMT
--------------------------------------------------------

  ALTER TABLE "KIMI_WORK"."WORK_MGMT" ADD CONSTRAINT "SYS_C00106464" PRIMARY KEY ("WEEK_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KIMI_WORK"."WORK_MGMT" MODIFY ("USER_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."WORK_MGMT" MODIFY ("PJT_CODE" NOT NULL ENABLE);
  ALTER TABLE "KIMI_WORK"."WORK_MGMT" MODIFY ("WEEK_CODE" NOT NULL ENABLE);
