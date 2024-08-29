--0827 io db 계정생성
--주의: 시작시 로컬디스크 c에 io파일 생성해야함

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
