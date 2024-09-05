--io������ ������ file
--�ѹ��� �ϱ�
DROP TABLE tfile CASCADE CONSTRAINTS;
DROP TABLE bdfile CASCADE CONSTRAINTS;

-- ���� ���̺� ���� (���� ���ǰ� ������ ����)
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE tboard CASCADE CONSTRAINTS;

DROP TABLE cate CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;
DROP TABLE auth CASCADE CONSTRAINTS;


-- ������ ����
DROP SEQUENCE tboard_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

-- ���̺� ����
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
    uname    VARCHAR2(20) DEFAULT 'Unknown', -- �⺻�� �߰�
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
    tmpregdate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- �⺻�� �߰�
    uemail       VARCHAR2(50) NOT NULL,
    caid         VARCHAR2(20) NOT NULL,
    code         VARCHAR2(10) DEFAULT 'ready', -- �⺻�� �߰� �� ������ Ÿ�� ����
    CONSTRAINT tboard_pk PRIMARY KEY (tno),
    CONSTRAINT tboard_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail) on DELETE CASCADE,
    CONSTRAINT tboard_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid) on DELETE CASCADE
);

CREATE TABLE board (
    bno        NUMBER NOT NULL,
    title      VARCHAR2(100) NOT NULL,
    bcontent   CLOB NOT NULL,
    uemail     VARCHAR2(50) NOT NULL,
    regdate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- �⺻�� �߰�
    caid       VARCHAR2(20) NOT NULL,
    tno        number not null,
    CONSTRAINT board_pk PRIMARY KEY (bno),
    CONSTRAINT board_userinfo_fk FOREIGN KEY (uemail) REFERENCES userinfo(uemail) on DELETE CASCADE,
    CONSTRAINT board_cate_fk FOREIGN KEY (caid) REFERENCES cate(caid) on DELETE CASCADE,
    CONSTRAINT board_tboard_fk FOREIGN KEY (tno) REFERENCES tboard(tno) on DELETE CASCADE
    
);

CREATE TABLE reply (
    rno     NUMBER NOT NULL,
    rname   VARCHAR2(20) DEFAULT 'Anonymous', -- �⺻�� �߰�
    rpwd    VARCHAR2(30) NOT NULL,
    rcon    VARCHAR2(1000) NOT NULL,
    bno     NUMBER NOT NULL,
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
-- ������ ����
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

-- ������ ����
INSERT INTO dept (did, dname) VALUES ('D01', '�μ�1');
INSERT INTO dept (did, dname) VALUES ('D02', '�μ�2');
INSERT INTO dept (did, dname) VALUES ('D00', 'Information Oceans');

INSERT INTO cate (caid, category) VALUES ('C01', '���');
INSERT INTO cate (caid, category) VALUES ('C02', '����Ͻ�');

INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('user1@ex.com', 'pw1', 'ȫ�浿', 'D01');
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('user2@ex.com', 'pw2', '��ö��', 'D02');
-- �߰��� �����
INSERT INTO userinfo (uemail, upwd, uname, did) VALUES ('io@io.io', 'password', '������', 'D00');

INSERT INTO auth (uemail, authority) VALUES ('user1@ex.com', 'Member');
INSERT INTO auth (uemail, authority) VALUES ('user2@ex.com', 'Admin');
INSERT INTO auth (uemail, authority) VALUES ('io@io.io', 'Admin');

INSERT INTO tboard (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (tboard_seq.NEXTVAL, '�ӽ� ���� 1', '�ӽ� ���� 1', current_timestamp, 'user1@ex.com', 'C01', 'ready');
INSERT INTO tboard (tno, tmptitle, tmpcontent, tmpregdate, uemail, caid, code) VALUES (tboard_seq.NEXTVAL, '�ӽ� ���� 2', '�ӽ� ���� 2', current_timestamp, 'user2@ex.com', 'C02', 'ready');

INSERT INTO board (bno, title, bcontent, uemail, regdate, caid, tno) VALUES (board_seq.NEXTVAL, 'ù ��° ����', '����1', 'user1@ex.com', current_timestamp, 'C01', 1);
INSERT INTO board (bno, title, bcontent, uemail, regdate, caid, tno) VALUES (board_seq.NEXTVAL, '�� ��° ����', '����2', 'user2@ex.com', current_timestamp, 'C02', 2);

INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (reply_seq.NEXTVAL, '�����1', '��й�ȣ1', '��� ���� 1', 1);
INSERT INTO reply (rno, rname, rpwd, rcon, bno) VALUES (reply_seq.NEXTVAL, '�����2', '��й�ȣ2', '��� ���� 2', 1);

commit;
-- ������ Ȯ�� (�ּ� ó���� �κ�)
-- SELECT * FROM dept;
-- SELECT * FROM cate;
-- SELECT * FROM userinfo;
-- SELECT * FROM board;
-- SELECT * FROM tboard;
-- SELECT * FROM reply;
-- SELECT * FROM tfile;
-- SELECT * FROM bdfile;
