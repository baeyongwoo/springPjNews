---------------테이블 지우기------------------------------
-- 외래 키 제약조건 삭제
ALTER TABLE reply DROP CONSTRAINT reply_board_fk CASCADE CONSTRAINTS;
ALTER TABLE board DROP CONSTRAINT board_userinfo_fk CASCADE CONSTRAINTS;
ALTER TABLE board DROP CONSTRAINT board_cate_fk CASCADE CONSTRAINTS;
ALTER TABLE board DROP CONSTRAINT board_bfile_fk CASCADE CONSTRAINTS;
ALTER TABLE tborad DROP CONSTRAINT tborad_userinfo_fk CASCADE CONSTRAINTS;
ALTER TABLE tborad DROP CONSTRAINT tborad_tfile_fk CASCADE CONSTRAINTS;
ALTER TABLE tborad DROP CONSTRAINT tborad_cate_fk CASCADE CONSTRAINTS;
ALTER TABLE userinfo DROP CONSTRAINT userinfo_dept_fk CASCADE CONSTRAINTS;

-- 테이블 삭제
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE tborad CASCADE CONSTRAINTS;
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

-- TEMP FILE TABLE
CREATE TABLE tfile (
    tno      NUMBER NOT NULL,
    tfname   VARCHAR2(20) NOT NULL,
    CONSTRAINT tfile_pk PRIMARY KEY (tno)
);

-- BOARD FILE TABLE
CREATE TABLE bdfile (
    bno      NUMBER NOT NULL,
    bfname   VARCHAR2(20) NOT NULL,
    CONSTRAINT bdfile_pk PRIMARY KEY (bno)
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
    CONSTRAINT board_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid),
    CONSTRAINT board_bfile_fk FOREIGN KEY (bno) REFERENCES bdfile(bno)
);

-- TEMP BOARD TABLE
CREATE TABLE tborad (
    tno          NUMBER NOT NULL,
    tmptitle     VARCHAR2(100) NOT NULL,
    tmpcontent   VARCHAR2(2000) NOT NULL,
    tmpregdate   DATE NOT NULL,
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         NUMBER NOT NULL,
    CONSTRAINT tborad_pk PRIMARY KEY (tno),
    CONSTRAINT tborad_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail),
    CONSTRAINT tborad_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid),
    CONSTRAINT tborad_tfile_fk FOREIGN KEY (tno) REFERENCES tfile(tno)
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

---------------예시 더미 데이터------------------------------
-- 테이블 삭제
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE tborad CASCADE CONSTRAINTS;
DROP TABLE tfile CASCADE CONSTRAINTS;
DROP TABLE bdfile CASCADE CONSTRAINTS;
DROP TABLE cate CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;

-- 시퀀스 삭제
DROP SEQUENCE tborad_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

-- 테이블 생성
-- 테이블 생성
CREATE TABLE dept (
    did     VARCHAR2(30) NOT NULL,
    dname   VARCHAR2(20) NOT NULL,
    CONSTRAINT dept_pk PRIMARY KEY (did)
);

CREATE TABLE cate (
    caid       VARCHAR2(20) NOT NULL,
    caregory   VARCHAR2(30) NOT NULL,
    CONSTRAINT cate_pk PRIMARY KEY (caid)
);

CREATE TABLE userinfo (
    uemail   VARCHAR2(50) NOT NULL,
    upwd     VARCHAR2(30) NOT NULL,
    uname    VARCHAR2(20),
    did      VARCHAR2(30) NOT NULL,
    CONSTRAINT userinfo_pk PRIMARY KEY (uemail),
    CONSTRAINT userinfo_dept_fk FOREIGN KEY (did) REFERENCES dept(did)
);

CREATE TABLE tfile (
    tno      NUMBER NOT NULL,
    tfname   VARCHAR2(20) NOT NULL,
    CONSTRAINT tfile_pk PRIMARY KEY (tno)
);

CREATE TABLE bdfile (
    bno      NUMBER NOT NULL,
    bfname   VARCHAR2(20) NOT NULL,
    CONSTRAINT bdfile_pk PRIMARY KEY (bno)
);

