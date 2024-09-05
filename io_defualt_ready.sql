--io최종에 가가우 file
--한번만 하기
DROP TABLE bdfile CASCADE CONSTRAINTS;

-- 기존 테이블 삭제 (제약 조건과 시퀀스 포함)
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE tboard CASCADE CONSTRAINTS;

DROP TABLE cate CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;
DROP TABLE auth CASCADE CONSTRAINTS;
DROP TABLE iofile CASCADE CONSTRAINTS;


-- 시퀀스 삭제
DROP SEQUENCE tboard_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

-- 테이블 생성
CREATE TABLE dept (
    did     VARCHAR2(30) NOT NULL,
    dname   VARCHAR2(20) NOT NULL,
    CONSTRAINT dept_pk PRIMARY KEY (did)
);

CREATE TABLE cate (
    caid       VARCHAR2(20) NOT NULL,
    category   VARCHAR2(30) NOT NULL, 
    CONSTRAINT cate_pk PRIMARY KEY (caid)
);

CREATE TABLE userinfo (
    uemail   VARCHAR2(50) NOT NULL,
    upwd     VARCHAR2(100) NOT NULL,
    uname    VARCHAR2(20) DEFAULT 'Unknown', -- 기본값 추가
    did      VARCHAR2(30) NOT NULL,
    CONSTRAINT userinfo_pk PRIMARY KEY (uemail),
    CONSTRAINT userinfo_dept_fk FOREIGN KEY (did) REFERENCES dept(did)
);

CREATE TABLE auth (
    uemail    VARCHAR2(50) NOT NULL,
    authority VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_auth_usersinfo FOREIGN KEY (uemail) REFERENCES userinfo(uemail) on delete cascade
);



CREATE TABLE tboard (
    tno          NUMBER NOT NULL,
    tmptitle     VARCHAR2(100) NOT NULL,
    tmpcontent   CLOB NOT NULL,
    tmpregdate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 기본값 추가
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         VARCHAR2(10) DEFAULT 'ready', -- 기본값 추가 및 데이터 타입 변경
    CONSTRAINT tboard_pk PRIMARY KEY (tno),
    CONSTRAINT tboard_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail) on DELETE CASCADE,
    CONSTRAINT tboard_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid) on DELETE CASCADE
);

CREATE TABLE board (
    bno        NUMBER NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    bcontent   CLOB NOT NULL,
    uemail     VARCHAR2(50) NOT NULL,
    regdate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 기본값 추가
    caid       VARCHAR2(20) NOT NULL,
    tno        number not null,
    CONSTRAINT board_pk PRIMARY KEY (bno),
    CONSTRAINT board_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail) on DELETE CASCADE,
    CONSTRAINT board_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid) on DELETE CASCADE,
    CONSTRAINT board_tboard_fk FOREIGN KEY (tno) REFERENCES tboard(tno) on DELETE CASCADE
    
);

CREATE TABLE reply (
    rno     NUMBER NOT NULL,
    bno     NUMBER NOT NULL,
    reply     VARCHAR2(1000) NOT NULL,
    replyer   VARCHAR2(100) DEFAULT 'Anonymous', -- 기본값 추가
    replydate DATE,
    updatedate DATE,
    CONSTRAINT reply_pk PRIMARY KEY (rno),
    CONSTRAINT reply_board_fk FOREIGN KEY (bno) REFERENCES board(bno) on DELETE CASCADE
);

CREATE TABLE iofile (
    uuid      VARCHAR2(100 BYTE) PRIMARY KEY, 
    tno        NUMBER NOT NULL,
    CONSTRAINT iofile_tboard_fk FOREIGN KEY (tno) REFERENCES tboard(tno) on DELETE CASCADE,
    UPLOADPATH VARCHAR2(200 BYTE) NOT NULL, 
    FILENAME  VARCHAR2(200 BYTE) NOT NULL, 
    FILETYPE  VARCHAR2(20 BYTE) 
);
-- 시퀀스 생성
CREATE SEQUENCE tboard_seq
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

-- 데이터 삽입
INSERT INTO dept (did, dname) VALUES ('S01', 'SBS');
INSERT INTO dept (did, dname) VALUES ('K01', 'KBS');
INSERT INTO dept (did, dname) VALUES ('Y01', 'YTN');
INSERT INTO dept (did, dname) VALUES ('IO', 'Information Oceans');


commit;
-- 데이터 확인 (주석 처리된 부분)
-- SELECT * FROM dept;
-- SELECT * FROM cate;
-- SELECT * FROM userinfo;
-- SELECT * FROM board;
-- SELECT * FROM tboard;
-- SELECT * FROM reply;
-- SELECT * FROM tfile;
-- SELECT * FROM bdfile;




