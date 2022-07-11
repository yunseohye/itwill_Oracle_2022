--lee
--(22.07.04)����
SELECT * FROM CUSTOM;

--������ �ִ� �����Ϳ��� �ֹι�ȣ ��������
SELECT USERNAME, RPAD(SUBSTR(JUMIN,1,8),14,'*') JUMIN FROM CUSTOM;

--(22.07.05)����
SELECT * FROM CUSTOM;

--�ּҺ� �ο��� ���ϱ�
SELECT ADDR1, COUNT(*), ROUND(AVG(POINT)), SUM(POINT) FROM CUSTOM
GROUP BY ADDR1;

--����Ŭ�� SWITCH��
--������ �ִ� ���� ������ ����/���ڸ� ������� ������ �Ļ��÷��̹Ƿ�
--��Ī�� �� �������־�� �Ѵ�.
--���1)
SELECT 
CASE SEX
WHEN '1' THEN '����'
WHEN '0' THEN '����'
END GENDER,
COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;

--���2)
SELECT 
CASE SEX
WHEN '1' THEN '����' ELSE '����'
END GENDER,
COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;

--[CASE���� ����]

��� 1)
SELECT
CASE �÷���
	WHEN 1 THEN 100
	WHEN 2 THEN 200
	WHEN 3 THEN 300
	WHEN 4 THEN 400
	ELSE 500
	END AS ��Ī
FROM DUAL;

��� 2)
SELECT
CASE �÷��� WHEN 1 THEN 100 ELSE 0,
CASE �÷���	WHEN 2 THEN 200 ELSE 0,
CASE �÷���	WHEN 3 THEN 300 ELSE 0,
CASE �÷���	WHEN 4 THEN 400 ELSE 0,
FROM DUAL;


SELECT * FROM CUSTOM;

SELECT
CASE ADDR1
WHEN '����Ư����' THEN '����'
WHEN '��⵵' THEN '���'
WHEN '��󳲵�' THEN '�泲'
END ADDR
FROM CUSTOM;

/*
JOIN��
EQUITE JOIN(INNER JOIN)
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/
--JOIN���� Ư¡ : ����Ǵ� �и� �־�� ���ι��� ������ �� �ִ�.
--������ �������� �ȸ���� ���ι� ��ü�� ����� �� ���� ������ ���͸� DB�� �ȴ�.

SELECT * FROM TAB;
/*���̺�鳢�� ����Ǵ� �÷��� �־�߸� ���ι��� �����ϴ�.*/
SELECT * FROM CUSTOM WHERE USERID='nu7634';
SELECT * FROM COMPANY WHERE USERID='nu7634';
SELECT * FROM POINT WHERE USERID='nu7634';
SELECT * FROM SALES WHERE USERID='nu7634';
--����и��� USERID='nu7634'�� �ֱ� ������ 
--USERID='nu7634'�� �̸�, ȸ��, ����Ʈ ����, ���� ����� �ѹ��� SELECT�� �� �ִ�.

--[EQUITE JOIN(INNER JOIN)] - ����⺻���̰� ���� ���ȴ�.
SELECT CUSTOM.USERID, USERNAME, AGE, COMPANY.USERID, ADDR1, PAY
FROM CUSTOM, COMPANY --�ߺ��Ǵ� �÷��� �� ��ġ�� ǥ��������Ѵ�.
WHERE CUSTOM.USERID = COMPANY.USERID; -- ����и�

--�տ� �ԷµǴ� USERID�� �÷����� ���̸� �ڿ� ���� USERID�� �����ص� ���� ��µȴ�.

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A, COMPANY B 
--���̺� ��Ī�� ���϶��� AS�� ����ϸ� ������ ����.
WHERE A.USERID = B.USERID;

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A INNER JOIN COMPANY B 
ON A.USERID = B.USERID;
--FM����� ���� ǥ�ذ������� ����Ŭ������ ,�� ����� �� �ְ� ��������. 
-- , ��� INNER JOIN(INNER�� ���� ����) WHERE ��� ON �Է�

