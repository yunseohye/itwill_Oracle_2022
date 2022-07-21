--SYS
CREATE TABLE post (
	seq  NUMBER  NOT NULL
	,zipcode  VARCHAR2(10)
	,sido  VARCHAR2(50)
	,gugun  VARCHAR2(100)
	,dong  VARCHAR2(100)
	,bunji  VARCHAR2(50)
        ,PRIMARY KEY (seq)
);
commit;
drop table post PURGE;

 --(22.07.07)����
--dictionary
SELECT * FROM DBA_UNUSED_COL_TABS;
--�����ڰ� ��Ȱ��ȭ �� COLUMN�� �������� Ȯ���ϴ� ���

SELECT COUNT(*) FROM DICTIONARY;
--�����ڰ� �� �� �ִ� DICTIONARY�� 2551��, �Ϲ� ����ں��� �ξ� ����

--[DCL] (GRANT, REVOKE)
/* ����ڴ� ��� �Ұ�, SYS���� ��� ����
GRANT : USER(�����)�� OBJECT(CREATE�� ������ �� �ִ� �͵�)��
������ �ο��� �� ����Ѵ�. 
REVOKE : USER(�����)�� OBJECT(CREATE�� ������ �� �ִ� �͵�)��
������ ȸ��, ��Ż�� �� ����Ѵ�.
*/

CREATE USER TEST
IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 1M ON USERS; --UNLIMITED�� �ƴ϶� �뷮�� �����ϰڴٴ� ����.


CREATE USER INSA --USER�� TABEL ����
IDENTIFIED BY INSA
DEFAULT TABLESPACE USERS --�⺻�����̽�
TEMPORARY TABLESPACE TEMP --�ӽ����̺����̽�
QUOTA 1M ON USERS;
--����� �α����� ���� ����

SELECT * FROM DBA_USERS;
--��ųʸ� USER"S"

SELECT * FROM V$SESSION
WHERE USERNAME IS NOT NULL;
--���� ���ӵǾ��ִ� �������� �˻�(KIM, SYS) ���
--V$SESSION : ���ǿ� ���� �������� ������ �����ִ� ����.

--[������ ����]
--�ý����� ������ �� �� �ִ� ��ɾ�
SELECT * FROM SYSTEM_PRIVILEGE_MAP;
--�� �� �ִ� ������ ������ �� ����� ��. 208��
/*
CREATE TABLE : ���̺��� �����ϴ� ����
CREATE���� ������ �Ǹ� ALTER, DROP�� �ڵ����� ������
CREATE ANY TABLE : �ٸ� ������ ���̺��� ���� ����� �� �� ����
A�� B�� ������ ���̺��� ������ ��. �׷� B�� ���� ��. A�� ��� ����x

*/

/*
[SYSTEM����] : �ý��� �����ڰ� �Ϲ� �����鿡�� ������ �ִ� ��(DBA -> USERS)
DATABASE�� OBJECT���� ����(CREATE), ����(ALTER), ����(DROP)�� �� �ִ� ����

[OBJECT����] : USER�� ���� OBJECT(TABLE)�� ����
(INSERT, UPDATE, DELETE, SELECT)

OBJECT : TABLE, ROLE(CONNECT,RESOURCE), SEQUENCE, VIEW, SYSNONYM

*/

--[�ý��۱���]
GRANT CREATE USER TO KIM;
--KIM���� ���� ������ �� �ִ� ������ �ش�.
--��� ������� ������ �ְ�������� PUBLIC

GRANT CREATE SESSION SYNONYM TO TEST;
--�α��� ��ɸ� �ִ� ����, ���̺� ������ �Ұ�, �ƹ��͵� ����.
GRANT CREATE SESSION, CREATE SYNONYM TO TEST;
--������ ������ �ȴ�. ,�� �̿��� ���ο� ������ ������ ������.

--ROLE(����) : ������ �ִ� ���
--CONNECT, RESOURCE

SELECT * FROM ROLE_SYS_PRIVS;
--ROLE�� ������ ����� ��
--ROLE�� �׸��̶� �����ϸ� ��.
--DBA�� ������ �Ϲ� ����ڿ��� �Ѱ��ָ� �����ڿ� ������ ������ �� �� ����

SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE IN('CONNECT','RESOURCE','MANAGER')
ORDER BY ROLE
;
--CONNECT�� RESOURCE�� ������ �� �� ����.
--RESOURCE���� CREATE TABLE������ �ֱ� ������ ���̺��� ������ �� �ִ�.
--RESOURCE ROLE�� ���� ����� �ý����� ������ �Ѱܹ޴� ���̴�.

CREATE ROLE MANAGER;

SELECT * FROM DBA_ROLES;
--MANAGER��� �׸��� ���������� �󲮵�����. ������ ��� �ٸ� ����� ��밡��

GRANT CREATE SESSION,CREATE TABLE, CREATE USER TO MANAGER;
--INSA���� �� ������ �ָ� INSA�� �� �ȿ� �ִ� ��� ������ �̿��ϰ� ��

GRANT MANAGER TO INSA;

REVOKE MANAGER FROM INSA;
--INSA���� �Ŵ��� ���̺��� ���� 

GRANT CREATE ROLE TO KIM;
--KIM�� CREATE ROLE������ ���� (+ALTER, DROP)


--(22-07-08����)
GRANT CREATE VIEW TO KIM;
--KIM���� VIEW�� ���� �� �ִ� ������ �ִ� ��.
