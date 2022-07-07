
--Kim
--(22.07.01)
SELECT * FROM Tab;

SELECT * FROM PERSONNEL;
-- '*'�� �� : Personnel�� ���� ��� Column�� �����Ͷ�

/*
SQL (Structured Query Languge : ����ȭ�� ���� ���)
ANSI ǥ�� (American National Standards Institute)

1. Query
   Select Data�˻���

2. Dml(Data Maipulation Language)
    Insert, Update, Delete
    
3. Ddl(Data Difinition Language)
    Create, Alter, Drop, Rename
    
4. Tcl(Transaction Control Language)
    Commit, Rollback
    
5. Dcl(Data Control Language)
    Grant, Revoke
    ������ �ο��� ��: Grant ���� To 
    ������ ��Ż�� ��: Revoke ���� From
    
Grant Conn To Kim/Revoke Conn From Kim  
�̷������� ���常 �ٸ��� �ϴ����� �Ȱ���
Ŵ���� ������ �ش� / Ŵ���κ��� ������ ��Ż�ϰڴ�~
*/

Select Pno, Job, Pay From PERSONNEL; 	
--Personnel�ȿ��� �� 3���� �׸� �ض�

Select Pay,Pno,Job From PERSONNEL;
--���� ������� ��ҹ��� ���� �������

Select DISTINCT Job From PERSONNEL;
--DISTINCT: �ߺ��� ����
--�̷��� ���еǾ����� ������ Job�� ����
--Distinct�� Job�̶�� Column�� �����ϴ� ���̴�.

Select Job From PERSONNEL;

SELECT * FROM PERSONNEL;

Select * From PERSONNEL ORDER By Pay Asc; 
--Order By ������ ��Ű�ڴ� Asc ������������ Desc ������������

Select * From PERSONNEL Order By Pay;

Select * From PERSONNEL Order By PAY Desc; --��������
--Desc�� �����ϸ� ���������� �ȴ�.

--(22.07.04)
--[��Ī �Է��ϱ�]
SELECT PNO,PNAME,PAY,PAY+1000 As ���ʽ� From PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� From PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "�� �� ��" From PERSONNEL;
/*
: ��� �÷��� ��Ī�� �ټ� �ִ�. �÷��� �ڿ� �̸��� �ָ� ��. 
  But ,(�޸�)�� ���� �ȵȴ�.
: Select���� ������ ������
: Pay+1000�� �Ļ� �÷��̴� DB�ȿ� ���ִ� ���� �ƴ�.
 �� ���� �ȿ��� ���� ���̴�.
: COLUMN�� �ڿ� As~~~ �ϸ� ��Ī���� ���� �� ����. As�� ������ ����
: �����ϴ� ���� ���� �ʴ�. �׷��� �ϰ� ���� ��쿡�� ����ǥ�� �ٿ��ش�.
*/

SELECT Pno ��ȣ,Pname �̸�,Pay ����,Pay+1000 ���ʽ� From PERSONNEL;

--���ʽ� ������ �������� ����
--��� 1) ��Ī �Է��ϱ�
SELECT PNO,PNAME,PAY,PAY+1000 As ���ʽ� From PERSONNEL
ORDER BY ���ʽ�;
--��� 2) �Ļ��÷��� �Է��ϱ�
SELECT PNO,PNAME,PAY,PAY+1000 As ���ʽ� From PERSONNEL
ORDER BY Pay+1000;

--4��° �÷����� �������� ��������(Desc) �����ϱ�
SELECT PNO,PNAME,PAY,PAY+1000 As ���ʽ� From PERSONNEL ORDER BY 4 DESC;

--4��°�� ���� �ִ��� �𸣱� ������ �� ������� ����. 
--�� ���������� 4��°�� MANAGER�� �ֱ� ������ �Ŵ��� ���� ����
SELECT * FROM PERSONNEL ORDER BY 4 DESC;

SELECT Dno,Pno,Pname From PERSONNEL ORDER BY Dno,Pno Desc;
--Dno�������� ������ ���� �� �Ŀ� Pno�� �������� �����Ѵ�.
--���������� Pno���� ����ȴ�. Dno�� �⺻���� ������������ ����ȴ�.

--�μ���ȣ(Dno)�� ��������, �����ȣ(Pno)�� �������� ����
SELECT * FROM PERSONNEL ORDER BY Dno, Pno Desc;

--Null
--������ ���� ���� ����.
--Null�� ������ �� ���� ������ ���� ����� ���� �ٸ���.

--Asc������ �� �������� ����
SELECT Manager From PERSONNEL ORDER BY Manager Asc;

--Desc������ Null�� ���� ū ������ �ν��� �� ó���� �����Ѵ�.
SELECT Manager From PERSONNEL ORDER BY Manager Desc;


--(����)����� �޿��� ������ ����Ͻÿ�
SELECT Pno,Pname,Pay,Pay*12 ���� FROM PERSONNEL;


--[���� ������]
SELECT Pname || Pno From PERSONNEL;

SELECT Pname || ' ' || Pno From PERSONNEL;
--�� ĭ ��� ����� ��.

SELECT * FROM PERSONNEL;
--��ĭ�� Null, 0�� ���ʽ��� ���� ���̴�. Null�� 0�� ������ �ٸ� ����.

SELECT Pno, Pname, Pay, Bonus, (Pay*12)+Bonus ���� FROM PERSONNEL;
--Null�� �����ڰ� ������ ���� Null�� ��
 
SELECT Pno, Pname, Pay, Nvl(Bonus,0), (Pay*12)+Nvl(Bonus,0) ���� FROM PERSONNEL;
--Nvl�� �Լ� ���ʽ��� ������ �״�� ǥ�����ְ� ���� Null�̸� 0���� ǥ�����ش�.
--������ Ÿ���� �ѹ��̱� ������ ���ڷ� ��µ�. ���ڴ� XID
 
--[������(Where)]
SELECT * FROM PERSONNEL;
-- '*'�� �������̶�� ��. ���� ���ϴ� �÷��� �� �� �ְ� �����ϴ� ��
-- �������� '*'�� �ݴ�� ���� ������

--(����)������ Job�� SALESMAN�� ������� 
SELECT Pno,Pname,Job FROM PERSONNEL WHERE Job='Salesman'; --���x

SELECT Pno,Pname,Job FROM PERSONNEL WHERE Job='SALESMAN'; --��� ��
--�ҹ��ڷ� �Է��ϸ� ���� ����� �ȵ� ��? Db�� �빮�ڷ� �����߱� ����

--[������]
-- =, >, >=, <, <=, <> 
--<>:�����ʴ�


--(����)�޿��� 1600�� ����� �˻��Ͻÿ�.
SELECT * FROM PERSONNEL WHERE PAY=1600;

--(����)��� ��ȣ�� 1116�� ����� �˻��ϼ���.
SELECT * FROM PERSONNEL WHERE Pno=1116;

--(����)����޿��� 2000 ������ ��� �˻�
SELECT * FROM PERSONNEL WHERE Pay<=2000;

--(����)90�� 12��17�Ͽ� �Ի��� ��� �˻�
--��¥�� ����ó�� ���־�� �Ѵ�.
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
--��¥�� �� ���� ��� �� ����� �����ϴ�.

--(����)������ CLERK�� ��� �˻�
SELECT * FROM PERSONNEL WHERE Job='CLERK';

--(����)�̸��� JAMES�� ��� �˻�
SELECT * FROM PERSONNEL WHERE Pname='JAMES';

--[�� ������]
--And, Or, NOT(�ڹٿ����� !�� ���� ����)

--[AND]
--(����)�μ���ȣ�� 10���̰� �޿��� 3000�̻��� ���
SELECT * FROM PERSONNEL WHERE Dno=10 And Pay>=3000;
--And�ڿ��� ���� �ʰ� �÷����� ǥ���ؾ��Ѵ�.
--������ ������ �� �� �ִ�.

--(����)������ SALSEMAN�̰� 90�� ���Ŀ� �Ի��� ������ ã���ÿ�.
--��� 1)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' And Startdate > '1990/12/31'; 
 