CREATE TABLE board (
    bno        NUMBER NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    bcontent   VARCHAR2(2000) NOT NULL,
    uemail     VARCHAR2(50) NOT NULL,
    regdate    DATE NOT NULL,
    caid       VARCHAR2(20) NOT NULL,
    CONSTRAINT board_pk PRIMARY KEY (bno),
    CONSTRAINT board_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail),
    CONSTRAINT board_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid),
    CONSTRAINT board_bfile_fk FOREIGN KEY (bno) REFERENCES bdfile(bno)
);

CREATE TABLE tborad (
    tno          NUMBER NOT NULL,
    tmptitle     VARCHAR2(100) NOT NULL,
    tmpcontent   VARCHAR2(2000) NOT NULL,
    tmpregdate   DATE NOT NULL,
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         NUMBER NOT NULL,
    CONSTRAINT tborad_pk PRIMARY KEY (tno),
    CONSTRAINT tborad_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail),
    CONSTRAINT tborad_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid),
    CONSTRAINT tborad_tfile_fk FOREIGN KEY (tno) REFERENCES tfile(tno)
);

CREATE TABLE reply (
    rno     NUMBER NOT NULL,
    rname   VARCHAR2(20) NOT NULL,
    rpwd    VARCHAR2(30) NOT NULL,
    rcon    VARCHAR2(1000) NOT NULL,
    bno     NUMBER NOT NULL,
    CONSTRAINT reply_pk PRIMARY KEY (rno),
    CONSTRAINT reply_board_fk FOREIGN KEY (bno) REFERENCES board(bno)
);

-- 시퀀스 생성
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


---------------예시 더미 데이터------------------------------

-- DEPT TABLE
INSERT INTO dept (did, dname) VALUES ('D001', 'HR');
INSERT INTO dept (did, dname) VALUES ('D002', 'Engineering');
INSERT INTO dept (did, dname) VALUES ('D003', 'Marketing');

-- CATEGORY TABLE
INSERT INTO cate (caid, caregory) VALUES ('C001', 'Technology');
INSERT INTO cate (caid, caregory) VALUES ('C002', 'Business');
INSERT INTO cate (caid, caregory) VALUES ('C003', 'Lifestyle');

-- USER TABLE
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('john.doe@example.com', 'password123', 'John Doe', 'D001');
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('jane.smith@example.com', 'password456', 'Jane Smith', 'D002');
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('alice.jones@example.com', 'password789', 'Alice Jones', 'D003');

-- TEMP FILE TABLE
INSERT INTO tfile (tno, tfname) VALUES (1, 'tempfile1.pdf');
INSERT INTO tfile (tno, tfname) VALUES (2, 'tempfile2.docx');
INSERT INTO tfile (tno, tfname) VALUES (3, 'tempfile3.pptx');

-- BOARD FILE TABLE
INSERT INTO bdfile (bno, bfname) VALUES (1, 'boardfile1.pdf');
INSERT INTO bdfile (bno, bfname) VALUES (2, 'boardfile2.docx');
INSERT INTO bdfile (bno, bfname) VALUES (3, 'boardfile3.pptx');

-- BOARD TABLE
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid) VALUES (1, 'Tech Innovations', 'Discussion about the latest tech innovations.', 'john.doe@example.com', SYSDATE, 'C001');
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid) VALUES (2, 'Marketing Strategies', 'Strategies for effective marketing in 2024.', 'jane.smith@example.com', SYSDATE, 'C002');
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid) VALUES (3, 'Work-Life Balance', 'Tips for maintaining a healthy work-life balance.', 'alice.jones@example.com', SYSDATE, 'C003');

-- TEMP BOARD TABLE
INSERT INTO tborad (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (1, 'Temp Board 1', 'Content for temporary board 1.', SYSDATE, 'john.doe@example.com', 'C001', 100);
INSERT INTO tborad (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (2, 'Temp Board 2', 'Content for temporary board 2.', SYSDATE, 'jane.smith@example.com', 'C002', 200);
INSERT INTO tborad (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (3, 'Temp Board 3', 'Content for temporary board 3.', SYSDATE, 'alice.jones@example.com', 'C003', 300);

-- REPLY TABLE
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (1, 'Commenter1', 'commentpwd1', 'Great post on tech innovations!', 1);
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (2, 'Commenter2', 'commentpwd2', 'Very insightful marketing strategies.', 2);
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (3, 'Commenter3', 'commentpwd3', 'Useful tips on work-life balance.', 3);


