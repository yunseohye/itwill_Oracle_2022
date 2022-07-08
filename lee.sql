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