--��� 2)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' And Startdate >= '1991/01/01'; 

--(����)91�� 9���� �Ի��� ������ ã���ÿ�
SELECT * FROM PERSONNEL
Where Startdate >= '1991-09-01' And Startdate <= '1991/09/30';
--��¥�� ǥ���Ҷ��� 1990-09-01, 1990/09/01 �ΰ��� ������� ǥ�� ����
 
SELECT * From NLS_SESSION_PARAMETERS;
/*
����Ŭ�� ���ӵǾ��� �� ���õǴ� ����
�� ȸ�縶�� ������ �ٸ��� ������ �˰� ���� ���� �� ��ɾ�� �˻�
Rr/Mm/Dd - Yy�� ���н� �ý��ۿ��� Rr�� ǥ��
*/
	
--[OR]
--(����)�μ���ȣ�� 10���̰ų� �޿��� 3000�̻��� ����� ã���ÿ�.
SELECT * FROM PERSONNEL Where Dno=10 Or Pay>=3000;
 
--(����)������ MANAGER�̰ų� 90�� ������ �Ի��� ������ ã���ÿ�.
SELECT * FROM PERSONNEL
Where Job = 'MANAGER' Or Startdate<'1990/01/01';

--(����)������ SALESMAN�̰ų� CLERK�� ������ �˻��Ͻÿ�.
--��� 1)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' Or Job = 'CLERK'; 
 
--��� 2) In�̶�� ���ڿ� �����ڸ� �̿���.
SELECT * FROM PERSONNEL
Where Job In('SALESMAN', 'CLERK'); 

/*�����δ� In�� ��������� ������� Or�����ڰ� �� ����
In�� Or�� ���� �������� ������ ���� ���� ���� 
�ϳ��ϳ� �Է��ϱ� ��Ʊ� ������ ��� �󵵰� �� ����.*/
 
--[NOT]
--(����)������ SALESMAN�̰ų� CLERK�� �ƴ� ������ �˻��Ͻÿ�.
--���1)
SELECT * FROM PERSONNEL Where Job <> 'SALESMAN' And Job <> 'CLERK'; 
--������ �����̸� Or�� �ƴ� And�����ڸ� ����ؾ��Ѵ�. ������!!
 
--��� 2-1) In�̶�� ���ڿ� ������ �̿�.
--Not�� ��ġ�� �÷��� �� Or �� ��� ��ġ�ϴ� �������.
SELECT * FROM PERSONNEL Where Job Not In('SALESMAN', 'CLERK');  
   
--��� 2-2) In�̶�� ���ڿ� ������ �̿�.
--Not�� ��ġ�� �÷��� �� Or �� ��� ��ġ�ϴ� �������.
SELECT * FROM PERSONNEL Where Not Job In('SALESMAN', 'CLERK');

--[���ڿ� ������]
--BETWEEN A AND B 
 
--(����)�޿��� 1000���� 2000�� ����� �˻��Ͻÿ�
SELECT * FROM PERSONNEL Where Pay >= 1000 And Pay <=2000;

SELECT * FROM PERSONNEL Where Pay Between 1000 And 2000;
 
SELECT * FROM PERSONNEL Where Pay Between 2000 And 1000;
--�ݴ�� ���� ������� ��ȯ���� �ʱ� ������ �̷��� ���� �ȵ�.
 
--(����)�Ի����� 1991�� 9���� ����� ã���ÿ�.
SELECT * FROM PERSONNEL
Where Startdate Between '1991-09-01' And '1991-09-30'; /*31�Ϸ� ���� ������*/
 
--(����)�μ���ȣ�� 20�� 30���̰� �ƴ� ����� ã���ÿ�
--��� 1�� 2�� ���� ������ ������ ������ �ٸ�
 
--��� 1)
SELECT * FROM PERSONNEL Where Dno Not In(20,30);
--�μ���ȣ 20��, 30�� �ΰ����� ���� ã�´�. 
--���̰� ���� ��Ȯ�ϰ� 20, 30
 
--��� 2)
SELECT * FROM PERSONNEL Where Not Dno Between 20 And 30;
--�μ���ȣ 20~30 ���̿��� ���� ã�ƿ��� ���� ���̰��� ã��

SELECT * From Division; --�μ� ��ȣ�� 10, 20, 30, 40�� �ִ� ���� �˷���
SELECT * FROM PERSONNEL;
 
--(����)�̸��� A�� ���۵Ǵ� ����� ã���ÿ�.
SELECT * FROM PERSONNEL Where Pname Like 'A%';
--Oracle������ *��� %�� ����Ѵ�.
--%�� ����� ���� �ݵ�� Like�� ����ؾ��Ѵ�!!!!!! �߿�!!!!!!
--Like '����%'; ��¥��¥ �߿��ϴ�!! ����ũ �ٺ��� ��������!
 
--�����ȣ�� 111_�� �����ϴ� ����� ã���ÿ�.
--(_����ٴ� �ڸ����� ǥ���Ѵ�. 111�ڿ� ��� ���ڰ� ���͵� ���X)
--(����)111�� �����ϴ� 4�ڸ� ���� �����ȣ�� ã�´�.
SELECT * FROM PERSONNEL Where Pno Like '111_'; 
--��Ȯ�ϰ� 4�ڸ��� ã��

--(����)�����ȣ�� 111%�� �����ϴ� ����� ã���ÿ�.
SELECT * FROM PERSONNEL Where Pno Like '111%'; 
--4�ڸ� �̻��� �����ȣ�� ã����

--(����)1__1 ����� ã���ÿ�.
SELECT * FROM PERSONNEL Where Pno Like '1__1'; 
--4�ڸ��̰� ��� ��ȣ�� ��� �͵� ���X
 
--(����)90�⵵�� �Ի��� ����� ã���ÿ�.
SELECT * FROM PERSONNEL
Where Startdate Like '90%'; 
--90���� �ϸ� ���ڸ��̱� ������ ����� �ȴ�.
 
SELECT * FROM PERSONNEL
Where Startdate Like '1990%'; 
--Nls_session_parameters���� �⺻���� 2�ڸ��� �ԷµǴ� �����̱� ������ �����Ͱ� ����� �ȵȴ�.
 
SELECT * From Nls_session_parameters;
 
SELECT * FROM PERSONNEL;
 
Insert Into PERSONNEL 
Values(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20);
--���ο� ���� �߰���.
 
Insert Into PERSONNEL
Values(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);
 
--(����)O_K�� ������ �̸� �˻�
SELECT * FROM PERSONNEL Where Pname Like '%O_K%';
 
SELECT * FROM PERSONNEL
Where Pname Like '%O\_K%' Escape '\';
--���⼭�� ���� �״���� �������,���� �״�ζ�� ���� ǥ���ϱ� ���� \�� ǥ�����ش�.
--Escape�� ���� ���ٴ� ����.
 
--[NULL]
--���̺��� �ǵ��� Null���� ���� �ʴ� ���� ����. ���� ���� �ڵ�� �ν���.
--But �ǹ������� ���� ����ϴ� ����. �̷л����δ� ������� ����� �Ѵ�.
 
--(����)MANAGER���� Null�� �����͸� ã�ƶ�.
SELECT * FROM PERSONNEL Where MANAGER = NULL; --���� X
 
SELECT * FROM PERSONNEL Where MANAGER = 'NULL'; 
--���� X, ������ ������ Null�̶�� �Է��� ���ڰ� ���� ����
 
SELECT * FROM PERSONNEL Where MANAGER Is NULL; -- ���� O
 
--(����)MANAGER���� Null�� �ƴ� �����͸� ã�ƶ�.
SELECT * FROM PERSONNEL Where MANAGER Is Not NULL;
 
--[�켱����]
--()�� ��ġ�� ���� ���� �޶��� �� ����
 
--(����) ������ MANAGER�̰� �޿��� 1500�̻��� ��� 
--�Ǵ� ������ SALESMAN�� ����� �˻��Ͻÿ�.
SELECT * FROM PERSONNEL
Where (Job = 'MANAGER' And Pay >=1500) Or Job = 'SALESMAN';
 
