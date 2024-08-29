--0827 io db ����

-- �����ͺ��̽� ����
create tablespace io datafile
'C:\io\io.dbf' size 100M
autoextend on next 5M;

 

-- User ����
create user io_user identified by io1234
default tablespace io
temporary tablespace temp;

 

-- ���Ѽ���
grant dba to io_user;
