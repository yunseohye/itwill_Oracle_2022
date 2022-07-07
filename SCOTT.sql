--SCOTT
--[22/07/04 ����]
SELECT * FROM TAB; -- ���̺� ���Ͷ�

--1. EMP TABLE�� ��� ������ ����ض�.
SELECT * FROM EMP;
--�����ȣ �̸� �� �Ŵ��� �Ի��� ���� ���ʽ� �μ���ȣ

--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >= 3000;

--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7782;
 
--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.
SELECT ENAME,JOB,HIREDATE FROM EMP 
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01' ORDER BY HIREDATE ASC;

SELECT ENAME,JOB,HIREDATE FROM EMP
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.
SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME ASC;
 

--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.
SELECT ENAME AS Employee, SAL AS "Monthly Salary",
DEPTNO FROM EMP WHERE SAL >=1500 AND DEPTNO IN(10,30);
 
SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP
WHERE SAL >=1500 AND DEPTNO IN(10,30); 

--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE HIREDATE LIKE '82%';


--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE COMM IS NOT NULL;
 

--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT ENAME,SAL,COMM FROM EMP WHERE COMM > SAL*1.1;

SELECT * FROM EMP
WHERE NVL(COMM,0) >= SAL * 1.1; 

--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰�, �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP 
WHERE JOB IN('CLERK' , 'ANALYST') AND SAL NOT IN(1000,3000,5000);
 
--11. EMP ���̺��� (�̸��� L�� �� �ڰ� �ְ�(AND) �μ��� 30�̰ų�) �Ǵ�(OR) �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP 
WHERE (ENAME LIKE '%LL%' AND DEPTNO = 30) OR MGR = 7782;

SELECT * FROM EMP
WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR=7782);


--[22/07/05 ����]
--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD') "Current Date" FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YY-MM-DD') "Current Date" FROM DUAL;
SELECT SYSDATE "Current Date" FROM DUAL;
 

--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",
(SAL*0.15) INCREASE  FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,ROUND(SAL*1.15) "New Salary", 
ROUND(SAL*0.15) INCREASE  FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",
(SAL*1.15-SAL) "Increase" FROM EMP;
 
SELECT * FROM EMP; 
--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,TO_CHAR(HIREDATE,'YYYY-MM-DD') HIREDATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'������'),'YYYY-MM-DD') "CHOICE DATE" FROM EMP;

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'������') FROM EMP;
--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))
||'����' "�ٹ� ���� ��",SAL, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL
||'��' "�޿� �� �հ�" FROM EMP;
 
SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))����,
SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) �޿��Ѱ� 
FROM EMP;
--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.

--Dream Salary ��Ī���� �Ʒ� ����� ������ || ���

------------------------------------------------------------

--KING earns $5,000.00 monthly but wants $15,000.00(����*3)

--BLAKE earns $2,850.00 monthly but wants $8,550.00

--CLARK earns $2,450.00 monthly but wants $7,350.00

--. . . . . . . . . .

--14 rows selected
 
SELECT ENAME ||'  earns' || TO_CHAR(SAL,'$99,999.99') 
||' monthly but wants'|| TO_CHAR(SAL*3,'$99,999.99') AS "Dream Salary"
 FROM EMP; 

--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME ,RPAD((SAL),15,'*') "SAL NUMBER" FROM EMP; 
 
SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;
--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,JOB,TO_CHAR(HIREDATE,'YYYY-MM-DD') HIREDATE,
TO_CHAR(HIREDATE,'DAY') DAY FROM EMP;

SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "�Ի����"
FROM EMP; 
 
 
--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� (LENGTH)����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP
WHERE LENGTH(ENAME)>=6;
 
SELECT ENAME,LENGTH(ENAME) ���ڼ�, JOB FROM EMP
WHERE LENGTH(ENAME) >=6; 

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,JOB,SAL,NVL(COMM,0), (SAL+NVL(COMM,0)) TOT FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) ���޾�  FROM EMP;

--[22/07/06 ����]
SELECT * FROM EMP;
--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT COUNT(*) �ο���, MAX(SAL) "�ִ� �޿�"
,MIN(SAL)"�ּ� �޿�",SUM(SAL) "�޿��� ��" FROM EMP;

--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB, MAX(SAL) �ִ�޿�,MIN(SAL) �ּұ޿�, SUM(SAL) �޿��հ� FROM EMP
GROUP BY JOB;

--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB, COUNT(JOB) FROM EMP
GROUP BY JOB;

SELECT JOB,COUNT(*) �ο��� FROM EMP
GROUP BY JOB; 

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT MAX(SAL) - MIN(SAL) �޿����� FROM EMP;

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)
SELECT DISTINCT TO_CHAR(HIREDATE,'YY') "H_YEAR", COUNT(*),
MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY');

--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)


--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

--[22/07/07 ����]
--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP; 
SELECT * FROM TAB;
SELECT * FROM DEPT;

SELECT ENAME �̸� , EMP.DEPTNO �μ���ȣ, DNAME �μ���
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO; 

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME �̸�,JOB ����, SAL �޿� , DEPT.DNAME �μ��� ,DEPT.LOC ��ġ
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO(+) AND DEPT.LOC = 'NEW YORK';
 

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT EMP.ENAME �̸�, DEPT.DNAME �μ���, DEPT.LOC ��ġ
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND (EMP.COMM>0 OR EMP.COMM IS NOT NULL);
 

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME �̸�, JOB ����, B.DNAME �μ���, B.LOC ��ġ
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.ENAME LIKE '%L%';

--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
SELECT A.ENAME EMPLOYEE, A.EMPNO Emp#, B.ENAME Manager ,A.MGR Mgr#
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO(+);

SELECT * FROM EMP;
--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT A.ENAME �̸�, A.HIREDATE �Ի���,
B.ENAME "������ �̸�", B.HIREDATE "������ �Ի���"
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO 
AND A.HIREDATE < B.HIREDATE;

 
SELECT * FROM EMP;
SELECT * FROM DEPT;
--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.
--KING������� �޿��� 1300? * 1���� 100 ->  *�� 13�� ���´�.

SELECT ENAME || '       ' || RPAD('*',(SAL/100),'*') "Employee and their salary"
FROM EMP;