SELECT * FROM PERSONNEL
Where Job = 'MANAGER' And (Pay >=1500 Or Job = 'SALESMAN');
 
--������ PRESIDENT �Ǵ� SALSEMAN�̰� �޿��� 1500�̻��� ���
SELECT * FROM PERSONNEL
Where Job In('PRESIDENT','SALESMAN') And Pay>=1500;
 
--[������ �����]
Delete FROM PERSONNEL Where Pname Like 'HELLO%'; 
--HELLO�� ���۵Ǵ� ��� �̸��� ������
SELECT * FROM PERSONNEL; 
--��� Ȯ�� 12�� -> 10������ �پ��.
 
COMMIT;
/*
Ctrl+S�� �����ϸ� �����Ͷ� ���� �ȿ� ������ ��(Transaction)
But Inset, Update, Delete�� ���� ������ �� Ŀ���϶�� ��ɾ ���. 
Ŀ�� - ���̺� ,�ѹ� - ���
AutoCommit OFF�� �����Ǿ��ֱ� ������ ����� ����.
�׳� �ݱ⸦ Ŭ���ϸ� �ڵ����� �ѹ��� �ȴ�.
AutoCommit�� �ڵ����� �����صθ� ������ �� �ڵ�� ������ 
Ŀ���� �ϱ� ������ ���� �ʴ� ���� ����.
*/
 
--[�Լ�] : ��� ���� ������.
 
--[[���� �Լ�]]
--[ROUND(�ݿø��Լ�)]
SELECT ROUND(45.275,1) FROM DUAL; --45.3
/*���� �������� ������ �� �������� �����ϴ� ������
������ ���̺��� �������� �ʾƵ� ������ ���̺��� �Է��ؾ��Ѵ�.*/
 
SELECT ROUND(45.275,1) FROM PERSONNEL;
/*PERSONNEL ���̺� �ȿ� �����Ͱ� 10���� �ֱ� ������ 
���� 10���� ����� �ȴ�.*/
 
SELECT * FROM DUAL;
/*DUAL : ���� �������� ���� �۾��� ó���� �� ����.
���������� ������� �ִ� ���̸� �ȿ� �����Ͱ� �ϳ� �� ����.*/
 
--  1  2  3  4  .  5  6  7 : ����
-- -4 -3 -2 -1  0  1  2  3 : �ε��� ��, ������ -�� �д´�.
 
SELECT ROUND(45.245,1) FROM DUAL; --45.2
SELECT ROUND(45.245,-1) FROM DUAL; --50 
SELECT ROUND(45.245,0) FROM DUAL; --45
SELECT ROUND(45.245) FROM DUAL; --45
SELECT ROUND(45.545) FROM DUAL; --46
 
--���̺�� �����ؼ� ���
SELECT PNO,PNAME,PAY,ROUND(PAY,-2) PAY1 FROM PERSONNEL;
 
--[TRUNC (����)]
--�ڿ� ���� �ݿø� ���� �ʰ� ����.
SELECT TRUNC(45.245,2) FROM DUAL; --45.24
SELECT TRUNC(49.245,-1) FROM DUAL; --40
 
--���̺�� �����ؼ� ���
SELECT PNO,PNAME,PAY,TRUNC(PAY,-2) PAY1 FROM PERSONNEL;
 
--[CEIL (�ø�) : ������ ��ȯ��]
SELECT CEIL(461.21) FROM DUAL; --462
 
--[FLOOR (����) : ������ ��ȯ��]
SELECT FLOOR(461.91) FROM DUAL; --461
 
--[MOD(������)] -> JAVA������ %�� �����.
SELECT MOD(10,3) FROM DUAL; --1
 
--[ABS (���밪)] -> ���󵵰� ����.
SELECT ABS(-123) FROM DUAL; --123
 
--[SIGN (���� ����� ����� ���� 1, ������ ���� -1, �� : 0�� ��ȯ��)]
SELECT SIGN(100-20),SIGN(100-102),SIGN(100-100) FROM DUAL;
 
--[����]
SELECT POWER(2,4) FROM DUAL; -- 16
 
--[������]
SELECT SQRT(9) FROM DUAL;
 
--[[�����Լ�]]
 
--[UPPER (�ҹ��� -> �빮�ڷ� ��ȯ)]
SELECT UPPER('Oracle') FROM DUAL; -- ORACLE
 
--[LOWER (�빮�� -> �ҹ��ڷ� ��ȯ)]
SELECT LOWER('Oracle') FROM DUAL; -- Oracle

--���̺�� �����ؼ� ��� 
SELECT * FROM DIVISION WHERE DNAME= UPPER('Sales');
 
SELECT * FROM DIVISION WHERE LOWER(DNAME) = 'Sales';
 
--[INITCAP(���ڿ��� ù��° �ڸ��� �빮�ڷ� ��ȯ)]
SELECT INITCAP('Korea Fighting') FROM DUAL;
 
--[CONCAT(||�� ���� ����)] 
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME,DNO) FROM PERSONNEL;

CREATE TABLE Post (
	Seq  NUMBER  NOT NULL
	,Zipcode  VARCHAR2(10)
	,Sido  VARCHAR2(50)
	,Gugun  VARCHAR2(100)
	,Dong  VARCHAR2(100)
	,Bunji  VARCHAR2(50)
        ,PRIMARY KEY (Seq)
);

SELECT * FROM Post;

SELECT * FROM POST WHERE DONG LIKE '����%'; 

SELECT * FROM POST WHERE DONG LIKE '�ູ%'; 

SELECT SIDO || ' ' || GUGUN || ' ' || DONG AS JUSO
FROM POST WHERE DONG LIKE '�ູ%';

--[LENGTH : ������ ����]
SELECT LENGTH('KOREA') FROM DUAL; -- 5
SELECT LENGTH('KOREA FIGHTING') FROM DUAL; -- 14

--[SUBSTR] -> JAVA�� SUBSTRING�� ����
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; -- ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; -- CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; -- EF
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; -- DEFG

--[INSTR : �ε��� �� ã��]
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; --1
SELECT INSTR('ABCDEFG','A') FROM DUAL; -- 0
/*JAVA�� 0���� �����ϰ� ���� ���� -1�� ����������
ORACLE�� 1���� �����ϰ� ���� ���� 0���� ����Ѵ�.*/

--[RPAD/LPAD]
--�̸� �ڿ� 15���ڰ� ä���� �� ���� ���� ���ڴ� *�� ǥ���ض�
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL;

--�ֹι�ȣ 941010-2015368�� 941010-2******�� �ٲپ� ����ض�
SELECT RPAD(SUBSTR('941010-2015368',1,8),14,'*') �ֹι�ȣ FROM DUAL;

--[RTRIM/LTRIM]
SELECT RTRIM('ABBBBBB','B') FROM DUAL; --(������)B�� �����ض�
SELECT RTRIM('A      ',' ') FROM DUAL; --(������)������ �����ض�

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (����)B�� �����ض�

--[[��¥�Լ�]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- ���� ��¥�� �ð��� �о���

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --��¥�� ������ ������.
--SYSDATE-1 : ����,SYSDATE : ����,SYSDATE+1 : ����

--KIM����� ������� �ٹ��� ����� ���Ͻÿ�.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '��'
��� FROM PERSONNEL WHERE PNAME = 'KIM'; --32��

/*YEAR�� 6�� 30���� �������� �ݿø��Ѵ�.*/
/*MONTH�� 16�� �������� �ݿø��Ѵ�.*/
--��¥�� ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

--��¥�� TRUNC 
SELECT STARTDATE, TRUNC(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN(���� �� ���ϱ�)
SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,'2002/06/01'))/12) DAL FROM DUAL;

--LAST_DAY(���� ���� ���ϱ�)
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT_DAY(���ƿ��� �� ���ϱ�)
SELECT NEXT_DAY(SYSDATE,'�ݿ���') FROM DUAL;