--(����)'CUSTOM'���� UserID, UserName�� �˻��ϰ� POINT ���̺��� 
--��ǰ����, �α��ο� ����� ���� POINT ����(Product, Login)�� �˻�

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A, POINT B
WHERE A.USERID = B.USERID AND LOGIN>=10;

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN POINT B
ON A.USERID = B.USERID AND LOGIN>=10;

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN POINT B
ON A.USERID = B.USERID
WHERE LOGIN>=10;

-------------------------------------------------------------------

--[OUTER JOIN] - �ܺ������̶�� ��.
--���� ���̺��� �������� �ٸ��ʿ� �ִ� �����͸� ��ġ��Ű�� ���̴�.
--���� ���̺��� � ���̺�� ���ϳĿ� ���� ��°��� �޶��� ���ִ�.

SELECT COUNT(*) FROM CUSTOM; --459
SELECT COUNT(*) FROM COMPANY; --464

--CUSTOM ���̺� �������� JOIN�� �Է�
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) -- �������� �밢������ �Է���.
ORDER BY B.COMPANY DESC;
--������ ���̺��� �ִµ� ȸ������ ���̺��� ���� ���� NULL���� ��.

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) AND B.COMPANY IS NULL;
--NULL���� ã�Ƽ� ���

--COMPANY ���̺� �������� JOIN�� �Է�
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID(+) = B.USERID -- �������� �밢������ �Է���.
ORDER BY B.COMPANY DESC;

---------------------------------------
--ANSI ǥ�� SQL
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

-----------------------------------------

--[CROSS JOIN] - ��ȣ ����
--���� ���� �����͸� ���ο� ���̺� ���� �־� �׽�Ʈ �Ҷ� �����

SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A, COMPANY B;
--459*464 = 212,976���� ROWS ���� ��µȴ�.

--ANSI ǥ�� SQL
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B;

--INNER JOIN
--inner join�̶� ���� ������ ������ cross join �������� �ۼ��� ��
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B
WHERE A.USERID = B.USERID;

----------------------------------------------------
--[SELF JOIN]
-- �ϳ��� ���̺��� �޸𸮿� �ι� �÷� ���� ���� �� SELF JOIN ���
-- �ϳ��� ���̺��� �ΰ��� �����ؼ� ���� ���ϴ� ���� JOIN�������� �ش�ȴ�.
-- �������� �����ϰ� �ܿ�����.

SELECT * FROM CUSTOM 
ORDER BY USERNAME;

SELECT DISTINCT A.* -- DISTINCT�� �ߺ��Ǵ� ���� ������
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME --�̸��� ���ƾ�������
AND A.USERID <> B.USERID --ID�� �޶����
ORDER BY A.USERNAME;

--'CUSTOM' ���̺��� '���ֵ�'�� ��� �ִ� ����� ������ �̸��� ���� ����� ã���ÿ�
SELECT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.USERID <> B.USERID AND A.ADDR1 = '���ֵ�' AND B.ADDR1 = '���ֵ�'; 
--WHERE�� ������ ������� �ʱ� ������ ������ �����ͱ��� �ݵ�� 
--������ �񱳸� �ؾ� �Ϻ��� ���� ����� �ȴ�.
--�Ѱ����� ǥ�� ������ �� ���� ������ ���ϱ� ������ ǥ ��ü�� �����ؼ� ��
 
--3�� �̻��� ���̺� JOIN
--CUSTOM : USERID, USERNAME
--COMPANY : COMPANY, DEPT
--POINT : PRODUCT, LOGIN

SELECT A.USERID, USERNAME, COMPANY, DEPT, PRODUCT, LOGIN
FROM CUSTOM A , COMPANY B , POINT C
WHERE A.USERID = B.USERID AND A.USERID = C.USERID;

SELECT A.USERID, USERNAME, COMPANY, DEPT, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID=B.USERID INNER JOIN POINT C
ON A.USERID=C.USERID;
--A�� B�� ���ι� ���� �� �� �� �ȿ� �̳����ι� ����� B�� C�� ��

--[�Ļ� ���̺�� ����](�̳����� ���)
--�Ļ� ���̺� : ������ �������� �ʴ� ���̺��� ����

--���̵𺰷� ����Ƚ���� ���űݾ��� �� �˻�
SELECT * FROM SALES;

SELECT USERID, COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID;

--���� �ݾ��� �հ谡 150���� �̻��� ��� �˻�

SELECT USERID, COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID
HAVING SUM(PRICE) >= 1500000;

--���� �Ʒ��� ������ ����
--[INLINE-VIEW]
SELECT A.USERID,USERNAME,ADDR1, CNT, HAP
FROM CUSTOM A , (
SELECT USERID, COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID
HAVING SUM(PRICE) >= 1500000
) B 
WHERE A.USERID = B.USERID;

SELECT * FROM TAB;

CREATE TABLE JEJU
AS
SELECT * FROM CUSTOM WHERE ADDR1='���ֵ�';

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1='����Ư����';

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1='��⵵';

SELECT * FROM TAB;

SELECT * FROM JEJU;
SELECT * FROM SEOUL;
SELECT * FROM KYUNG;

SELECT * FROM JEJU
UNION
SELECT * FROM SEOUL
UNION
SELECT * FROM KYUNG;
--����, ����, ��⵵�� ���� UNION�� �̿��� �ѹ��� ����� �� ����


--(22-07-06)����
--[SUBQUERY(��������)]
--�����ȿ� ������ ���ִ� ��
--���� ������ ��ȣ�� ���� ������ ������ ����.
--���ϴ� �÷��� ������ �����ؾ��Ѵ�.
--���ϴ� �÷����� �����ؾ� ���� �����Ϳ��� ���� ���Ͽ� ��µȴ�.
--���ϴ� �÷����� �ٸ� ��� ������ ������ ������ ���ϴ� ������ ���x
--���������� 100% JOIN������ ������ �� �ִ�.

--(����)COMAPNY ���̺��� USERID, COMPANY, DEPT, PAY, ��տ��� �˻�
SELECT * FROM COMPANY; --COMPANY���� ���

SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY; -- ��� ���� ���

SELECT USERID, COMPANY, DEPT, PAY,
(SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY) A_PAY --�������� ��ȣ �߿�
FROM COMPANY;

--(����)CUSTOM ���̺��� ��� ���̺��� ���� ����� ������ �˻�
SELECT * FROM CUSTOM;

SELECT ROUND(AVG(AGE)) FROM CUSTOM;

SELECT * FROM CUSTOM WHERE AGE>=(SELECT ROUND(AVG(AGE)) FROM CUSTOM);

--(����)�����ڵ��� �׷쿡 �ٹ��ϴ� ������ ����Ͻÿ�.
SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%';

SELECT * FROM CUSTOM
WHERE USERID IN('ih9389','418571');

SELECT * FROM CUSTOM
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

--JOIN���� ����Ͽ� ����Ͻÿ�.
SELECT A.*
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID AND COMPANY LIKE '�����ڵ���%';
--����� CUSTOM�� ��� �����͸� ����� �Ǵ� ���̴�.

--(����)4ȸ �̻� �Ǹ� ����� �ִ� ������ �⺻ ������ �˻��Ͻÿ�.
--SALES, CUSTOM
SELECT * FROM CUSTOM
ORDER BY USERID;
--USERID�� �������� CUSTOM TABLE�� ������ ���

SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4;
--�����Ͱ� 18��
/*USERID ����(���� - ����� 4�� �̻�)���� 
SALES TABLE�� ���� �� USERID�� ���Ƚ���� ���*/ 

SELECT * FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4);
/*�����Ͱ� 17�� SALES���̺��� ������ 
CUSTOM���̺��� ���� �����͸� ���� ����Ѵ�.*/
/* SALES TABLE���� ����� 4�� �̻��� USERID�� CUSTOM TABLE�� �ִ�
USERID�� ���� ���� �� ���ؿ� �´� ���� ����Ѵ�.
*/

SELECT A.*, CNT
FROM CUSTOM A, 
(SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4) B
WHERE A.USERID = B.USERID;
--���� ������ CNT(��� Ƚ��)���� ������ش�.

