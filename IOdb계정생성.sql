<<<<<<< HEAD
--0827 io db 계정생성
--주의: 시작시 로컬디스크 c에 io파일 생성해야함

-- 데이터베이스 생성
=======
--0827 io db ����

-- �����ͺ��̽� ����
>>>>>>> 952bb3e5750d64fbce69f3c78f3af9fd956d83fa
create tablespace io datafile
'C:\io\io.dbf' size 100M
autoextend on next 5M;

 

<<<<<<< HEAD
-- User 생성
=======
-- User ����
>>>>>>> 952bb3e5750d64fbce69f3c78f3af9fd956d83fa
create user io_user identified by io1234
default tablespace io
temporary tablespace temp;

 

<<<<<<< HEAD
-- 권한설정
=======
-- ���Ѽ���
>>>>>>> 952bb3e5750d64fbce69f3c78f3af9fd956d83fa
grant dba to io_user;