--ADD_MONTHS(���� �߰�)
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;


--(22.07.05)����
--[[��ȯ�Լ�]]
--[TO_CHAR]
--:���ڷ� �ٲ��ִ� ���
/*
MM : ��(10)
MON : �� �̸��� 3���ڷ� �Է�(MAR)
MONTH : MARCH
DD : ���� ��¥ ��(22) - �� �ڸ� �� ���
D : ���� �� �� - �� �ڸ� �� ���
DY : 3������ ���� (MON)
DAY : MONTH
RM : �θ��� �� ��
YYYY : 2022
*/

--2022-07-05����
SELECT SYSDATE, TO_CHAR(SYSDATE,'D') FROM DUAL; --���ڷ� ��� 
SELECT SYSDATE, TO_CHAR(SYSDATE,'DY') FROM DUAL; --�ѱ��ڸ� ���
SELECT SYSDATE, TO_CHAR(SYSDATE,'DAY') FROM DUAL; --~���Ϸ� ���
SELECT SYSDATE, TO_CHAR(SYSDATE,'RM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'MM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD') FROM DUAL; --���� ���� ���

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'AM HH:MI:SSSS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'PM HH:MI:SSSS') FROM DUAL;
--AM, PM�� �Է��ߴ��� ���� �ð��� �����̸� PM�� �Է��ص� ���������� ��µ�

--�� ���ڵ��� ���ڷ� �ٲ�� ������ ������ ������ �ʴ´�.
SELECT TO_CHAR(12506,'99,999') FROM DUAL; -- 12,506
SELECT TO_CHAR(12506,'099,999') FROM DUAL; -- 012,506
--6�ڸ��� �ƴ϶�� �ڸ����� ���߱����� ���ڸ��� 0�� ����ض�.
SELECT TO_CHAR(12506,'9,999') FROM DUAL; --######
--�ڸ����� ���ڶ���� #���� ǥ�õǱ� ������ �ݵ�� �ڸ��� �����ش�.
SELECT TO_CHAR(12506.99,'99,999.99') FROM DUAL;
--�ѱ������� ������� ������ �̱����� ��Ʈ�� ǥ���Ҷ� �Ҽ��� �Ʒ� �Է�

SELECT SYSDATE, TO_CHAR(SYSDATE,'DD') FROM DUAL; 
--���ڷ� ǥ�� 05
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSP') FROM DUAL; 
--����� ǥ�� FIVE
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDTH') FROM DUAL; 
--05+TH : 05TH
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSPTH') FROM DUAL; 
--DDSP(����ǥ��)+TH : FIFTH (����ǥ��)

--TO_DATE :��¥�� �ٲٴ� �� ���� ��������� �ʴ´�.
SELECT TO_DATE('22-07-06','YY-MM-DD') FROM DUAL;
--�տ� ���ڰ� ���� ��¥ �������� �ٲ�� ����
SELECT TO_DATE('22-07-06','YY-MM-DD')+1 FROM DUAL;
--��¥�� ������ �����ϱ� ������ +1���� �ȴ�.

--�ð��ٲٱ�
SELECT TO_DATE('11:05','HH24:MI')+1 FROM DUAL;
--�ð��� �����߱� ������ ������ �� ���� ù���� ����� �ȴ�.

--[TO_NUMNER]
--JAVA�� INTEGER.PARSEINT
SELECT TO_NUMBER('123')+1 FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL; --���� X
--���ڴ� ��� ������ε� ���ڷ� �ٲ� �� ����.

--[NVL]
SELECT BONUS,NVL(BONUS,0) FROM PERSONNEL;

SELECT MANAGER FROM PERSONNEL;
--���ڰ� ���ڷ� ������ �����;ȿ� �����ְ� 
--����Ʈ �ϴ� ������ ���� ������ �ٲ��ش�.(�Ļ��÷��� �ȴ�.)
SELECT MANAGER, NVL(TO_CHAR(MANAGER),'NON MANAGER') FROM PERSONNEL;

--[DECODE(IF)]
--(����)�� ����� �޿��� �μ��� 10�ΰ�� 10%, �μ��� 20�� ��� 20%
--�������� 30%�� �λ��� �� ���� ����Ͻÿ�.

SELECT PNAME,BONUS,DNO,PAY,
DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) �λ�޿� 
FROM PERSONNEL;

--�޿��� 3500 �̻��� ��쿡�� 'GOOD', �̸��� ��쿡�� 'POOR' ����Ͻÿ�.
SELECT PNAME,PAY,DECODE(SIGN(PAY-3500),-1,'POOR','GOOD') GRADE
FROM PERSONNEL;

--[[�׷��Լ�]]
--[COUNT]
--������ ���� �Լ�, BUT NULL�� ���� ���� �ʴ´�.
--�������� ���� ���� ǥ����
--������ ��� ����� �������� ���� �ϳ��� ���´�.
--���ϰ��� ��ȯ�ϴ� ������� ����.

SELECT COUNT(*) FROM PERSONNEL; -- 10
--�۽����̶�� ���̺��� �������� ������ ����ض�
SELECT COUNT(MANAGER) FROM PERSONNEL; -- 9 (NULL���� 1�� ����)
--Ư���÷�(MANAGER)�� ������ ����
SELECT COUNT(BONUS) FROM PERSONNEL; -- 3
--Ư���÷�(BONUS)�� ������ ����

SELECT * FROM PERSONNEL;

--(����)�޿��� 3000�̻��� ������� ����Ͻÿ�.
SELECT COUNT(*) FROM PERSONNEL
WHERE PAY>=3000; -- 5

--[AVG]
--(����) ������ ����� ���Ͻÿ�.
SELECT AVG(PAY) FROM PERSONNEL;

--(����) BONUS�� ����� ���Ͻÿ�.
SELECT AVG(BONUS) FROM PERSONNEL; 
--Ʋ����, ���ʽ� ���� 3�� ������ �����Ƿ� /10�� �ƴ� /3�� �� ���̴�.

SELECT * FROM PERSONNEL;

SELECT AVG(NVL(BONUS,0)) FROM PERSONNEL;
--������ ���� 10���̱� ������ /10�� ���ش�.

--[SUM]
SELECT SUM(PAY) FROM PERSONNEL;

--[MAX / MIN]
SELECT MAX(PAY), MIN(PAY) FROM PERSONNEL;

--(����)�Ի����� ���� ������ ����� ã�ƺ��ÿ�.
SELECT MIN(STARTDATE) FROM PERSONNEL;

--(����)�Ի����� ���� ������ ����� ���� ������� ����
SELECT ROUND((MAX(STARTDATE) - MIN(STARTDATE))/365) AS ���� FROM PERSONNEL;

--[[�м��Լ�]]

--(����)�μ��� ��� ���� ���ϱ�
SELECT * FROM PERSONNEL
ORDER BY DNO;

SELECT DNO,AVG(PAY) OVER (PARTITION BY DNO)
FROM PERSONNEL;
--�μ����� �����Ͽ� ����� ����

SELECT DISTINCT DNO,AVG(PAY) OVER (PARTITION BY DNO) D_AVG
FROM PERSONNEL;
--�μ����� ����� ���� �� �ߺ� �� �� �����Ͽ� ���.

SELECT DISTINCT DNO, AVG(PAY) OVER (PARTITION BY DNO) D_AVG
FROM PERSONNEL ORDER BY DNO;
--�μ����� ����� ���� �� �ߺ� �� �� �����Ͽ� �������� ���

--���� ����
SELECT PNAME, PAY, RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;
--PAY�� �������� �����Ͽ� RANK�� ���� ���� ����� ����.

--1200�� �޴� ����� ������ ���°�ΰ�?
SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT COUNT(*) FROM PERSONNEL; -- ���ϰ��� ��ȯ�ϴ� ����
SELECT PNAME FROM PERSONNEL; -- ���߰��� ��ȯ�ϴ� ����

SELECT PNAME FROM PERSONNEL WHERE PAY = 1600;
--���߰��� ��ȯ�ϴ� ����(1600�����Ͱ� 1�� ���� ������ 1���� ��µȰ�)