--[ANY(�������� ����), ALL(������ ������)]
-- : MAX, MIN���� ANY�� ������ ������ ANY�� ����ϴ� ���̴�.
/*
 >ANY : �ּҰ����� ū ������(ANY���� ũ��)
 <ANY : �ִ밪���� ���� ������(ANY���� �۴�)
 >ALL : �ִ밪���� ū ������(ALL���� ũ��)
 <ALL : �ּҰ����� ���� ������(ALL���� �۴�)
*/


SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�' ORDER BY POINT;
--MIN : 132, MAX : 269
--CUSTOM���̺� �ִ� ADDR1�� ���� ���ֵ��� ����Ʈ���� ���

/*���ֵ��� ��� ��� �� ����Ʈ�� ���� ���� �������
 ū ����Ʈ�� ���� ����� �����͸� ã�� ����ض�*/
SELECT * FROM CUSTOM
WHERE POINT > ANY(SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

------------------------------------------------------------------

--�ִ밪���� ���� �����͸� ã��
/*���ֵ��� ��� ��� �� ����Ʈ�� ���� ���� ������� 
����Ʈ�� ���� ����� �����͸� ã�� ����ض�*/
SELECT * FROM CUSTOM
WHERE POINT < ANY(SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

--------------------------------------------------------------------

--�ִ밪���� ū �����͸� ã��
/*���ֵ��� ��� ��� �� ����Ʈ�� ���� ���� �������
�� ����Ʈ�� ���� ���� ����� �����͸� ����ض�*/
SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

--------------------------------------------------------------------

--132���� ���� �����Ͱ� ��� ����� ���� ����
--�ּҰ����� ���� �����͸� ã��
/*���ֵ��� ��� ��� �� ����Ʈ�� ���� ���� �������
�� ���� ����Ʈ�� ���� ����� �����͸� ����ض�*/
SELECT * FROM CUSTOM
WHERE POINT < ALL(SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

SELECT * FROM CUSTOM; --UPDATE �Է� �� �����ϸ� �ٲ� ���� �����.

--USERID='nu7634'�� 132���� ���� ������ ������Ʈ ���� ���� ��µǰ� ����
UPDATE CUSTOM SET POINT=130 WHERE USERID='nu7634';

---------------------------------------------------------------------

SELECT POINT FROM CUSTOM WHERE AGE >= 70; -- ���� ����
--CUSTOM ���̺��� AGE COULMN�� 70�� �̻��� ��츦 ����Ͻÿ�

--���������� ����� ������ ���������� ����� ������ �ʴ´�.

--���������� ���� ������ ANY�� ��� ����� ������ �ʴ´�.
SELECT * FROM CUSTOM
WHERE POINT > ANY (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

SELECT * FROM CUSTOM
WHERE POINT < ANY (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

--���������� ������ ALL�� ��� ����� ��µȴ�.
SELECT * FROM CUSTOM
WHERE POINT < ALL (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

--���������� ���� ���� ���� ��½��� �����͸� Ȯ���� ����
--�ڵ带 �ۼ��ؾ� ���ϴ� ���� ����� ����� �� �ִ�.

--------------------------------------------------------------------
SELECT * FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%';
-- COMPANY���̺��� COMPANY �÷����� �����ڵ���%�� ���� ����Ͻÿ�.  

--IN�����ڴ� OR �������̴�. 
SELECT * FROM CUSTOM
WHERE USERID IN(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '�����ڵ���%');
/* COMPANY���̺��� COMPANY �÷����� �����ڵ���%�� ���� USERID�� ����
USERID�� ���� CUSTOM TABLE�� ���� ����Ͻÿ�. */
/* CUSTOM ���̺��� ���� COMPANY �����ڵ���%�� �ִ�.
�����ڵ���%�� ���� ����ϱ� ���� ���̺��� ����Ǵ� 
USERID�� ���� ���� ����ϴ� ���̴�.*/

--IN�� =ANY�� ���� ������ �Ѵ�.
--ANY�� ����ӵ��� �ξ� ����
SELECT * FROM CUSTOM
WHERE USERID =ANY(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '�����ڵ���%');

---------------------------------------------------------------------
-- 446ROWS
/* COMPANY���̺��� COMPANY �÷����� �����ڵ���%�� ���� USERID�� ����
USERID�� ������ CUSTOM TABLE�� ���� ����Ͻÿ�. */
SELECT * FROM CUSTOM
WHERE USERID NOT IN(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '�����ڵ���%');

-- NOT IN�� �Ȱ��� �����ڴ�  <>ALL 
SELECT * FROM CUSTOM
WHERE USERID <>ALL(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '�����ڵ���%');

-- 459ROWS Ʋ�� ������. ��ü �����Ͱ� ��µȴ�.
SELECT * FROM CUSTOM
WHERE USERID <>ANY(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '�����ڵ���%');

/*
--IN�� =ANY�� ���� ������ �Ѵ�.
--NOT IN�� <>ALL�� ���� ������ �Ѵ�.
*/

-----------------------------------------------------------------
--��������
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

--���������� ���� ���������� �����̵�. ���� ���̺� ���̱� ����
SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%';

--�������(���������� ����ϰ� ����) -> �ӵ��� ����
/*
SELECT �ؼ� COMPANY TABLE�� �����͸� ������, 
������ ��ȣ ���� ���̺��� USERID�� ������ ���� ��, 
�׸��� �����ڵ����� �ٹ��ؾ���
*/
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE EXISTS
(SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID 
AND COMPANY LIKE '�����ڵ���%');

SELECT * FROM COMPANY,CUSTOM WHERE COMPANY.USERID = CUSTOM.USERID 
AND COMPANY LIKE '�����ڵ���%';
--��������� ���� ���������� ������ ���� ����
--CUSTOM.USERID�� ��ȣ ���� SELECT�� TABLE���̱� ����
SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID 
AND COMPANY LIKE '�����ڵ���%';

--���� ���������� ����Ǵ� ������ ���� ��������, ��������� �����Ѵ�.

--------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵';

SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1='��⵵') A;

--��⵵�� ��鼭 ���̰� 20�캸�� � ���(����)
--AND�������̱� ������ ������ ����� ����
SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵' AND AGE<=20;

--���������� �ְ� ������ ����
--1���� ��⵵�� ��� ����� SORTING�� �� 2���� ���ǿ� �´� ����� ã��
--��ȣ�� ���� �����Ų �� �ؿ� ������ ������.
SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1='��⵵') A
WHERE AGE <= 20;

--DML(INSERT, UPDATE, DELETE)


--------------------------------------------------------------------
--[PL/SQL]

DROP TABLE ��� PURGE;

create table ���
(�����ȣ number(10),
����� varchar2(10),
�μ���ȣ number(2),
���� varchar2(10),
�����ȣ char(7),
�ּ� varchar2(50),
��ȭ��ȣ char(15),
�޿� number(5),
Ŀ�̼� number(5),
�Ի��� date,
���� char(6),
�����ȣ number(10)
);

insert into ��� values(2001,'�̼���',10,'����','125-365','���� ��걸','02-985-1254',3500,100,'1980-12-01','����',null);
insert into ��� values(2002,'ȫ�浿',10,'�븮','354-865','���� ������','02-865-1254',4000,'','2000-01-25','����',2004);
insert into ��� values(2003,'������',20,'���','587-456','�λ� �ؿ�뱸','051-256-9874',2500,100,'2002-05-24','����',2002);
insert into ��� values(2004,'������',30,'����','987-452','���� ������','02-33-6589',5000,'','1997-03-22','����',2001);
insert into ��� values(2005,'���',10,'�븮','123-322','���� ������','02-888-9564',3000,100,'1999-07-15','����',2004);
insert into ��� values(2006,'������',20,'���','154-762','���� ���ı�','02-3369-9874',2000,'','2003-05-22','����',2005);
insert into ��� values(2007,'�ڼֹ�',30,'�븮','367-985','���� ��������','02-451-2563',3000,100,'2006-01-25','����',2004);
insert into ��� values(2008,'��ȿ��',40,'���','552-126','���� �߱�','02-447-3256',2000,'','2001-02-02','����',2007);

SELECT * FROM ���;
DESC ���;

SELECT �����, ����, �޿� FROM ��� WHERE �����ȣ=2001;

COMMIT;


SELECT * FROM CUSTOM;
DESC CUSTOM; --DATA TYPE

--CUSTOM ���̺� INSERT ��Ű�� PROCEDURE�� ������.
CREATE OR REPLACE PROCEDURE CUS_IN
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,
F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,
K VARCHAR2,L VARCHAR2,M NUMBER,N VARCHAR2)
IS
BEGIN
INSERT INTO CUSTOM VALUES (A,B,C,D,E,F,G,H,I,J,K,L,M,N);
COMMIT;
END;


EXEC CUS_IN ('A001','SUZI','123',27,'0','123-123','����',
'������','���ﵿ','010-111-2222','����','����',100,SYSDATE);

SELECT * FROM CUSTOM WHERE USERID='A001';

--CUSTOM ���̺� UPDATE ��Ű�� PROCEDURE�� ������.
CREATE OR REPLACE PROCEDURE CUS_UP
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,
F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,
K VARCHAR2,L VARCHAR2,M NUMBER,N VARCHAR2)
IS
BEGIN
UPDATE CUSTOM SET USERNAME=B,JUMIN=C,AGE=D,SEX=E,ZIP=F,ADDR1=G,
ADDR2 = H, ADDR3 = I, TEL=J,JOB=K,SCHOL=L,POINT=M,REGDATE=N
WHERE USERID = A;
COMMIT;
END;

EXEC CUS_UP ('A001','INNA','123',27,'0','123-123','����','������','���ﵿ','010-111-2222','����','����',100,SYSDATE);


SELECT * FROM CUSTOM WHERE USERID='A001';


--CUSTOM ���̺� DELETE ��Ű�� PROCEDURE�� ������.
CREATE OR REPLACE PROCEDURE CUS_DEL
(A VARCHAR2)
IS
BEGIN
DELETE CUSTOM WHERE USERID=A;
COMMIT;
END;

EXEC CUS_DEL('A001');

SELECT * FROM CUSTOM WHERE USERID='A001';


--������ ����� ������ �����ض�
CREATE OR REPLACE FUNCTION F_CUBVOL
(GILI NUMBER,POK NUMBER,NOPI NUMBER)
RETURN NUMBER
IS
BUPI NUMBER;
BEGIN
BUPI:=GILI*POK*NOPI;
RETURN BUPI;
END;

SELECT F_CUBVOL(4,7,8) BUPI FROM DUAL;

CREATE OR REPLACE FUNCTION F_NAME
(NAME IN VARCHAR2)
RETURN VARCHAR2
IS
NA VARCHAR2(8);
BEGIN
NA:=SUBSTR(NAME,-2);
RETURN NA;
END;
/

SELECT F_NAME('��������') NAME FROM DUAL;



SELECT F_NAME(USERNAME) FROM CUSTOM WHERE ADDR1='���ֵ�';

COL NAME FORMAT A8;

SELECT F_NAME(USERNAME) NAME FROM CUSTOM WHERE ADDR1='���ֵ�';


SELECT
FLOOR(MONTHS_BETWEEN(SYSDATE,'2002-06-01')/12) || '��' ||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,'2002-06-01'),12)) || '����'
FROM DUAL;


