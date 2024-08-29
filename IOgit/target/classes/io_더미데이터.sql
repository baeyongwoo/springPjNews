---------------테이블 지우기------------------------------


-- 테이블 삭제
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE tboard CASCADE CONSTRAINTS;
DROP TABLE tfile CASCADE CONSTRAINTS;
DROP TABLE bdfile CASCADE CONSTRAINTS;
DROP TABLE cate CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

-- 시퀀스 삭제
DROP SEQUENCE tborad_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

---------------테이블 생성------------------------------
-- DEPT(COMPANY) TABLE
CREATE TABLE dept (
    did     VARCHAR2(30) NOT NULL,
    dname   VARCHAR2(20) NOT NULL,
    CONSTRAINT dept_pk PRIMARY KEY (did)
);

-- CATEGORY TABLE
CREATE TABLE cate (
    caid       VARCHAR2(20) NOT NULL,
    caregory   VARCHAR2(30) NOT NULL, -- 수정된 컬럼명
    CONSTRAINT cate_pk PRIMARY KEY (caid)
);

-- USER TABLE
CREATE TABLE userinfo (
    uemail   VARCHAR2(50) NOT NULL,
    upwd     VARCHAR2(30) NOT NULL,
    uname    VARCHAR2(20),
    did      VARCHAR2(30) NOT NULL,
    CONSTRAINT userinfo_pk PRIMARY KEY (uemail),
    CONSTRAINT userinfo_dept_fk FOREIGN KEY (did) REFERENCES dept(did)
);


-- BOARD TABLE
CREATE TABLE board (
    bno        NUMBER NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    bcontent   VARCHAR2(2000) NOT NULL,
    uemail     VARCHAR2(50) NOT NULL,
    regdate    DATE NOT NULL,
    caid       VARCHAR2(20) NOT NULL,
    CONSTRAINT board_pk PRIMARY KEY (bno),
    CONSTRAINT board_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail),
    CONSTRAINT board_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid)
);

-- TEMP BOARD TABLE
CREATE TABLE tboard (
    tno          NUMBER NOT NULL,
    tmptitle     VARCHAR2(100) NOT NULL,
    tmpcontent   VARCHAR2(2000) NOT NULL,
    tmpregdate   DATE NOT NULL,
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         NUMBER NOT NULL,
    CONSTRAINT tborad_pk PRIMARY KEY (tno),
    CONSTRAINT tborad_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail),
    CONSTRAINT tborad_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid)
);

-- REPLY TABLE
CREATE TABLE reply (
    rno     NUMBER NOT NULL,
    rname   VARCHAR2(20) NOT NULL,
    rpwd    VARCHAR2(30) NOT NULL,
    rcon    VARCHAR2(1000) NOT NULL,
    bno     NUMBER NOT NULL,
    CONSTRAINT reply_pk PRIMARY KEY (rno),
    CONSTRAINT reply_board_fk FOREIGN KEY (bno) REFERENCES board(bno)
);

CREATE TABLE tfile (
 tuuid VARCHAR2(100 BYTE) primary key  , 
    tno      NUMBER NOT NULL,
     CONSTRAINT tfile_tboard_fk FOREIGN KEY (tno) REFERENCES tboard(tno),
  tUPLOADPATH VARCHAR2(200 BYTE) NOT NULL , 
  tFILENAME VARCHAR2(200 BYTE) NOT NULL , 
  tFILETYPE CHAR(1 BYTE) DEFAULT 'I'
);

CREATE TABLE bdfile (
  buuid VARCHAR2(100 BYTE) primary key , 
    bno number not null,
    CONSTRAINT bdfile_board_fk FOREIGN KEY (bno) REFERENCES board(bno),
  
  bUPLOADPATH VARCHAR2(200 BYTE) NOT NULL , 
  bFILENAME VARCHAR2(200 BYTE) NOT NULL , 
  bFILETYPE CHAR(1 BYTE) DEFAULT 'I'
    
);
---------------시퀀스 생성------------------------------
CREATE SEQUENCE tborad_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE reply_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



---------------더미데이터------------------------------

-- DEPT 테이블에 데이터 추가
INSERT INTO dept (did, dname) VALUES ('D01', '방송국');
INSERT INTO dept (did, dname) VALUES ('D02', '신문');

-- CATEGORY 테이블에 데이터 추가
INSERT INTO cate (caid, caregory) VALUES ('C01', '해킹');
INSERT INTO cate (caid, caregory) VALUES ('C02', '인터넷');

-- USERINFO 테이블에 데이터 추가
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('user1@example.com', 'password1', '홍길동', 'D01');
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('user2@example.com', 'password2', '김철수', 'D02');

-- BOARD 테이블에 데이터 추가
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid) VALUES (board_seq.NEXTVAL, '첫 번째 게시글', '안녕하세요, 첫 번째 게시글입니다.', 'user1@example.com', SYSDATE, 'C01');
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid) VALUES (board_seq.NEXTVAL, '두 번째 게시글', '안녕하세요, 두 번째 게시글입니다.', 'user2@example.com', SYSDATE, 'C02');

-- TEMP BOARD 테이블에 데이터 추가
INSERT INTO tboard (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (tborad_seq.NEXTVAL, '임시 게시글 1', '임시 내용 1', SYSDATE, 'user1@example.com', 'C01', 101);
INSERT INTO tboard (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (tborad_seq.NEXTVAL, '임시 게시글 2', '임시 내용 2', SYSDATE, 'user2@example.com', 'C02', 102);
INSERT INTO tboard (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (tborad_seq.NEXTVAL, '임시 게시글 3', '임시 내용 3', SYSDATE, 'user2@example.com', 'C02', 101);

-- REPLY 테이블에 데이터 추가
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (reply_seq.NEXTVAL, '이름1', '비밀번호1', '댓글 내용 1', 1);
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (reply_seq.NEXTVAL, '이름2', '비밀번호2', '댓글 내용 2', 2);

---- TFILE 테이블에 데이터 추가
--INSERT INTO tfile (tuuid, tno, tUPLOADPATH, tFILENAME, tFILETYPE) VALUES ('fileuuid1', tborad_seq.CURRVAL, '/uploads/tmp1', 'tempfile1.txt', 'I');
--INSERT INTO tfile (tuuid, tno, tUPLOADPATH, tFILENAME, tFILETYPE) VALUES ('fileuuid2', tborad_seq.CURRVAL, '/uploads/tmp2', 'tempfile2.txt', 'I');
--
---- BDFILE 테이블에 데이터 추가
--INSERT INTO bdfile (buuid, bno, bUPLOADPATH, bFILENAME, bFILETYPE) VALUES ('fileuuid3', board_seq.CURRVAL, '/uploads/board1', 'boardfile1.txt', 'I');
--INSERT INTO bdfile (buuid, bno, bUPLOADPATH, bFILENAME, bFILETYPE) VALUES ('fileuuid4', board_seq.CURRVAL, '/uploads/board2', 'boardfile2.txt', 'I');

commit;

---------------더미데이터------------------------------
---- DEPT 테이블 조회
SELECT * FROM dept;
--
---- CATEGORY 테이블 조회
--SELECT * FROM cate;
--
---- USERINFO 테이블 조회
--SELECT * FROM userinfo;
--
---- BOARD 테이블 조회
--SELECT * FROM board;
--
---- TEMP BOARD 테이블 조회
--SELECT * FROM tboard;
--
---- REPLY 테이블 조회
--SELECT * FROM reply;
--
---- TFILE 테이블 조회
--SELECT * FROM tfile;
--
---- BDFILE 테이블 조회
--SELECT * FROM bdfile;
--