SELECT PNAME,MIN(STARTDATE) FROM PERSONNEL;
--PNAME : ���߰�, MIN(STARTDATE) : ���ϰ�
--���߰� ������ ���ϰ� ������ ���� ����� �� ����. ������ ���� ����

--���߰�, ���ϰ��� ���� ����� �� �ְ� �ϴ� ���(��������)
--SELECT�� �ȿ� �� �ٸ� SELECT���� ����.
--���� �Ի����� ������ ����� ������ ����Ͻÿ�.
SELECT PNO,PNAME,STARTDATE FROM PERSONNEL
WHERE STARTDATE = (SELECT MIN(STARTDATE) FROM PERSONNEL);

--(����) �μ��� ��� �޿��� ���Ͻÿ�.
--SELECT DNO, AVG(PAY) FROM PERSONNEL -- �����ϸ� ������ ����
-- DNO�� ���� ������ AVG(PAY)�� ���� 1��

SELECT DNO, AVG(PAY) FROM PERSONNEL 
GROUP BY DNO;
--�зº�, ����, ������ ����� GROUP BY�� ����Ѵ�.

--(����)������ ��ձ޿�, �ο����� ���Ͻÿ�.
SELECT JOB, ROUND(AVG(PAY)) AVG_PAY,COUNT(*) CNT FROM PERSONNEL
GROUP BY JOB;

--(����)�� �μ��� ��ձ޿��� ��ü���(2973)�޿����� 
-- ũ�� 'GOOD' ������ 'POOR'
SELECT ROUND(AVG(PAY)) FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE(SIGN(AVG(PAY) - (SELECT ROUND(AVG(PAY)) FROM PERSONNEL)),
-1,'POOR','GOOD') GRADE
FROM PERSONNEL 
GROUP BY DNO 
ORDER BY DNO ASC;

--[HAVING] : GROUP BY�� ���ǹ�
--�� �μ��� ��ձ޿��� 3000�̻��� ���� ����Ͻÿ�.
--ORDER BY �ܿ��� ��Ī�� ����� �� ���� ������ ���� �����Ϳ� �ִ�
--���� ����ؾ��Ѵ�.
SELECT DNO, AVG(PAY) FROM PERSONNEL
GROUP BY DNO
HAVING AVG(PAY) > 3000;

--����� ���� ����. ��Ī���� ���� ���Ϸ� �߱� ������ ������ ����.
SELECT DNO, AVG(PAY) D_AVG FROM PERSONNEL
GROUP BY DNO
HAVING D_AVG > 3000;

SELECT * FROM PERSONNEL;

--(����)�μ��ο��� 2���� ���� �μ��� �μ���ȣ�� �޿��� ���� ���Ͻÿ�.
SELECT DNO,COUNT(*) CNT, SUM(PAY) SUM FROM PERSONNEL
GROUP BY DNO
HAVING COUNT(*) > 2;

--[JOIN��]
--�׵����� �ϳ��� ���̺��� SELECT�� ��
--������ �ϳ� �̻��� ���̺��� SELECT
--������ 3�� ��κ� 2���� ���̺��� ���� ���ϴ� �÷��� ���� ������
--�ϳ��� ���̺��� �ΰ��� �����ؼ� ���� ���ϴ� ���� JOIN�������� �ش�ȴ�.
/*
JOIN���� ����
EQUITE JOIN(INNER JOIN) -> ���󵵰� ���� ����.
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/

SELECT * FROM PERSONNEL;
--[SELF JOIN]
--SELF JOIN�� ����� ���� ������ ��������־�� ����� ������
--���� �������� SELF JOIN�� �����̴�.
SELECT A.PNO ���, A.PNAME ����, B.PNO ���, B.PNAME ������
FROM PERSONNEL A, PERSONNEL B 
WHERE A.MANAGER = B.PNO;
--BILL - PRESIDENT

--[NON-EQUITE JOIN]
--EQUITE JOIN�� ���� �ʴ�. �̰� ���� NON-EQUITE JOIN�� ����� ����
--������ ��������־�� ����� �����ϴ�.

SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE; 
-- ���̰��� �ƴ� LOWPAY, HIGHPAY ������ ����
-- ��Ȯ�ϰ� ��ġ�ϴ� �����Ͱ� �ƴ�

SELECT PNAME, PAY, B.GRADE
FROM PERSONNEL A, PAYGRADE B
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;
--BETWEEN AND�� �̿��Ͽ� �������� ����� 
--PAY�� ���� �־� GRADE ���� �������


--[OPERATOR]
-- JOIN���� �ƴ����� JOIN�� �� �� ���´�.
-- �ΰ��� ���̺��� �����͸� �������� ����.
-- UNION�� ���󵵰� ���� ����.

-- A=[1,2,5,6]
-- B=[1,2,4]

-- A UNION ALL B = [1,2,5,6,1,2,4]
-- A UNION B = [1,2,4,5,6]
-- A MINUS B = [5,6] ����
--(A[1,2,5,6] - B[1,2,4] = [5,6]) 
-- A�� �������� �ϴ� ���̱� ������ A�� ���� B�� 4�� �����ϴ� �������� ��������
-- A INTERSECT B = [1,2] ������

--[UNION/ALL]
SELECT * FROM PERSONNEL
UNION ALL
SELECT * FROM PERSONNEL; 
--20ROWS

SELECT * FROM PERSONNEL
UNION
SELECT * FROM PERSONNEL; 
--10ROWS

--[MINUS]
SELECT DNO FROM DIVISION -- 10 20 30 40
MINUS
SELECT DNO FROM PERSONNEL; -- 10 20 30
-- 40

--[INTERSECT]
SELECT DNO FROM DIVISION -- 10 20 30 40
INTERSECT
SELECT DNO FROM PERSONNEL; -- 10 20 30
-- 10 20 30

--(22-07-06)����
--[SUBQUERY(��������)]
--�����ȿ� ������ ���ִ� ��

SELECT * FROM TAB;

CREATE TABLE MANAGER
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;

CREATE TABLE SALESMAN
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;
	
	CREATE TABLE SALESMAN1
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;
	
	SELECT * FROM SALESMAN1;

CREATE TABLE BUSEO
AS SELECT * FROM DIVISION;

CREATE TABLE SAWON
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM1
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM2
AS SELECT * FROM DIVISION;

SELECT * FROM TAB;

SELECT * FROM SALESMAN;
--������ �������� ������� ������ Ʋ�� ����ȴ�. ����ϸ� �����ʹ� ����
--Ʋ�� �����ϱ⸦ ���Ѵٸ� ������ �������� ������ָ� �ȴ�.

SELECT * FROM EXAM2;

SELECT * FROM DIVISION; 

--�÷��� ������ ���� ������ ���߾� �Է��� ��
--�����͸� DIVISION�� �־��ش�.
INSERT INTO DIVISION VALUES(50,'OPERATION','031-123-4567','DAEGU');

SELECT * FROM DIVISION; 
DESC DIVISION;

COMMIT;

--INSERT INTO DIVISION VALUES(60); 
-- ������. 60�� ���� ����� �ȿ� ��� �־������ �𸣱� ������

INSERT INTO DIVISION(DNO) VALUES(60);

--INSERT INTO DIVISION(DNAME, POSITION) VALUES ('ACCOUNT','DAEJUN');
--������ �ȵ�, DNO�� ���� ���� NULL�̵Ǹ� �ȵȴٴ� ������ ����
--BUT ���⿡���� DNO���� NULL�̶� ������ ����.

INSERT INTO DIVISION (DNO,DNAME, POSITION) VALUES (70,'ACCOUNT','DAEJUN');

DELETE FROM DIVISION 
WHERE DNO = 70;

SELECT * FROM DIVISION;

DESC PERSONNEL;

INSERT INTO PERSONNEL(PNO, PNAME, PAY, DNO)
VALUES (7711,'YOUNG',4000,20);

SELECT * FROM PERSONNEL;

DELETE FROM PERSONNEL
WHERE PNO = 7711;

COMMIT;

--����� NULL����
--���1)
INSERT INTO DIVISION VALUES(80,'PLANNING','010-123-1234',NULL);
--���2)
INSERT INTO DIVISION VALUES(90,'SERVICE','010-222-3333','');

SELECT * FROM DIVISION;

INSERT INTO PERSONNEL(PNO,PNAME,JOB,STARTDATE,DNO)
VALUES (1304,'SUZI','SINGER', SYSDATE,10);

SELECT * FROM PERSONNEL;


--[ġȯ����] -> Oracle���� �����Ѵ�.
SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO = &D_NO;
--�� �������� �����̾ȵ� �����Ϸ��� CMDâ ���
--�������� �� �޸𿡼� Ȯ���ϱ�.

--SUBQUERY�� ����ؼ� INSERT
--�����ӤӤӤӤӤ�
SELECT * FROM MANAGER; 
--�Ŵ��� ���̺��� ������ ������. ���� ���� ������ ��¿� �ƹ��͵� �ȵ�

SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER';

INSERT INTO MANAGER (PNO,PNAME,PAY,STARTDATE)
SELECT PNO,PNAME,PAY,STARTDATE
FROM PERSONNEL
WHERE JOB='MANAGER';

SELECT * FROM MANAGER;

--������ SALESMAN�� ����� ��� ������ SALESMAN���̺�� ����
SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN';

CREATE TABLE SALESMAN
AS
SELECT * FROM PERSONNEL;
--�������� �ʴ� ���̺��� CREATE�ϴ� ��ɾ�

--[UPDATE]
SELECT * FROM PERSONNEL;
SELECT * FROM PERSONNEL WHERE PNO='1111';

-- ������Ʈ�� �ݵ�� �������� �����;��Ѵ�.
-- UPDATE PERSONNEL SET DNO=30 ���� ��������� �Է� �� ����ϸ�
-- DNO�� ��� ���� 30���� ���ع�����. 

--SET ������ �ʰ� �����ϱ�!!!
UPDATE PERSONNEL SET DNO=30 WHERE PNO='1113';

UPDATE PERSONNEL SET PNAME='INNA', MANAGER=1004, 
STARTDATE=SYSDATE, PAY = 8000
WHERE PNO = '1113';

SELECT * FROM PERSONNEL;
SELECT * FROM PERSONNEL WHERE PNO='1113';

SELECT PNO, PNAME,TO_CHAR(STARTDATE,'YYYY-MM-DD') STARTDATE
FROM PERSONNEL WHERE PNO='1113';

SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20; -- ��� DNO�� 20���� ����
--UPDATE�� �� �ݵ�� SELECT�ؼ� ���� Ȯ�� �غ� �� COMMIT�� �ؾ���.

ROLLBACK; -- �߸��� ���� �������� �ǵ�����

--SUBQUERY�� UPDATE

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');						

SELECT DNO FROM DIVISION WHERE DNAME = 'SALES';
--�μ����� SALE�� ����� DNO

SELECT * FROM DIVISION;

UPDATE PERSONNEL SET JOB='SALES'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');	
--WHERE �������� ���� �ٲ�� �ȵȴ�.
--Ư�������Ϳ��� ������� ������ �� ������ Ư�������͸� ���ϴ� ������ �ٲ�

SELECT * FROM PERSONNEL;
--------------------------------------------------------------------
/*
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');��
JOIN������ �ٲ㺸�� */

SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--JOIN���̱� ������ FROM ~~~ WHERE������ �� �� ���� ����Ǹ� �ȵȴ�.

UPDATE PERSONNEL SET JOB='SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--����Ŭ�� ������Ʈ�� ���ι����� ������ �� ����. �������������� ������

ROLLBACK; -- �ٲ� ������ �ٽ� ó�� ���·� ���ư���.

----���⼭ ���� �����ϼ���!!!!!!!!!!
--[DELETE]
--������ ������ �ݵ�� �ߺ��Ǵ� ���� ���� �����ͷ� �۾��ؾ��Ѵ�.

SELECT * FROM PERSONNEL WHERE PNO=1111;
DELETE FROM PERSONNEL WHERE PNO=1111; 
--PNO�� 1111�� ����, �� ���忡�� FROM�� ������ �����ϴ�. 

SELECT * FROM PERSONNEL WHERE PNO=1112;
DELETE PERSONNEL WHERE PNO=1112; 

--SUBQUERY�� ����

SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'FINANCE');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'FINANCE');

--INSERT ERROR
SELECT * FROM PERSONNEL;

INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1113,'INNA',30);
--���ϰ� �������ǿ� ����Ǿ� ���� ������ ����.

SELECT * FROM USER_CONSTRAINTS;

--UPDATE ERROR
SELECT * FROM DIVISION; --DNO�� 10 20 30 40 50
SELECT * FROM PERSONNEL; 
SELECT * FROM TAB;
--DIVISION�� �����Ͽ� ������� ������ 
--DIVISION�� �ִ� DNO�� PERSONNEL�� �� �� �ִ�.
--DIVISION:�θ�, PERSONNEL�� �ڽ��̶�� ���� ��

UPDATE PERSONNEL SET DNO=51
WHERE DNO=20;
--�μ���ȣ 20���� 51������ �ٲܰ��̴�.
--�����ϸ� DIVISION�� ���� DNO���� ã�ƺ�
--DIVISION�� 51�� ���� ������ �� ������ ������ ����.

--DELETE ERROR
DELETE DIVISION WHERE DNO=20;
--DNO�� 20�� �ڷḦ ã��T�������� , ������
--�ڽ��� ���ڵ忡�� 20���� ���� ����ϰ� �ֱ� ������
--20���� �����Ǹ� ���͸� �����Ͱ� ��. ������ �� X

DELETE DIVISION WHERE DNO=50;
--�ڽ��� ����ϰ� ���� ���� ��ȣ�� ���� �� �ִ�. ������ ��.

COMMIT;

SELECT * FROM DIVISION;

--[TRANSACTION]
--AUTO COMMIT�� �Ǵ� ���
--DDL(CREATE, ALTER, DROP, RENAME)
--DCL(GRANT,REVOKE) ������ �ְų� ���� ��
--���������� ���Ḧ �� ���(ROLLBACK)

--DDL(CREATE,ALTER,DROP)
--CREATE�� ������� ���� �� �� : ALTER
--CREATE�� ������� ���� �� �� : DROP

--OBJECT(TABLE,INDEX,SYNONYM,SEQUENCE,VIEW)

--TABLE
--DATA TYPE
--CHAR : ���ڸ� ����(��������)
--VARCHAR2 (1�̾������� ������ 2�� ����) : ���ڸ� ����(��������)
--NUMBER(P,S) : ���ڸ� ����(��������) -> �ڸ� ������� ������ ���� �����ž�!
--DATE : ��¥,�ð��� ����(��������) 7BYTE�� ���� ����
--LONG : ����(��������, ��üũ�Ⱑ 2G, ���� ����)

CREATE TABLE BUSEO1
(DNO NUMBER(2), -- DNO�� ���ڸ����ڰ� ����.
DNAME VARCHAR(14),
ZIPCODE CHAR(7));
--AUTO COMMIT

SELECT * FROM BUSEO1;
DESC BUSEO1;
INSERT INTO BUSEO1 VALUES(10,'AAA','123-123');
SELECT * FROM BUSEO1;

--[���̺��̸�]
/*
(Ư¡)
: �ݵ�� �����ڷ� �����ؾ��Ѵ�.
: Ư�����ڴ� (_,$,#)�� ��� �����ϸ� ù���ڿ��� ����� �� ����.
: ���̺� �̸��� �ߺ��� ��������ʴ´�.
: COLUMN��� �޶�� �Ѵ�.
: ���� ����� �� ����.(INSERT, VALUE, SELECT ���) 
-> ����Ŭ�� �����̸��� �����ϰ� �̸��� ���� �� ����.
*/