CREATE OR REPLACE FUNCTION F_SDAY
(V_DATE IN DATE)
RETURN VARCHAR2
IS
GUNDATE VARCHAR2(20);
BEGIN
GUNDATE:=
FLOOR(MONTHS_BETWEEN(SYSDATE,V_DATE)/12)||'��'||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,V_DATE),12))||'����';
RETURN GUNDATE;
END;
/

SELECT USERNAME,REGDATE,F_SDAY(REGDATE) GUNDATE
FROM CUSTOM
WHERE ADDR1 = '���ֵ�';

COL GUNDATE FORMAT A20;
SELECT USERNAME,REGDATE,F_SDAY(REGDATE) GUNDATE
FROM CUSTOM
WHERE ADDR1 = '���ֵ�';

CREATE OR REPLACE FUNCTION F_GENDER
(V_JUMIN IN VARCHAR2)
RETURN VARCHAR2
IS
GENDER VARCHAR2(2);
BEGIN
GENDER:=SUBSTR(V_JUMIN,8,1);
IF GENDER IN('1','3') THEN
GENDER := '��';
ELSE
GENDER := '��';
END IF;
RETURN GENDER;
END;
/

COL GENDER FORMAT A16;
SELECT USERNAME, JUMIN,F_GENDER(JUMIN) GENDER
FROM CUSTOM WHERE ADDR1='���ֵ�';

