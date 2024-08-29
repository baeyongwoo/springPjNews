/* USER TABLE */
CREATE TABLE "user" (
    email   VARCHAR2(50) NOT NULL,
    pwd     VARCHAR2(30) NOT NULL,
    coid    VARCHAR2(30) NOT NULL,
    name    VARCHAR2(20)
);

ALTER TABLE "user" ADD CONSTRAINT user_pk PRIMARY KEY ( email );

ALTER TABLE "user"
    ADD CONSTRAINT user_company_fk FOREIGN KEY ( coid )
        REFERENCES company ( coid );


/* COMPANY TABLE */
CREATE TABLE company (
    coid    VARCHAR2(30) NOT NULL,
    cname   VARCHAR2(20) NOT NULL
);

ALTER TABLE company ADD CONSTRAINT company_pk PRIMARY KEY ( coid );


/* TEMP BOARD TABlE */
CREATE TABLE tempborad (
    tno       NUMBER NOT NULL,
    title     VARCHAR2(100) NOT NULL,
    content   VARCHAR2(3000) NOT NULL,
    email     VARCHAR2(50) NOT NULL,
    regdate   DATE NOT NULL,
    caid      VARCHAR2(20) NOT NULL,
    code      NUMBER NOT NULL
);

ALTER TABLE tempborad ADD CONSTRAINT tempborad_pk PRIMARY KEY ( tno );

ALTER TABLE tempborad
    ADD CONSTRAINT tempborad_category_fk FOREIGN KEY ( caid )
        REFERENCES category ( caid );

ALTER TABLE tempborad
    ADD CONSTRAINT tempborad_tfile_fk FOREIGN KEY ( tno )
        REFERENCES tfile ( tno );

ALTER TABLE tempborad
    ADD CONSTRAINT tempborad_user_fk FOREIGN KEY ( email )
        REFERENCES "user" ( email );


/* TEMP FILE TABLE */
CREATE TABLE tfile (
    tno      NUMBER NOT NULL,
    tfname   VARCHAR2(20) NOT NULL
);

ALTER TABLE tfile ADD CONSTRAINT tfile_pk PRIMARY KEY ( tno );


/* BOARD TABLE */
CREATE TABLE board (
    bno       NUMBER NOT NULL,
    title     VARCHAR2(100) NOT NULL,
    content   VARCHAR2(30000) NOT NULL,
    email     VARCHAR2(50) NOT NULL,
    regdate   DATE NOT NULL,
    caid      VARCHAR2(20) NOT NULL
);

ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( bno );

ALTER TABLE board
    ADD CONSTRAINT board_bfile_fk FOREIGN KEY ( bno )
        REFERENCES bfile ( bno );

ALTER TABLE board
    ADD CONSTRAINT board_category_fk FOREIGN KEY ( caid )
        REFERENCES category ( caid );

ALTER TABLE board
    ADD CONSTRAINT board_user_fk FOREIGN KEY ( email )
        REFERENCES "user" ( email );


/* BOARD FILE TABLE */
CREATE TABLE bfile (
    bno      NUMBER NOT NULL,
    bfname   VARCHAR2(20) NOT NULL
);

ALTER TABLE bfile ADD CONSTRAINT bfile_pk PRIMARY KEY ( bno );


/* CATEGORY TABLE */
CREATE TABLE category (
    caid       VARCHAR2(20) NOT NULL,
    caregory   VARCHAR2(30) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( caid );


/* REPLY TABLE */
CREATE TABLE reply (
    rno        NUMBER NOT NULL,
    "rename"   VARCHAR2(20) NOT NULL,
    repwd      VARCHAR2(30) NOT NULL,
    recon      VARCHAR2(1000) NOT NULL,
    bno        NUMBER NOT NULL
);

ALTER TABLE reply ADD CONSTRAINT reply_pk PRIMARY KEY ( rno );

ALTER TABLE reply
    ADD CONSTRAINT reply_board_fk FOREIGN KEY ( bno )
        REFERENCES board ( bno );




/*
select
from       join
and
where     ;
*/
