--��밡���� ���̺� �̸� : SAWON, P_NO, DIV10
--���Ұ����� ���̺� �̸� : 10DIV, $SAL, ALTER(�����)

CREATE TABLE CUSINFO
(ID CHAR(5) PRIMARY KEY, ->���̵��� ���� ���� �ߺ����� �ʱ⸦ ���ϴ� ���
NAME CHAR(10),
JUMIN CHAR(14),
AGE NUMBER(3),
ADDR VARCHAR2(50)); -> �ּ��� ��

SELECT * FROM CUSINFO;
DESC CUSINFO;

INSERT INTO CUSINFO VALUES('A100','SUZI','123456-1234567',27,'����');

SELECT * FROM CUSINFO;

SELECT * FROM USER_CONSTRAINTS;

SELECT STARTDATE FROM PERSONNEL;

SELECT STARTDATE,EXTRACT(YEAR FROM STARTDATE) YEAR, --�⵵�� ����
EXTRACT(MONTH FROM STARTDATE) MONTH, --�޸� ����
EXTRACT(DAY FROM STARTDATE) DAY --�ϸ� ����
FROM PERSONNEL; 

--(22-07-07)����

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM TAB;

CREATE TABLE SALESMAN
AS
SELECT PNO, PNAME, JOB, PAY FROM PERSONNEL
WHERE JOB = 'SALESMAN';

SELECT * FROM SALESMAN1;

DESC SALESMAN1;

--(����)PERSONNEL ���̺��� ������ MANAGER�� ����� ��� ������ 
--�����Ͽ� ���ο� ���̺��� MANAGER1�� �����Ѵ�.

CREATE TABLE MANAGER1
AS
SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER1;
/*���ο� ���̺� MANAGER1�� �����Ѵ�. PERSONNEL TABLE���ִ� 
JOB COLUMN�� �����Ͱ� MANAGER�� �����͸� �����ؼ�
MANAGER1 ���̺� �����Ѵ�. */

--(����)PAY�� 3000 �̻��� ������ �����͸� ������ PAY3000���̺� �����ϱ�
CREATE TABLE PAY3000
AS
SELECT * FROM PERSONNEL
WHERE PAY >= 3000;

SELECT * FROM PAY3000;

--(����)PERSONNEL ���̺��� 12���޿� �Ի��� �������� �����͸�
--MON12��� ���̺�� �����Ͻÿ�.
CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL
WHERE TO_CHAR(STARTDATE,'MM')=12;

/*
CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL
WHERE EXTRACT(MONTH FROM STARTDATE)=12;
*/
SELECT * FROM MON12;

SELECT * FROM PERSONNEL
WHERE TO_CHAR(STARTDATE,'MM')=04;

CREATE TABLE ANALYST(NUM,NAME,JOB,DNUM)
AS
SELECT PNO, PNAME, JOB, DNO FROM PERSONNEL
WHERE JOB = 'ANALYST';

SELECT * FROM ANALYST;

--(����)�μ���ȣ�� 10�� �μ��� �� �޿� ������ DIV10���̺�� ����ÿ�
CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 10;

SELECT * FROM DIV10;

--[���̺� ���� ����]

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0 = 1; --�Ϻη� �ٸ� ���ڸ� �� �ߺ����� �ʰ� ��. FALSE���� ��

SELECT * FROM SAWON1;
--�����ͳ� ���������� ������� �ʰ� ������ ����ȴ�.

SELECT * FROM PERSONNEL;
DESC PERSONNEL;
DESC SAWON1;


--[[���̺� ����]]
SELECT * FROM SALESMAN1;

DESC SALESMAN1;

--[ADD(COLUMN �߰�)]
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2));
--�÷��� ������ �߰��� ��쿡�� �ݵ�� ��ȣ�� �÷��� �����־����

INSERT INTO SALESMAN1 VALUES (1234, 'SUZI', 'SALESMAN',3000,10); 
--L�� ���̺� �־��� ���̺���

SELECT * FROM SALESMAN1;


ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1 VALUES (4444,'INNA','SALESMAN',2000,10,'1234','1234');
-- ��ܽ� ���̺� �־��� ���̺��̴�.

ALTER TABLE SALESMAN1
ADD BIGO VARCHAR2(10) DEFAULT('AA');

--���̺��� ����鼭 Ư�� �÷��� �����̸Ӹ� Ű�� �������
CREATE TABLE CUSINFO
(ID NUMBER(3) CONSTRAINT CUSINFO_ID_PK PRIMARY KEY,
NAME CHAR(10),
BIRTH DATE DEFAULT SYSDATE);

--INSERT INTO CUSINFO VALUES (111,'SUZI');
--MS-SQL���� �̷��� �ᵵ ����� ��. BUT ORACLE������ �ȵ�

INSERT INTO CUSINFO (ID, NAME) VALUES (111,'SUZI');
--VALUES �տ� �ݵ�� �÷����� �������־�� �Ѵ�.

SELECT * FROM CUSINFO;

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED')));

SELECT * FROM SALESMAN1;

SELECT * FROM USER_CONSTRAINTS;

INSERT INTO SALESMAN1 
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SOLO');
--SALESMAN1_MARRIGE_CK����� ���� ���� ����Ǿ� ���� ������
--SINGLE�ƴϸ� MARRIED �� �� �ϳ��� ���� �Է��ؾ��Ѵ�.

INSERT INTO SALESMAN1 
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SINGLE');

DESC SALESMAN1;

--������� ���̺� �����̸Ӹ� Ű�� �������ְ� ������
--PRIMARY KEY(�÷���)�� �Է����ָ� �ȴ�.
ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;
--DICTIONARY �߿� �ϳ��� ���̺���
-- Oracle�� ���ư��� ���� ������ ����Ǵ� ��(���̺��)�� ���
--��ųʸ��� �׻� ���������̱� ������ -s�� �ٴ´�.

ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

DESC MANAGER1;
--COPY�� ���̺��̱� ������ �����̸Ӹ� Ű�� ���� ������.

SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
ADD CONSTRAINT MANAGER1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;

--[MODIFY(�÷��� ����)]
/*: �����Ͱ� ���ִ� ��쿡�� �ּҰ����� �������� �ִ� ũ�Ⱚ����
����� �����ؾ��Ѵ�.*/
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(16);
--PNAME VARCHAR2(9)�� 16�ڸ� �Է��� �� �ְ� �����Ѵ�.

SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7);
--PNAME�� �ִ� ���ڰ� 7�̱� ������ �� ���� ���ڸ� �Է��ϸ� ������ ��.

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7) NOT NULL;
--PNO�� NOT NULL�� PK���̱� ������ �ڵ����� ����
--PNAME NOT NULL�� ����ڰ� ���� NOT NULL�� ���� �־��־� ������ ��


--[DROP]
--COULMN�̳� ���������� ����
SELECT * FROM MANAGER1;
DESC MANAGER1;
--���������� PNO, PNMAE 2���� ����

--ALTER, CREATE, DROP
--ADD, MODIFY, DROP
--���� ���� ���� ALTER�� ADD, MODIFY, DROP
ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;
--DROP���� CONSTRAINT�� ���� �����;� ��.
--�̸����� ����� ���
--CONSTRAINT�ؼ� ���������� �̸��� �־� ����, �������� ����̴�.

ALTER TABLE SALESMAN1
DROP PRIMARY KEY;
--PRIMARY KEY�� ����� ���, ��� ������ 

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE DIVISION
DROP CONSTRAINT DIVISION_DNO_PK CASCADE;
--��� �����͸� �� ����� �����.
--DIVISION�� �����ϰ� �ִ� ���� �ֱ� ������ DIVISION �ϳ��� ���� �� 
--���� ������ CASCADE�� ���� ���� �� �����ϴ� ���̴�.

--[COLUMN ����]
SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;
--�����Ͱ� � �����߰� ������� �÷��� ����������.

--�Ͻ������� �����͸� �Ⱥ��̰� �ϴ� ���
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;
--���ϰ� ���� ����ڰ� ���� ���ϰ� �ؾ��ϴ� ��� �����
--��Ȱ��ȭ �Ѵٰ� �����ϸ� �ȴ�. ���� ���� �� ���� �ƴ϶� ������ ����

