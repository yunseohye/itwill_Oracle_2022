--SCOTT
--[22/07/04 숙제]
SELECT * FROM TAB; -- 테이블 나와라

--1. EMP TABLE의 모든 내용을 출력해라.
SELECT * FROM EMP;
--사원번호 이름 잡 매니저 입사일 월급 보너스 부서번호

--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >= 3000;

--3. EMP 테이블에서 사원번호가 7782인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7782;
 
--4. EMP 테이블에서 입사일이 February 20, 1981과 May 1, 1981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.
SELECT ENAME,JOB,HIREDATE FROM EMP 
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01' ORDER BY HIREDATE ASC;

SELECT ENAME,JOB,HIREDATE FROM EMP
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.
SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME ASC;
 

--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.
SELECT ENAME AS Employee, SAL AS "Monthly Salary",
DEPTNO FROM EMP WHERE SAL >=1500 AND DEPTNO IN(10,30);
 
SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP
WHERE SAL >=1500 AND DEPTNO IN(10,30); 

--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE HIREDATE LIKE '82%';


--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE COMM IS NOT NULL;
 

--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.
SELECT ENAME,SAL,COMM FROM EMP WHERE COMM > SAL*1.1;

SELECT * FROM EMP
WHERE NVL(COMM,0) >= SAL * 1.1; 

--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고, 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP 
WHERE JOB IN('CLERK' , 'ANALYST') AND SAL NOT IN(1000,3000,5000);
 
--11. EMP 테이블에서 (이름에 L이 두 자가 있고(AND) 부서가 30이거나) 또는(OR) 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP 
WHERE (ENAME LIKE '%LL%' AND DEPTNO = 30) OR MGR = 7782;

SELECT * FROM EMP
WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR=7782);


--[22/07/05 숙제]
--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD') "Current Date" FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YY-MM-DD') "Current Date" FROM DUAL;
SELECT SYSDATE "Current Date" FROM DUAL;
 

--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.
SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",
(SAL*0.15) INCREASE  FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,ROUND(SAL*1.15) "New Salary", 
ROUND(SAL*0.15) INCREASE  FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",
(SAL*1.15-SAL) "Increase" FROM EMP;
 
SELECT * FROM EMP; 
--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME,TO_CHAR(HIREDATE,'YYYY-MM-DD') HIREDATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'월요일'),'YYYY-MM-DD') "CHOICE DATE" FROM EMP;

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'월요일') FROM EMP;
--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))
||'개월' "근무 개월 수",SAL, ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL
||'원' "급여 총 합계" FROM EMP;
 
SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))월수,
SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) 급여총계 
FROM EMP;
--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.

--Dream Salary 별칭으로 아래 모양을 디자인 || 사용

------------------------------------------------------------

--KING earns $5,000.00 monthly but wants $15,000.00(월급*3)

--BLAKE earns $2,850.00 monthly but wants $8,550.00

--CLARK earns $2,450.00 monthly but wants $7,350.00

--. . . . . . . . . .

--14 rows selected
 
SELECT ENAME ||'  earns' || TO_CHAR(SAL,'$99,999.99') 
||' monthly but wants'|| TO_CHAR(SAL*3,'$99,999.99') AS "Dream Salary"
 FROM EMP; 

--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME ,RPAD((SAL),15,'*') "SAL NUMBER" FROM EMP; 
 
SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;
--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME,JOB,TO_CHAR(HIREDATE,'YYYY-MM-DD') HIREDATE,
TO_CHAR(HIREDATE,'DAY') DAY FROM EMP;

SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "입사요일"
FROM EMP; 
 
 
--8. EMP 테이블에서 이름의 길이가 6자 이상인 (LENGTH)사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP
WHERE LENGTH(ENAME)>=6;
 
SELECT ENAME,LENGTH(ENAME) 글자수, JOB FROM EMP
WHERE LENGTH(ENAME) >=6; 

--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME,JOB,SAL,NVL(COMM,0), (SAL+NVL(COMM,0)) TOT FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) 지급액  FROM EMP;

--[22/07/06 숙제]
SELECT * FROM EMP;
--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
SELECT COUNT(*) 인원수, MAX(SAL) "최대 급여"
,MIN(SAL)"최소 급여",SUM(SAL) "급여의 합" FROM EMP;

--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.
SELECT JOB, MAX(SAL) 최대급여,MIN(SAL) 최소급여, SUM(SAL) 급여합계 FROM EMP
GROUP BY JOB;

--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.
SELECT JOB, COUNT(JOB) FROM EMP
GROUP BY JOB;

SELECT JOB,COUNT(*) 인원수 FROM EMP
GROUP BY JOB; 

--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.
SELECT MAX(SAL) - MIN(SAL) 급여차액 FROM EMP;

--5. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(group by)
SELECT DISTINCT TO_CHAR(HIREDATE,'YY') "H_YEAR", COUNT(*),
MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY');

--6. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum)


--7. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.

--[22/07/07 숙제]
--1. EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM EMP; 
SELECT * FROM TAB;
SELECT * FROM DEPT;

SELECT ENAME 이름 , EMP.DEPTNO 부서번호, DNAME 부서명
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO; 

--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME 이름,JOB 업무, SAL 급여 , DEPT.DNAME 부서명 ,DEPT.LOC 위치
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO(+) AND DEPT.LOC = 'NEW YORK';
 

--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력하는 SELECT 문장을 작성하여라.
SELECT EMP.ENAME 이름, DEPT.DNAME 부서명, DEPT.LOC 위치
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND (EMP.COMM>0 OR EMP.COMM IS NOT NULL);
 

--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME 이름, JOB 업무, B.DNAME 부서명, B.LOC 위치
FROM EMP A, DEPT B
WHERE A.DEPTNO = B.DEPTNO
AND A.ENAME LIKE '%L%';

--5. 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(관리자가 없는 King을 포함하여 모든 사원을 출력)
SELECT A.ENAME EMPLOYEE, A.EMPNO Emp#, B.ENAME Manager ,A.MGR Mgr#
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO(+);

SELECT * FROM EMP;
--6. EMP 테이블에서 그들의 관리자 보다 먼저 입사한 사원에 대하여 이름,입사일,관리자 이름, 관리자 입사일을 출력하는 SELECT 문장을 작성하여라.
SELECT A.ENAME 이름, A.HIREDATE 입사일,
B.ENAME "관리자 이름", B.HIREDATE "관리자 입사일"
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO 
AND A.HIREDATE < B.HIREDATE;

 
SELECT * FROM EMP;
SELECT * FROM DEPT;
--7. EMP 테이블에서 사원의 급여와 사원의 급여 양만큼 “*”를 출력하는 SELECT 문장을 작성하여라. 단 “*”는 100을 의미한다.
--KING사용자의 급여가 1300? * 1개당 100 ->  *이 13개 나온다.

SELECT ENAME || '       ' || RPAD('*',(SAL/100),'*') "Employee and their salary"
FROM EMP;


