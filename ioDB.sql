/* 0827 io db 계정생성
주의: 시작시 로컬디스크 c에 io파일 생성해야함 */
-- 데이터베이스 생성
create tablespace io datafile
'C:\io\io.dbf' size 100M
autoextend on next 5M;
-- User 생성
create user io_user identified by io1234
default tablespace io
temporary tablespace temp;
-- 권한설정
grant dba to io_user;


/* 테이블 생성 */
-- USER TABLE
CREATE TABLE userinfo (
    uemail   VARCHAR2(50) NOT NULL,
    upwd     VARCHAR2(30) NOT NULL,
    uname    VARCHAR2(20),
    did      VARCHAR2(30) NOT NULL
);
-- DEPT(COMPANY) TABLE
CREATE TABLE dept (
    did     VARCHAR2(30) NOT NULL,
    dname   VARCHAR2(20) NOT NULL
);
-- TEMP BOARD TABlE
CREATE TABLE tborad (
    tno          NUMBER NOT NULL,
    tmptitle     VARCHAR2(100) NOT NULL,
    tmpcontent   VARCHAR2(2000) NOT NULL,
    tmpregdate   DATE NOT NULL,
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         NUMBER NOT NULL
);
-- TEMP FILE TABLE
CREATE TABLE tfile (
    tno      NUMBER NOT NULL,
    tfname   VARCHAR2(20) NOT NULL
);
-- BOARD TABLE
CREATE TABLE board (
    bno        NUMBER NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    bcontent   VARCHAR2(2000) NOT NULL,
    uemail     VARCHAR2(50) NOT NULL,
    regdate    DATE NOT NULL,
    caid       VARCHAR2(20) NOT NULL
);
-- BOARD FILE TABLE
CREATE TABLE bdfile (
    bno      NUMBER NOT NULL,
    bfname   VARCHAR2(20) NOT NULL
);
-- CATEGORY TABLE
CREATE TABLE cate (
    caid       VARCHAR2(20) NOT NULL,
    caregory   VARCHAR2(30) NOT NULL
);
-- REPLY TABLE
CREATE TABLE reply (
    rno     NUMBER NOT NULL,
    rname   VARCHAR2(20) NOT NULL,
    rpwd    VARCHAR2(30) NOT NULL,
    rcon    VARCHAR2(1000) NOT NULL,
    bno     NUMBER NOT NULL
);


/* primary key */
-- USER TABLE
ALTER TABLE userinfo ADD CONSTRAINT userinfo_pk PRIMARY KEY ( uemail );
-- DEPT(COMPANY) TABLE
ALTER TABLE dept ADD CONSTRAINT dept_pk PRIMARY KEY ( did );
-- TEMP BOARD TABlE
ALTER TABLE tborad ADD CONSTRAINT tborad_pk PRIMARY KEY ( tno );
-- TEMP FILE TABLE
ALTER TABLE tfile ADD CONSTRAINT tfile_pk PRIMARY KEY ( tno );
-- BOARD TABLE
ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( bno );
-- BOARD FILE TABLE
ALTER TABLE bdfile ADD CONSTRAINT bdfile_pk PRIMARY KEY ( bno );
-- CATEGORY TABLE
ALTER TABLE cate ADD CONSTRAINT cate_pk PRIMARY KEY ( caid );
-- REPLY TABLE
ALTER TABLE reply ADD CONSTRAINT reply_pk PRIMARY KEY ( rno );


/* foreign key */
-- USER TABLE
ALTER TABLE userinfo ADD CONSTRAINT userinfo_dept_fk FOREIGN KEY ( did ) REFERENCES dept ( did );
-- TEMP BOARD TABlE
ALTER TABLE tborad ADD CONSTRAINT tborad_cate_fk FOREIGN KEY ( caid ) REFERENCES cate ( caid );
ALTER TABLE tborad ADD CONSTRAINT tborad_tfile_fk FOREIGN KEY ( tno ) REFERENCES tfile ( tno );
ALTER TABLE tborad ADD CONSTRAINT tborad_userinfo_fk FOREIGN KEY ( uemail ) REFERENCES userinfo ( uemail );
-- BOARD TABLE
ALTER TABLE board ADD CONSTRAINT board_bfile_fk FOREIGN KEY ( bno ) REFERENCES bdfile ( bno );
ALTER TABLE board ADD CONSTRAINT board_cate_fk FOREIGN KEY ( caid ) REFERENCES cate ( caid );
ALTER TABLE board ADD CONSTRAINT board_userinfo_fk FOREIGN KEY ( uemail ) REFERENCES userinfo ( uemail );
-- REPLY TABLE
ALTER TABLE reply ADD CONSTRAINT reply_board_fk FOREIGN KEY ( bno ) REFERENCES board ( bno );