ALTER TABLE SALESMAN1
DROP UNUSED COLUMN;
--DB���� ������ ������ ��, ���� �Ʊ� ��Ȱ��ȭ ��Ų
--�� ������. �÷� COLUMN �ڿ� �÷����� DNO�� ���� ����
--ALTER�� DROP

SELECT * FROM DBA_UNUSED_COL_TABS;
--DBA�� �����ϴ� ���� �Ϲ� ����ڰ� �� �� ���� �����ڸ� �� �� ����
--�Ϲ� ����ڴ� USER�� ����Ѵ�.

SELECT COUNT(*) FROM DICTIONARY;
--�Ϲ� ������� DICTIONARY�� 804���̴�.

--DROP(���̺� ����) 
--CREATE�� ���� ���� ����

SELECT * FROM TAB;
SELECT * FROM TABS; -- �� �� ���� ���̺��� ������ ��µȴ�.

DROP TABLE SALESMAN1; --���̺� ����

SELECT * FROM TAB;
--���̺� ���� �� ����ϸ� SALESMAN1;�ڸ��� ������ ���� ���´�.

SELECT * FROM RECYCLEBIN;
--�����Ⱚ�� ����ϴ� ��ɾ�

FLASHBACK TABLE "BIN$DeenBX1OQNykX8Oaw/0gCg==$0" TO BEFORE DROP;
--�������� �� �ٽ� �������� ���1) OBJECT�� ���

FLASHBACK TABLE SALESMAN1 TO BEFORE DROP;
--�������� �� �ٽ� �������� ���2) COLUMN�� ���

SELECT * FROM "BIN$GmUvwQFoS9+rTKXUmPCAFQ==$0";
--���� �����뿡 �־ �����ʹ� ����� �ȴ�.

SELECT * FROM TAB;

PURGE RECYCLEBIN;
--���̺��� ������ ����

DROP TABLE MANAGER1; --������ ���� �ƴϰ� �����뿡 �� ����

DROP TABLE MANAGER1 PURGE; --������ ����, ������ �Ұ���

DROP TABLE SALESMAN11 PURGE;

COMMIT; --������� �����
--���� �ؿ����͵����Ͱ� �߸��Ǿ� �ѹ��ϸ� ���⼭ ���� ����Ǵ� ����

--[���ڵ� ����]
--TRUNCATE / DELETE

--[DELETE]
SELECT * FROM CUSINFO;

DELETE CUSINFO;
--CUSINFO�� ������ ����
--DELETE�� ����Ǵ� ���� �ٷ� Ʈ�������� ���۵�.

SELECT * FROM CUSINFO;
--�����Ͱ� ������

ROLLBACK;
--�ǵ�����

SELECT * FROM CUSINFO;
--�����Ͱ� �ٽ� ����� �ȴ�.


--[TRUNCATE] (DROP�� ���)
--�򰥸��� �ʰ� ����

TRUNCATE TABLE CUSINFO;
--CUSINFO�� ���ڵ带 ����

SELECT * FROM CUSINFO;
--���ڵ� ���� ���� �Ǿ� ���

ROLLBACK;
--�ǵ�����

SELECT * FROM CUSINFO;
--�ǵ����� ��ɾ �Է��ص� ���� �� ���� �ٽ� ���ƿ��� �ʴ´�.
--������ �����ع����� ������ �������� �ʴ´�.
--TRUNCATE�� Ʈ�������� ������ �ȵǴ� ����. (ROLLBACK�� ��� �Ұ�)

--[RENAME](���̺��� �̸� ����)
--�÷��� ���� ���̺� ���� ���� ��
SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;
--�̸��� �����ϰ� �� �Ŀ� ������ ������ ���� �˻��ϸ� ������ ����.

--[COMMENT]
--: �ּ�ó���ϴ� ����
SELECT * FROM USER_TAB_COMMENTS;
--��ųʸ�, �����̱� ������ -S�� ����

COMMENT ON TABLE HIGHPAY
IS '���� ���� �޴� ���';
--HIGH PAY�� COMMENTS ���� ���� �޴� ����̶�� ������ ��µ�.

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON TABLE HIGHPAY
IS '';
--�ּ� ó�� �� �� ����

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON COLUMN HIGHPAY.PAY
IS '�� ���� �ݾ�';

SELECT * FROM USER_COL_COMMENTS;

SELECT * FROM HIGHPAY;

COMMENT ON COLUMN HIGHPAY.BONUS
IS '���� ���ʽ� ����.';

SELECT * FROM USER_COL_COMMENTS;

--[DCL] (GRANT, REVOKE)
/* ����ڴ� ��� �Ұ�, SYS���� ��� ����
GRANT : USER(�����)�� OBJECT(CREATE�� ������ �� �ִ� �͵�)��
������ �ο��� �� ����Ѵ�. 
REVOKE : USER(�����)�� OBJECT(CREATE�� ������ �� �ִ� �͵�)��
������ ȸ��, ��Ż�� �� ����Ѵ�.
*/

CREATE USER YOUNG
IDENTIFIED BY YOUNG
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--KIM���Ե� ������ ������ �� �ִ� ������ �����.

--OBJECT����
--�Ϲ� ����ڰ� �ִ°��̱� ������ SYS���� �Ұ����ϴ�.
-- �Ϲ� ������� KIM���� �����Ѵ�.
GRANT SELECT ON PERSONNEL TO TEST;
GRANT SELECT,INSERT,DELETE ON DIVISION TO TEST;
--KIM�� TEST��� �������� ������ �� ����.
--UPDATE������ ���� �ʾұ� ������ �� �� ����.

SELECT * FROM USER_TAB_PRIVS_MADE;
--KIM���� � ������ ����� Ȯ���� �� �ִ� ��ųʸ�

--���� �������
REVOKE SELECT ON PERSONNEL FROM TEST;
--�׽�Ʈ ���ѿ��� PERSONNEL�� ����Ʈ �� �� �ִ� ������ ����ðž�
SELECT * FROM USER_TAB_PRIVS_MADE;
--������ ���� ���� Ȯ���ϴ� �ڵ�

REVOKE SELECT ON DIVISION FROM TEST;
--SELECT�ϴ� ������ ����
REVOKE INSERT ON DIVISION FROM TEST;
--INSET�ϴ� ������ ����
REVOKE DELETE ON DIVISION FROM TEST;
--DELETE�ϴ� ������ ����
SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE SELECT,INSERT,DELETE ON DIVISION FROM TEST;
--�ѹ��� �����Ű�� �ʹٸ� �ڵ带 ������ �Է��ϰ� �����Ѵ�.
--SELECT�ϰ� �����ϰ� INSERT�ϰ� �����Ϸ��ϸ� SELECT�� �̹�
--������ �����̱� ������ ����� �ȵǰ� ������ ����.

CREATE ROLE MANAGER;
--CREATE ROLE ������ ���� ������ ������ ���� �ʴ´�.

CREATE ROLE KIMOBJ;
--ROLE ����

GRANT SELECT,INSERT,DELETE ON DIVISION TO KIMOBJ;
--ON DIVISION���̺��� ������ KIMOBJ���� �־��� ����.

GRANT KIMOBJ TO lee;
--LEE���� KIMOBJ�� ������ �Ѱ���

SELECT * FROM ROLE_SYS_PRIVS;
SELECT * FROM USER_ROLE_PRIVS; --KIM�� ������ �ִ� ROLE


--[��������] (CONSTRAINT)
--: ���̺� ���鶧 ������ �ʿ��ϴ�. ������ ���� ���� DB��
--: ���Ἲ(������ ����� �Ѵ�.)
/*
PRIMARY KEY(PK)
FOREIGN KEY(FK)
UNIQUE KEY(UK)
NOT NULL(NN)
CHECK KEY(CK)
*/
--DEFAULT ����Ŭ������ �������ǿ� ����x MS-SQL���� ���Ե�.


























































