CREATE OR REPLACE FUNCTION F_PAYGRADE
(V_PAY IN NUMBER)
RETURN VARCHAR2
IS
RESULT VARCHAR2(20);
BEGIN
IF V_PAY>2500000 THEN
RESULT:='A';
ELSIF V_PAY>2000000 THEN
RESULT:='B';
ELSIF V_PAY>1500000 THEN
RESULT:='C';
ELSIF V_PAY>1000000 THEN
RESULT:='D';
ELSE
RESULT:='E';
END IF;
RETURN RESULT;
END;
/


COL PAYGRADE FORMAT A8;
SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'���'PAYGRADE
FROM COMPANY WHERE USERID='XA9776';

COL PAYGRADE FORMAT A8;
SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'���'PAYGRADE
FROM COMPANY WHERE USERID='ye8802';


--LOOP (WHILE��)
CREATE TABLE TEST2
(NO NUMBER,
NAME VARCHAR2(9) DEFAULT 'ȫ�浿');


DECLARE
V_COUNT NUMBER(2):=1;
BEGIN
LOOP
INSERT INTO TEST2(NO) VALUES(V_COUNT);
V_COUNT:=V_COUNT+1;
EXIT WHEN V_COUNT>10;
END LOOP;
DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
END;
/

SELECT * FROM TEST2;


