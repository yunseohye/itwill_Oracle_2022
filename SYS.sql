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

 --(22.07.07)기준
--dictionary
SELECT * FROM DBA_UNUSED_COL_TABS;
--관리자가 비활성화 된 COLUMN이 무엇인지 확인하는 방법

SELECT COUNT(*) FROM DICTIONARY;
--관리자가 쓸 수 있는 DICTIONARY는 2551개, 일반 사용자보다 훨씬 많음

--[DCL] (GRANT, REVOKE)
/* 사용자는 사용 불가, SYS에서 사용 가능
GRANT : USER(사용자)나 OBJECT(CREATE로 생성할 수 있는 것들)에
권한을 부여할 때 사용한다. 
REVOKE : USER(사용자)나 OBJECT(CREATE로 생성할 수 있는 것들)에
권한을 회수, 박탈할 때 사용한다.
*/

CREATE USER TEST
IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 1M ON USERS; --UNLIMITED가 아니라 용량을 제한하겠다는 뜻임.


CREATE USER INSA --USER의 TABEL 생성
IDENTIFIED BY INSA
DEFAULT TABLESPACE USERS --기본스페이스
TEMPORARY TABLESPACE TEMP --임시테이블스페이스
QUOTA 1M ON USERS;
--현재는 로그인이 되지 않음

SELECT * FROM DBA_USERS;
--딕셔너리 USER"S"

SELECT * FROM V$SESSION
WHERE USERNAME IS NOT NULL;
--현재 접속되어있는 유저들을 검색(KIM, SYS) 출력
--V$SESSION : 세션에 대한 전반적인 내용을 보여주는 것임.

--[권한의 종류]
--시스템의 권한을 볼 수 있는 명령어
SELECT * FROM SYSTEM_PRIVILEGE_MAP;
--줄 수 있는 권한의 종류가 쭉 출력이 됨. 208개
/*
CREATE TABLE : 테이블을 생성하는 권한
CREATE값이 생성이 되면 ALTER, DROP이 자동으로 딸려감
CREATE ANY TABLE : 다른 영역의 테이블을 내가 만들어 줄 수 있음
A가 B의 영역에 테이블을 생성을 함. 그럼 B의 것이 됨. A는 사용 권한x

*/

/*
[SYSTEM권한] : 시스템 관리자가 일반 유저들에게 권한을 주는 것(DBA -> USERS)
DATABASE의 OBJECT들을 생성(CREATE), 수정(ALTER), 삭제(DROP)할 수 있는 권한

[OBJECT권한] : USER가 만든 OBJECT(TABLE)를 조작
(INSERT, UPDATE, DELETE, SELECT)

OBJECT : TABLE, ROLE(CONNECT,RESOURCE), SEQUENCE, VIEW, SYSNONYM

*/

--[시스템권한]
GRANT CREATE USER TO KIM;
--KIM에게 계정 생성할 수 있는 권한을 준다.
--모든 사람에게 권한을 주고싶을때는 PUBLIC

GRANT CREATE SESSION SYNONYM TO TEST;
--로그인 기능만 있는 것임, 테이블 생성을 불가, 아무것도 못함.
GRANT CREATE SESSION, CREATE SYNONYM TO TEST;
--권한은 누적이 된다. ,를 이용해 새로운 내용을 삽입이 가능함.

--ROLE(역할) : 권한을 주는 방법
--CONNECT, RESOURCE

SELECT * FROM ROLE_SYS_PRIVS;
--ROLE의 종류가 출력이 됨
--ROLE은 그릇이라 생각하면 됨.
--DBA의 권한을 일반 사용자에게 넘겨주면 관리자와 동급의 역할을 할 수 있음

SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE IN('CONNECT','RESOURCE','MANAGER')
ORDER BY ROLE
;
--CONNECT와 RESOURCE의 권한을 볼 수 있음.
--RESOURCE에는 CREATE TABLE권한이 있기 때문에 테이블을 생성할 수 있다.
--RESOURCE ROLE을 받은 사람은 시스템의 권한을 넘겨받는 것이다.

CREATE ROLE MANAGER;

SELECT * FROM DBA_ROLES;
--MANAGER라는 그릇을 생성했지만 빈껍데기임. 권한을 줘야 다른 사람이 사용가능

GRANT CREATE SESSION,CREATE TABLE, CREATE USER TO MANAGER;
--INSA에게 이 권한을 주면 INSA는 이 안에 있는 모든 권한을 이용하게 됨

GRANT MANAGER TO INSA;

REVOKE MANAGER FROM INSA;
--INSA한테 매니저 테이블을 뺏음 

GRANT CREATE ROLE TO KIM;
--KIM은 CREATE ROLE권한을 받음 (+ALTER, DROP)


--(22-07-08기준)
GRANT CREATE VIEW TO KIM;
--KIM에게 VIEW를 만들 수 있는 권한을 주는 것.