CREATE OR REPLACE PROCEDURE P_FOR
IS
BEGIN
FOR I IN 11..30 LOOP
INSERT INTO TEST2(NO) VALUES(I);
COMMIT;
END LOOP;
END;
/

EXEC P_FOR;

SELECT * FROM TEST2;

CREATE OR REPLACE PROCEDURE P_WHILE
(V_START NUMBER, V_END NUMBER)
IS
CNT NUMBER:=V_START;
TOT NUMBER:=0;
BEGIN
WHILE CNT<=V_END LOOP
TOT:=TOT+CNT;
CNT:=CNT+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE(TO_CHAR(V_START)||'���� '||TO_CHAR(V_END)||'������ ���� '||TO_CHAR(TOT)||'�Դϴ�';
END;
/


CREATE OR REPLACE PROCEDURE EXE_TEST
IS
SW_REC ���%ROWTYPE;
BEGIN
SELECT * INTO SW_REC FROM ���;
DBMS_OUTPUT.PUT_LINE('������ �˻� ����!!');
EXCEPTION
WHEN TOO_MANY_ROWS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
WHEN NO_DATA_FOUND THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�.');
WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/



CREATE OR REPLACE PROCEDURE PAY_VALIDATE
(V_SANO ���.�����ȣ%TYPE)
IS

NOT_ENOUGH_PAY EXCEPTION;

SW_REC ���%ROWTYPE;

BEGIN

SELECT * FROM ���;

SELECT * INTO SW_REC FROM ��� WHERE �����ȣ = V_SANO;

IF SW_REC.�޿� >= 3000 THEN
DBMS_OUTPUT.PUT_LINE('�޿��� 3000�̻� ������');

ELSIF SW_REC.�޿� < 3000 THEN
RAISE NOT_ENOUGH_PAY;

ELSE
DBMS_OUTPUT.PUT_LINE('�޿��� �̻���');
END IF;

EXCEPTION

WHEN NOT_ENOUGH_PAY THEN
RAISE_APPLICATION_ERROR(-20001,'�޿��� ������� ����');
END;
/






















