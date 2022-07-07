
--Kim
--(22.07.01)
SELECT * FROM Tab;

SELECT * FROM PERSONNEL;
-- '*'의 뜻 : Personnel로 부터 모든 Column을 가져와라

/*
SQL (Structured Query Languge : 구조화된 질의 언어)
ANSI 표준 (American National Standards Institute)

1. Query
   Select Data검색어

2. Dml(Data Maipulation Language)
    Insert, Update, Delete
    
3. Ddl(Data Difinition Language)
    Create, Alter, Drop, Rename
    
4. Tcl(Transaction Control Language)
    Commit, Rollback
    
5. Dcl(Data Control Language)
    Grant, Revoke
    권한을 부여할 때: Grant 권한 To 
    권한을 박탈할 때: Revoke 권한 From
    
Grant Conn To Kim/Revoke Conn From Kim  
이런식으로 문장만 다르고 하는짓은 똑같음
킴한테 권한을 준다 / 킴으로부터 권한을 박탈하겠다~
*/

Select Pno, Job, Pay From PERSONNEL; 	
--Personnel안에서 저 3가지 항목만 해라

Select Pay,Pno,Job From PERSONNEL;
--순서 상관없고 대소문자 구분 상관없음

Select DISTINCT Job From PERSONNEL;
--DISTINCT: 중복값 제거
--이러면 구분되어지는 각각의 Job만 나옴
--Distinct은 Job이라는 Column을 수식하는 것이다.

Select Job From PERSONNEL;

SELECT * FROM PERSONNEL;

Select * From PERSONNEL ORDER By Pay Asc; 
--Order By 정렬을 시키겠다 Asc 오름차순으로 Desc 내림차순으로

Select * From PERSONNEL Order By Pay;

Select * From PERSONNEL Order By PAY Desc; --내림차순
--Desc를 생략하면 오름차순이 된다.

--(22.07.04)
--[별칭 입력하기]
SELECT PNO,PNAME,PAY,PAY+1000 As 보너스 From PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 보너스 From PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "보 너 스" From PERSONNEL;
/*
: 모든 컬럼에 별칭을 줄수 있다. 컬럼명 뒤에 이름을 주면 됨. 
  But ,(콤마)는 쓰면 안된다.
: Select문은 연산이 가능함
: Pay+1000은 파생 컬럼이다 DB안에 들어가있는 것이 아님.
 이 쿼리 안에서 만들어낸 것이다.
: COLUMN명 뒤에 As~~~ 하면 별칭으로 만들 수 있음. As는 생략이 가능
: 띄어쓰기하는 것은 좋지 않다. 그래도 하고 싶은 경우에는 따옴표로 붙여준다.
*/

SELECT Pno 번호,Pname 이름,Pay 월급,Pay+1000 보너스 From PERSONNEL;

--보너스 순으로 오름차순 정렬
--방법 1) 별칭 입력하기
SELECT PNO,PNAME,PAY,PAY+1000 As 보너스 From PERSONNEL
ORDER BY 보너스;
--방법 2) 파생컬럼명 입력하기
SELECT PNO,PNAME,PAY,PAY+1000 As 보너스 From PERSONNEL
ORDER BY Pay+1000;

--4번째 컬럼명을 기준으로 내림차순(Desc) 정렬하기
SELECT PNO,PNAME,PAY,PAY+1000 As 보너스 From PERSONNEL ORDER BY 4 DESC;

--4번째에 뭐가 있는지 모르기 때문에 잘 사용하진 않음. 
--이 예제에서는 4번째에 MANAGER가 있기 때문에 매니저 기준 정렬
SELECT * FROM PERSONNEL ORDER BY 4 DESC;

SELECT Dno,Pno,Pname From PERSONNEL ORDER BY Dno,Pno Desc;
--Dno기준으로 정렬을 먼저 한 후에 Pno를 기준으로 정렬한다.
--내림차순은 Pno에만 적용된다. Dno는 기본값인 오름차순으로 적용된다.

--부서번호(Dno)는 오름차순, 사원번호(Pno)는 내림차순 정렬
SELECT * FROM PERSONNEL ORDER BY Dno, Pno Desc;

--Null
--데이터 값이 없는 것임.
--Null은 연산할 수 없는 값으로 정렬 방식이 각각 다르다.

--Asc에서는 맨 마지막에 정렬
SELECT Manager From PERSONNEL ORDER BY Manager Asc;

--Desc에서는 Null을 가장 큰 값으로 인식해 맨 처음에 정렬한다.
SELECT Manager From PERSONNEL ORDER BY Manager Desc;


--(예제)사원의 급여와 연봉을 출력하시오
SELECT Pno,Pname,Pay,Pay*12 연봉 FROM PERSONNEL;


--[연결 연산자]
SELECT Pname || Pno From PERSONNEL;

SELECT Pname || ' ' || Pno From PERSONNEL;
--한 칸 띄고 출력이 됨.

SELECT * FROM PERSONNEL;
--빈칸은 Null, 0은 보너스가 없는 것이다. Null과 0은 엄연히 다른 것임.

SELECT Pno, Pname, Pay, Bonus, (Pay*12)+Bonus 연봉 FROM PERSONNEL;
--Null과 연산자가 만나면 값이 Null이 됨
 
SELECT Pno, Pname, Pay, Nvl(Bonus,0), (Pay*12)+Nvl(Bonus,0) 연봉 FROM PERSONNEL;
--Nvl은 함수 보너스가 있으면 그대로 표현해주고 값이 Null이면 0으로 표시해준다.
--데이터 타입이 넘버이기 때문에 숫자로 출력됨. 문자는 XID
 
--[조건절(Where)]
SELECT * FROM PERSONNEL;
-- '*'를 열제한이라고 함. 내가 원하는 컬럼만 볼 수 있게 제한하는 것
-- 조건절은 '*'과 반대로 행을 제한함

--(예제)행제한 Job의 SALESMAN만 출력해줘 
SELECT Pno,Pname,Job FROM PERSONNEL WHERE Job='Salesman'; --출력x

SELECT Pno,Pname,Job FROM PERSONNEL WHERE Job='SALESMAN'; --출력 ㅇ
--소문자로 입력하면 값이 출력이 안됨 왜? Db를 대문자로 저장했기 때문

--[연산자]
-- =, >, >=, <, <=, <> 
--<>:같지않다


--(예제)급여가 1600인 사원을 검색하시오.
SELECT * FROM PERSONNEL WHERE PAY=1600;

--(예제)사원 번호가 1116인 사원을 검색하세요.
SELECT * FROM PERSONNEL WHERE Pno=1116;

--(예제)사원급여가 2000 이하인 사원 검색
SELECT * FROM PERSONNEL WHERE Pay<=2000;

--(예제)90년 12월17일에 입사한 사원 검색
--날짜는 문자처리 해주어야 한다.
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
--날짜는 두 가지 방법 다 사용이 가능하다.

--(예제)업무가 CLERK인 사원 검색
SELECT * FROM PERSONNEL WHERE Job='CLERK';

--(예제)이름이 JAMES인 사원 검색
SELECT * FROM PERSONNEL WHERE Pname='JAMES';

--[논리 연산자]
--And, Or, NOT(자바에서의 !와 같은 역할)

--[AND]
--(예제)부서번호가 10번이고 급여가 3000이상인 사원
SELECT * FROM PERSONNEL WHERE Dno=10 And Pay>=3000;
--And뒤에도 잊지 않고 컬럼명을 표기해야한다.
--조건을 여러개 줄 수 있다.

--(예제)직업이 SALSEMAN이고 90년 이후에 입사한 직원을 찾으시오.
--방법 1)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' And Startdate > '1990/12/31'; 
 
--방법 2)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' And Startdate >= '1991/01/01'; 

--(예시)91년 9월에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
Where Startdate >= '1991-09-01' And Startdate <= '1991/09/30';
--날짜를 표기할때는 1990-09-01, 1990/09/01 두가지 방법으로 표기 가능
 
SELECT * From NLS_SESSION_PARAMETERS;
/*
오라클에 접속되었을 때 세팅되는 정보
각 회사마다 서식이 다르기 때문에 알고 싶을 때는 이 명령어로 검색
Rr/Mm/Dd - Yy를 유닉스 시스템에서 Rr로 표기
*/
	
--[OR]
--(예시)부서번호가 10번이거나 급여가 3000이상인 사원을 찾으시오.
SELECT * FROM PERSONNEL Where Dno=10 Or Pay>=3000;
 
--(예시)직업이 MANAGER이거나 90년 이전에 입사한 직원을 찾으시오.
SELECT * FROM PERSONNEL
Where Job = 'MANAGER' Or Startdate<'1990/01/01';

--(예시)업무가 SALESMAN이거나 CLERK인 직원을 검색하시오.
--방법 1)
SELECT * FROM PERSONNEL
Where Job = 'SALESMAN' Or Job = 'CLERK'; 
 
--방법 2) In이라는 문자열 연산자를 이용함.
SELECT * FROM PERSONNEL
Where Job In('SALESMAN', 'CLERK'); 

/*실제로는 In을 사용하지만 빠르기는 Or연산자가 더 빠름
In은 Or에 비해 느리지만 데이터 값이 많을 때는 
하나하나 입력하기 어렵기 때문에 사용 빈도가 더 높다.*/
 
--[NOT]
--(예시)업무가 SALESMAN이거나 CLERK이 아닌 직원을 검색하시오.
--방법1)
SELECT * FROM PERSONNEL Where Job <> 'SALESMAN' And Job <> 'CLERK'; 
--양쪽이 부정이면 Or이 아닌 And연산자를 사용해야한다. 무조건!!
 
--방법 2-1) In이라는 문자열 연산자 이용.
--Not의 위치는 컬럼명 앞 Or 뒤 어디에 위치하던 상관없다.
SELECT * FROM PERSONNEL Where Job Not In('SALESMAN', 'CLERK');  
   
--방법 2-2) In이라는 문자열 연산자 이용.
--Not의 위치는 컬럼명 앞 Or 뒤 어디에 위치하던 상관없다.
SELECT * FROM PERSONNEL Where Not Job In('SALESMAN', 'CLERK');

--[문자열 연산자]
--BETWEEN A AND B 
 
--(예시)급여가 1000에서 2000인 사원을 검색하시오
SELECT * FROM PERSONNEL Where Pay >= 1000 And Pay <=2000;

SELECT * FROM PERSONNEL Where Pay Between 1000 And 2000;
 
SELECT * FROM PERSONNEL Where Pay Between 2000 And 1000;
--반대로 쓰면 결과값을 반환하지 않기 때문에 이렇게 쓰면 안됨.
 
--(예시)입사일이 1991년 9월일 사람을 찾으시오.
SELECT * FROM PERSONNEL
Where Startdate Between '1991-09-01' And '1991-09-30'; /*31일로 쓰면 에러남*/
 
--(예시)부서번호가 20과 30사이가 아닌 사원을 찾으시오
--방법 1과 2의 값은 같지만 쿼리는 엄연히 다름
 
--방법 1)
SELECT * FROM PERSONNEL Where Dno Not In(20,30);
--부서번호 20번, 30번 두개에서 값을 찾는다. 
--사이값 없이 정확하게 20, 30
 
--방법 2)
SELECT * FROM PERSONNEL Where Not Dno Between 20 And 30;
--부서번호 20~30 사이에서 값을 찾아오는 것임 사이값을 찾음

SELECT * From Division; --부서 번호는 10, 20, 30, 40이 있는 것을 알려줌
SELECT * FROM PERSONNEL;
 
--(예시)이름이 A로 시작되는 사원을 찾으시오.
SELECT * FROM PERSONNEL Where Pname Like 'A%';
--Oracle에서는 *대신 %를 사용한다.
--%를 사용할 때는 반드시 Like를 사용해야한다!!!!!! 중요!!!!!!
--Like '문자%'; 진짜진짜 중요하다!! 라이크 바보는 되지말자!
 
--사원번호가 111_로 시작하는 사원을 찾으시오.
--(_언더바는 자릿수를 표시한다. 111뒤에 어떠한 숫자가 나와도 상관X)
--(예시)111로 시작하는 4자리 수의 사원번호를 찾는다.
SELECT * FROM PERSONNEL Where Pno Like '111_'; 
--정확하게 4자리를 찾음

--(예시)사원번호가 111%로 시작하는 사원을 찾으시오.
SELECT * FROM PERSONNEL Where Pno Like '111%'; 
--4자리 이상의 사원번호를 찾아줌

--(예시)1__1 사원을 찾으시오.
SELECT * FROM PERSONNEL Where Pno Like '1__1'; 
--4자리이고 가운데 번호는 어떤게 와도 상관X
 
--(예시)90년도에 입사한 사원을 찾으시오.
SELECT * FROM PERSONNEL
Where Startdate Like '90%'; 
--90으로 하면 두자리이기 때문에 출력이 된다.
 
SELECT * FROM PERSONNEL
Where Startdate Like '1990%'; 
--Nls_session_parameters에서 기본값이 2자리로 입력되는 설정이기 때문에 데이터가 출력이 안된다.
 
SELECT * From Nls_session_parameters;
 
SELECT * FROM PERSONNEL;
 
Insert Into PERSONNEL 
Values(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20);
--새로운 정보 추가함.
 
Insert Into PERSONNEL
Values(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);
 
--(예시)O_K를 포함한 이름 검색
SELECT * FROM PERSONNEL Where Pname Like '%O_K%';
 
SELECT * FROM PERSONNEL
Where Pname Like '%O\_K%' Escape '\';
--여기서는 문자 그대로의 언더바임,문자 그대로라는 것을 표기하기 위해 \를 표기해준다.
--Escape는 값을 뺀다는 뜻임.
 
--[NULL]
--테이블에는 되도록 Null값을 넣지 않는 것이 좋다. 좋지 않은 코드로 인식함.
--But 실무에서는 많이 사용하는 편임. 이론상으로는 사용하지 말라고 한다.
 
--(예시)MANAGER값이 Null인 데이터를 찾아라.
SELECT * FROM PERSONNEL Where MANAGER = NULL; --실행 X
 
SELECT * FROM PERSONNEL Where MANAGER = 'NULL'; 
--실행 X, 문법은 맞지만 Null이라고 입력한 문자가 없기 때문
 
SELECT * FROM PERSONNEL Where MANAGER Is NULL; -- 실행 O
 
--(예시)MANAGER값이 Null이 아닌 데이터를 찾아라.
SELECT * FROM PERSONNEL Where MANAGER Is Not NULL;
 
--[우선순위]
--()의 위치에 따라 값이 달라질 수 있음
 
--(예시) 업무가 MANAGER이고 급여가 1500이상이 사원 
--또는 업무가 SALESMAN인 사원을 검색하시오.
SELECT * FROM PERSONNEL
Where (Job = 'MANAGER' And Pay >=1500) Or Job = 'SALESMAN';
 
SELECT * FROM PERSONNEL
Where Job = 'MANAGER' And (Pay >=1500 Or Job = 'SALESMAN');
 
--업무가 PRESIDENT 또는 SALSEMAN이고 급여가 1500이상인 사원
SELECT * FROM PERSONNEL
Where Job In('PRESIDENT','SALESMAN') And Pay>=1500;
 
--[데이터 지우기]
Delete FROM PERSONNEL Where Pname Like 'HELLO%'; 
--HELLO로 시작되는 모든 이름을 지워라
SELECT * FROM PERSONNEL; 
--결과 확인 12명 -> 10명으로 줄어듦.
 
COMMIT;
/*
Ctrl+S로 저장하면 데이터라 파일 안에 저장이 됨(Transaction)
But Inset, Update, Delete가 들어가면 종료할 때 커밋하라는 명령어가 뜬다. 
커밋 - 세이브 ,롤백 - 취소
AutoCommit OFF로 설정되어있기 때문에 물어보는 것임.
그냥 닫기를 클릭하면 자동으로 롤백이 된다.
AutoCommit을 자동으로 실행해두면 에러가 난 코드들 까지도 
커밋을 하기 때문에 하지 않는 것이 좋다.
*/
 
--[함수] : 어떠한 값을 돌려줌.
 
--[[숫자 함수]]
--[ROUND(반올림함수)]
SELECT ROUND(45.275,1) FROM DUAL; --45.3
/*실제 존재하지 않지만 이 순간에만 연산하는 데이터
실제로 테이블이 존재하지 않아도 무조건 테이블을 입력해야한다.*/
 
SELECT ROUND(45.275,1) FROM PERSONNEL;
/*PERSONNEL 테이블 안에 데이터가 10개가 있기 때문에 
값이 10개가 출력이 된다.*/
 
SELECT * FROM DUAL;
/*DUAL : 실제 존재하지 않은 작업을 처리할 때 쓴다.
내부적으로 만들어져 있는 것이며 안에 데이터가 하나 들어가 있음.*/
 
--  1  2  3  4  .  5  6  7 : 숫자
-- -4 -3 -2 -1  0  1  2  3 : 인덱스 값, 정수는 -로 읽는다.
 
SELECT ROUND(45.245,1) FROM DUAL; --45.2
SELECT ROUND(45.245,-1) FROM DUAL; --50 
SELECT ROUND(45.245,0) FROM DUAL; --45
SELECT ROUND(45.245) FROM DUAL; --45
SELECT ROUND(45.545) FROM DUAL; --46
 
--테이블과 연결해서 사용
SELECT PNO,PNAME,PAY,ROUND(PAY,-2) PAY1 FROM PERSONNEL;
 
--[TRUNC (절삭)]
--뒤에 값을 반올림 하지 않고 버림.
SELECT TRUNC(45.245,2) FROM DUAL; --45.24
SELECT TRUNC(49.245,-1) FROM DUAL; --40
 
--테이블과 연결해서 사용
SELECT PNO,PNAME,PAY,TRUNC(PAY,-2) PAY1 FROM PERSONNEL;
 
--[CEIL (올림) : 정수만 반환함]
SELECT CEIL(461.21) FROM DUAL; --462
 
--[FLOOR (내림) : 정수만 반환함]
SELECT FLOOR(461.91) FROM DUAL; --461
 
--[MOD(나머지)] -> JAVA에서는 %로 사용함.
SELECT MOD(10,3) FROM DUAL; --1
 
--[ABS (절대값)] -> 사용빈도가 적다.
SELECT ABS(-123) FROM DUAL; --123
 
--[SIGN (연산 결과가 양수일 때는 1, 음수일 때는 -1, 영 : 0을 반환함)]
SELECT SIGN(100-20),SIGN(100-102),SIGN(100-100) FROM DUAL;
 
--[지수]
SELECT POWER(2,4) FROM DUAL; -- 16
 
--[제곱근]
SELECT SQRT(9) FROM DUAL;
 
--[[문자함수]]
 
--[UPPER (소문자 -> 대문자로 변환)]
SELECT UPPER('Oracle') FROM DUAL; -- ORACLE
 
--[LOWER (대문자 -> 소문자로 변환)]
SELECT LOWER('Oracle') FROM DUAL; -- Oracle

--테이블과 연결해서 사용 
SELECT * FROM DIVISION WHERE DNAME= UPPER('Sales');
 
SELECT * FROM DIVISION WHERE LOWER(DNAME) = 'Sales';
 
--[INITCAP(문자열의 첫번째 자리를 대문자로 변환)]
SELECT INITCAP('Korea Fighting') FROM DUAL;
 
--[CONCAT(||과 같은 역할)] 
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

SELECT * FROM POST WHERE DONG LIKE '역삼%'; 

SELECT * FROM POST WHERE DONG LIKE '행복%'; 

SELECT SIDO || ' ' || GUGUN || ' ' || DONG AS JUSO
FROM POST WHERE DONG LIKE '행복%';

--[LENGTH : 문자의 개수]
SELECT LENGTH('KOREA') FROM DUAL; -- 5
SELECT LENGTH('KOREA FIGHTING') FROM DUAL; -- 14

--[SUBSTR] -> JAVA의 SUBSTRING과 동일
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; -- ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; -- CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; -- EF
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; -- DEFG

--[INSTR : 인덱스 값 찾기]
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; --1
SELECT INSTR('ABCDEFG','A') FROM DUAL; -- 0
/*JAVA는 0부터 시작하고 없는 값은 -1을 보여주지만
ORACLE은 1부터 시작하고 없는 값은 0으로 출력한다.*/

--[RPAD/LPAD]
--이름 뒤에 15글자가 채워질 때 까지 남는 글자는 *로 표시해라
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL;

--주민번호 941010-2015368를 941010-2******로 바꾸어 출력해라
SELECT RPAD(SUBSTR('941010-2015368',1,8),14,'*') 주민번호 FROM DUAL;

--[RTRIM/LTRIM]
SELECT RTRIM('ABBBBBB','B') FROM DUAL; --(오른쪽)B를 삭제해라
SELECT RTRIM('A      ',' ') FROM DUAL; --(오른쪽)공백을 삭제해라

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (왼쪽)B를 삭제해라

--[[날짜함수]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- 현재 날짜와 시간을 읽어줌

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --날짜도 연산이 가능함.
--SYSDATE-1 : 어제,SYSDATE : 오늘,SYSDATE+1 : 내일

--KIM사원이 현재까지 근무한 년수를 구하시오.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '년'
년수 FROM PERSONNEL WHERE PNAME = 'KIM'; --32년

/*YEAR는 6월 30일을 기준으로 반올림한다.*/
/*MONTH는 16일 기준으로 반올림한다.*/
--날짜의 ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

--날짜의 TRUNC 
SELECT STARTDATE, TRUNC(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN(달의 수 구하기)
SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,'2002/06/01'))/12) DAL FROM DUAL;

--LAST_DAY(달의 말일 구하기)
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT_DAY(돌아오는 날 구하기)
SELECT NEXT_DAY(SYSDATE,'금요일') FROM DUAL;

--ADD_MONTHS(개월 추가)
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;


--(22.07.05)기준
--[[변환함수]]
--[TO_CHAR]
--:문자로 바꿔주는 기능
/*
MM : 달(10)
MON : 달 이름을 3문자로 입력(MAR)
MONTH : MARCH
DD : 일의 날짜 수(22) - 두 자리 수 출력
D : 주의 일 수 - 한 자리 수 출력
DY : 3문자의 요일 (MON)
DAY : MONTH
RM : 로마식 달 수
YYYY : 2022
*/

--2022-07-05기준
SELECT SYSDATE, TO_CHAR(SYSDATE,'D') FROM DUAL; --숫자로 출력 
SELECT SYSDATE, TO_CHAR(SYSDATE,'DY') FROM DUAL; --한글자만 출력
SELECT SYSDATE, TO_CHAR(SYSDATE,'DAY') FROM DUAL; --~요일로 출력
SELECT SYSDATE, TO_CHAR(SYSDATE,'RM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'MM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY-MM-DD') FROM DUAL; --가장 많이 사용

SELECT SYSDATE, TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'AM HH:MI:SSSS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'PM HH:MI:SSSS') FROM DUAL;
--AM, PM을 입력했더라도 현재 시간이 오전이면 PM을 입력해도 오전값으로 출력됨

--이 숫자들은 문자로 바꿨기 때문에 연산이 되지는 않는다.
SELECT TO_CHAR(12506,'99,999') FROM DUAL; -- 12,506
SELECT TO_CHAR(12506,'099,999') FROM DUAL; -- 012,506
--6자리가 아니라면 자리값을 맞추기위해 빈자리에 0을 출력해라.
SELECT TO_CHAR(12506,'9,999') FROM DUAL; --######
--자리값이 모자랄경우 #으로 표시되기 때문에 반드시 자리값 맞춰준다.
SELECT TO_CHAR(12506.99,'99,999.99') FROM DUAL;
--한국에서는 사용하지 않지만 미국에서 센트를 표시할때 소수점 아래 입력

SELECT SYSDATE, TO_CHAR(SYSDATE,'DD') FROM DUAL; 
--숫자로 표현 05
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSP') FROM DUAL; 
--영어로 표현 FIVE
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDTH') FROM DUAL; 
--05+TH : 05TH
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSPTH') FROM DUAL; 
--DDSP(영어표현)+TH : FIFTH (서수표현)

--TO_DATE :날짜를 바꾸는 것 많이 사용하지는 않는다.
SELECT TO_DATE('22-07-06','YY-MM-DD') FROM DUAL;
--앞에 문자가 뒤의 날짜 형식으로 바뀌는 것임
SELECT TO_DATE('22-07-06','YY-MM-DD')+1 FROM DUAL;
--날짜는 연산이 가능하기 때문에 +1일이 된다.

--시간바꾸기
SELECT TO_DATE('11:05','HH24:MI')+1 FROM DUAL;
--시간만 기입했기 때문에 무조건 그 달의 첫날로 출력이 된다.

--[TO_NUMNER]
--JAVA의 INTEGER.PARSEINT
SELECT TO_NUMBER('123')+1 FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL; --실행 X
--문자는 어떠한 방법으로도 숫자로 바꿀 수 없다.

--[NVL]
SELECT BONUS,NVL(BONUS,0) FROM PERSONNEL;

SELECT MANAGER FROM PERSONNEL;
--문자가 숫자로 나열된 데이터안에 들어갈수있게 
--셀렉트 하는 순간에 값의 형질을 바꿔준다.(파생컬럼이 된다.)
SELECT MANAGER, NVL(TO_CHAR(MANAGER),'NON MANAGER') FROM PERSONNEL;

--[DECODE(IF)]
--(예시)각 사원의 급여를 부서가 10인경우 10%, 부서가 20인 경우 20%
--나머지는 30%를 인상한 후 값을 출력하시오.

SELECT PNAME,BONUS,DNO,PAY,
DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) 인상급여 
FROM PERSONNEL;

--급여가 3500 이상인 경우에는 'GOOD', 미만인 경우에는 'POOR' 출력하시오.
SELECT PNAME,PAY,DECODE(SIGN(PAY-3500),-1,'POOR','GOOD') GRADE
FROM PERSONNEL;

--[[그룹함수]]
--[COUNT]
--개수를 세는 함수, BUT NULL의 값은 세지 않는다.
--데이터의 개수 값만 표현함
--때문에 출력 결과는 데이터의 개수 하나만 나온다.
--단일값을 반환하는 쿼리라고 말함.

SELECT COUNT(*) FROM PERSONNEL; -- 10
--퍼스널이라는 테이블의 데이터의 개수를 출력해라
SELECT COUNT(MANAGER) FROM PERSONNEL; -- 9 (NULL값이 1개 있음)
--특정컬럼(MANAGER)의 개수를 세라
SELECT COUNT(BONUS) FROM PERSONNEL; -- 3
--특정컬럼(BONUS)의 개수를 세라

SELECT * FROM PERSONNEL;

--(예시)급여가 3000이상인 사원수를 출력하시오.
SELECT COUNT(*) FROM PERSONNEL
WHERE PAY>=3000; -- 5

--[AVG]
--(예시) 월급의 평균을 구하시오.
SELECT AVG(PAY) FROM PERSONNEL;

--(예시) BONUS의 평균을 구하시오.
SELECT AVG(BONUS) FROM PERSONNEL; 
--틀린값, 보너스 값을 3명만 가지고 있으므로 /10이 아닌 /3을 한 값이다.

SELECT * FROM PERSONNEL;

SELECT AVG(NVL(BONUS,0)) FROM PERSONNEL;
--데이터 값을 10명이기 때문에 /10을 해준다.

--[SUM]
SELECT SUM(PAY) FROM PERSONNEL;

--[MAX / MIN]
SELECT MAX(PAY), MIN(PAY) FROM PERSONNEL;

--(예제)입사한지 가장 오래된 사원을 찾아보시오.
SELECT MIN(STARTDATE) FROM PERSONNEL;

--(예제)입사한지 가장 오래된 사원과 신입 사원과의 연차
SELECT ROUND((MAX(STARTDATE) - MIN(STARTDATE))/365) AS 년차 FROM PERSONNEL;

--[[분석함수]]

--(예제)부서별 평균 월급 구하기
SELECT * FROM PERSONNEL
ORDER BY DNO;

SELECT DNO,AVG(PAY) OVER (PARTITION BY DNO)
FROM PERSONNEL;
--부서별로 구분하여 평균을 구함

SELECT DISTINCT DNO,AVG(PAY) OVER (PARTITION BY DNO) D_AVG
FROM PERSONNEL;
--부서별로 평균을 구한 후 중복 된 값 삭제하여 출력.

SELECT DISTINCT DNO, AVG(PAY) OVER (PARTITION BY DNO) D_AVG
FROM PERSONNEL ORDER BY DNO;
--부서별로 평균을 구한 후 중복 된 값 삭제하여 내림차순 출력

--월급 순위
SELECT PNAME, PAY, RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;
--PAY로 오름차순 정렬하여 RANK에 값을 덮어 씌우는 것임.

--1200을 받는 사원의 순위는 몇번째인가?
SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT COUNT(*) FROM PERSONNEL; -- 단일값을 반환하는 쿼리
SELECT PNAME FROM PERSONNEL; -- 다중값을 반환하는 쿼리

SELECT PNAME FROM PERSONNEL WHERE PAY = 1600;
--다중값을 반환하는 쿼리(1600데이터가 1개 였기 때문에 1개만 출력된것)

SELECT PNAME,MIN(STARTDATE) FROM PERSONNEL;
--PNAME : 다중값, MIN(STARTDATE) : 단일값
--다중값 쿼리와 단일값 쿼리는 같이 사용할 수 없다. 실행이 되지 않음

--다중값, 단일값을 같이 사용할 수 있게 하는 방법(하위쿼리)
--SELECT문 안에 또 다른 SELECT문이 있음.
--가장 입사일이 오래된 사람의 정보를 출력하시오.
SELECT PNO,PNAME,STARTDATE FROM PERSONNEL
WHERE STARTDATE = (SELECT MIN(STARTDATE) FROM PERSONNEL);

--(예제) 부서별 평균 급여를 구하시오.
--SELECT DNO, AVG(PAY) FROM PERSONNEL -- 실행하면 에러가 생김
-- DNO는 값이 여러개 AVG(PAY)는 값이 1개

SELECT DNO, AVG(PAY) FROM PERSONNEL 
GROUP BY DNO;
--학력별, 성별, 직업별 등등은 GROUP BY를 사용한다.

--(예제)직업별 평균급여, 인원수를 구하시오.
SELECT JOB, ROUND(AVG(PAY)) AVG_PAY,COUNT(*) CNT FROM PERSONNEL
GROUP BY JOB;

--(예제)각 부서의 평균급여가 전체평균(2973)급여보다 
-- 크면 'GOOD' 작으면 'POOR'
SELECT ROUND(AVG(PAY)) FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE(SIGN(AVG(PAY) - (SELECT ROUND(AVG(PAY)) FROM PERSONNEL)),
-1,'POOR','GOOD') GRADE
FROM PERSONNEL 
GROUP BY DNO 
ORDER BY DNO ASC;

--[HAVING] : GROUP BY의 조건문
--각 부서별 평균급여가 3000이상인 값을 출력하시오.
--ORDER BY 외에는 별칭을 사용할 수 없기 때문에 실제 데이터에 있는
--값을 사용해야한다.
SELECT DNO, AVG(PAY) FROM PERSONNEL
GROUP BY DNO
HAVING AVG(PAY) > 3000;

--출력이 되지 않음. 별칭으로 값을 비교하려 했기 때문에 에러가 난다.
SELECT DNO, AVG(PAY) D_AVG FROM PERSONNEL
GROUP BY DNO
HAVING D_AVG > 3000;

SELECT * FROM PERSONNEL;

--(예제)부서인원이 2명보다 많은 부서의 부서번호와 급여의 합을 구하시오.
SELECT DNO,COUNT(*) CNT, SUM(PAY) SUM FROM PERSONNEL
GROUP BY DNO
HAVING COUNT(*) > 2;

--[JOIN문]
--그동안은 하나의 테이블에서 SELECT를 함
--이제는 하나 이상의 테이블에서 SELECT
--많으면 3개 대부분 2개의 테이블에서 내가 원하는 컬럼의 값을 가져옴
--하나의 테이블을 두개로 복사해서 값을 비교하는 것은 JOIN문에서만 해당된다.
/*
JOIN문의 종류
EQUITE JOIN(INNER JOIN) -> 사용빈도가 가장 높다.
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/

SELECT * FROM PERSONNEL;
--[SELF JOIN]
--SELF JOIN을 만들기 위한 구조가 만들어져있어야 출력이 가능함
--가장 전형적인 SELF JOIN의 예제이다.
SELECT A.PNO 사번, A.PNAME 직원, B.PNO 사번, B.PNAME 관리자
FROM PERSONNEL A, PERSONNEL B 
WHERE A.MANAGER = B.PNO;
--BILL - PRESIDENT

--[NON-EQUITE JOIN]
--EQUITE JOIN이 같지 않다. 이것 역시 NON-EQUITE JOIN을 만들기 위한
--구조가 만들어져있어야 출력이 가능하다.

SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE; 
-- 사이값도 아닌 LOWPAY, HIGHPAY 각각의 값임
-- 정확하게 일치하는 데이터가 아님

SELECT PNAME, PAY, B.GRADE
FROM PERSONNEL A, PAYGRADE B
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;
--BETWEEN AND를 이용하여 범위값을 만들어 
--PAY의 값을 넣어 GRADE 값을 만들어줌


--[OPERATOR]
-- JOIN문은 아니지만 JOIN을 할 때 나온다.
-- 두개의 테이블에서 데이터를 가져오는 것임.
-- UNION이 사용빈도가 제일 높다.

-- A=[1,2,5,6]
-- B=[1,2,4]

-- A UNION ALL B = [1,2,5,6,1,2,4]
-- A UNION B = [1,2,4,5,6]
-- A MINUS B = [5,6] 빼기
--(A[1,2,5,6] - B[1,2,4] = [5,6]) 
-- A를 기준으로 하는 것이기 때문에 A에 없는 B의 4는 절삭하는 개념으로 생각하자
-- A INTERSECT B = [1,2] 교집합

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

--(22-07-06)기준
--[SUBQUERY(하위쿼리)]
--쿼리안에 쿼리가 들어가있는 것

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
--조건을 거짓으로 만들었기 때문에 틀만 복사된다. 출력하면 데이터는 없음
--틀만 복사하기를 원한다면 조건을 거짓으로 만들어주면 된다.

SELECT * FROM EXAM2;

SELECT * FROM DIVISION; 

--컬럼의 갯수와 들어가는 갯수를 맞추어 입력한 후
--데이터를 DIVISION에 넣어준다.
INSERT INTO DIVISION VALUES(50,'OPERATION','031-123-4567','DAEGU');

SELECT * FROM DIVISION; 
DESC DIVISION;

COMMIT;

--INSERT INTO DIVISION VALUES(60); 
-- 에러남. 60의 값을 디비전 안에 어디에 넣어야할지 모르기 때문에

INSERT INTO DIVISION(DNO) VALUES(60);

--INSERT INTO DIVISION(DNAME, POSITION) VALUES ('ACCOUNT','DAEJUN');
--실행이 안됨, DNO의 값이 절대 NULL이되면 안된다는 조건이 있음
--BUT 여기에서는 DNO값이 NULL이라 에러가 난다.

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

--명시적 NULL삽입
--방법1)
INSERT INTO DIVISION VALUES(80,'PLANNING','010-123-1234',NULL);
--방법2)
INSERT INTO DIVISION VALUES(90,'SERVICE','010-222-3333','');

SELECT * FROM DIVISION;

INSERT INTO PERSONNEL(PNO,PNAME,JOB,STARTDATE,DNO)
VALUES (1304,'SUZI','SINGER', SYSDATE,10);

SELECT * FROM PERSONNEL;


--[치환변수] -> Oracle에만 존재한다.
SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO = &D_NO;
--이 툴에서는 실행이안됨 실행하려면 CMD창 사용
--수업들은 것 메모에서 확인하기.

--SUBQUERY를 사용해서 INSERT
--물어보기ㅣㅣㅣㅣㅣㅣ
SELECT * FROM MANAGER; 
--매니저 테이블을 위에서 생성함. 값은 없기 때문에 출력에 아무것도 안됨

SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER';

INSERT INTO MANAGER (PNO,PNAME,PAY,STARTDATE)
SELECT PNO,PNAME,PAY,STARTDATE
FROM PERSONNEL
WHERE JOB='MANAGER';

SELECT * FROM MANAGER;

--업무가 SALESMAN인 사원의 모든 정보를 SALESMAN테이블로 복사
SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN';

CREATE TABLE SALESMAN
AS
SELECT * FROM PERSONNEL;
--존재하지 않는 테이블을 CREATE하는 명령어

--[UPDATE]
SELECT * FROM PERSONNEL;
SELECT * FROM PERSONNEL WHERE PNO='1111';

-- 업데이트는 반드시 웨어절이 딸려와야한다.
-- UPDATE PERSONNEL SET DNO=30 만약 여기까지만 입력 후 출력하면
-- DNO의 모든 값이 30으로 변해버린다. 

--SET 빼먹지 않게 유의하기!!!
UPDATE PERSONNEL SET DNO=30 WHERE PNO='1113';

UPDATE PERSONNEL SET PNAME='INNA', MANAGER=1004, 
STARTDATE=SYSDATE, PAY = 8000
WHERE PNO = '1113';

SELECT * FROM PERSONNEL;
SELECT * FROM PERSONNEL WHERE PNO='1113';

SELECT PNO, PNAME,TO_CHAR(STARTDATE,'YYYY-MM-DD') STARTDATE
FROM PERSONNEL WHERE PNO='1113';

SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20; -- 모든 DNO가 20으로 변함
--UPDATE할 때 반드시 SELECT해서 값을 확인 해본 후 COMMIT을 해야함.

ROLLBACK; -- 잘못된 값을 이전으로 되돌리기

--SUBQUERY로 UPDATE

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');						

SELECT DNO FROM DIVISION WHERE DNAME = 'SALES';
--부서명이 SALE인 사람의 DNO

SELECT * FROM DIVISION;

UPDATE PERSONNEL SET JOB='SALES'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');	
--WHERE 조건절은 절대 바뀌면 안된다.
--특정데이터에서 결과값을 가져온 뒤 가져온 특정데이터를 원하는 값으로 바꿈

SELECT * FROM PERSONNEL;
--------------------------------------------------------------------
/*
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');를
JOIN문으로 바꿔보기 */

SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--JOIN문이기 때문에 FROM ~~~ WHERE조건절 둘 다 값이 변경되면 안된다.

UPDATE PERSONNEL SET JOB='SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--오라클은 업데이트를 조인문으로 변경할 수 없다. 시퀄서버에서는 가능함

ROLLBACK; -- 바꾼 값들이 다시 처음 상태로 돌아간다.

----여기서 부터 공부하세요!!!!!!!!!!
--[DELETE]
--삭제나 수정은 반드시 중복되는 값이 없는 데이터로 작업해야한다.

SELECT * FROM PERSONNEL WHERE PNO=1111;
DELETE FROM PERSONNEL WHERE PNO=1111; 
--PNO의 1111을 삭제, 이 문장에서 FROM은 생략이 가능하다. 

SELECT * FROM PERSONNEL WHERE PNO=1112;
DELETE PERSONNEL WHERE PNO=1112; 

--SUBQUERY로 삭제

SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'FINANCE');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'FINANCE');

--INSERT ERROR
SELECT * FROM PERSONNEL;

INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1113,'INNA',30);
--유일값 제약조건에 위배되어 값이 오류가 난다.

SELECT * FROM USER_CONSTRAINTS;

--UPDATE ERROR
SELECT * FROM DIVISION; --DNO가 10 20 30 40 50
SELECT * FROM PERSONNEL; 
SELECT * FROM TAB;
--DIVISION을 참조하여 만들었기 때문에 
--DIVISION에 있는 DNO만 PERSONNEL에 들어갈 수 있다.
--DIVISION:부모, PERSONNEL이 자식이라고 보면 됨

UPDATE PERSONNEL SET DNO=51
WHERE DNO=20;
--부서번호 20번을 51번으로 바꿀것이다.
--실행하면 DIVISION에 가서 DNO값을 찾아봄
--DIVISION에 51이 없기 때문에 이 수식은 오류가 난다.

--DELETE ERROR
DELETE DIVISION WHERE DNO=20;
--DNO가 20인 자료를 찾아T삭제해줘 , 에러남
--자식의 레코드에서 20번의 값을 사용하고 있기 때문에
--20번이 삭제되면 엉터리 데이터가 됨. 삭제할 수 X

DELETE DIVISION WHERE DNO=50;
--자식이 사용하고 있지 않은 번호는 지울 수 있다. 실행이 됨.

COMMIT;

SELECT * FROM DIVISION;

--[TRANSACTION]
--AUTO COMMIT이 되는 경우
--DDL(CREATE, ALTER, DROP, RENAME)
--DCL(GRANT,REVOKE) 권한을 주거나 뺏을 때
--비정상적인 종료를 할 경우(ROLLBACK)

--DDL(CREATE,ALTER,DROP)
--CREATE로 만든것을 수정 할 때 : ALTER
--CREATE로 만든것을 삭제 할 때 : DROP

--OBJECT(TABLE,INDEX,SYNONYM,SEQUENCE,VIEW)

--TABLE
--DATA TYPE
--CHAR : 문자를 저장(고정길이)
--VARCHAR2 (1이없어져서 무조건 2로 실행) : 문자를 저장(가변길이)
--NUMBER(P,S) : 숫자를 저장(가변길이) -> 자리 상관없이 무조건 값을 받을거야!
--DATE : 날짜,시간을 저장(고정길이) 7BYTE의 값을 가짐
--LONG : 문자(가변길이, 전체크기가 2G, 사용빈도 적음)

CREATE TABLE BUSEO1
(DNO NUMBER(2), -- DNO에 두자리숫자가 들어간다.
DNAME VARCHAR(14),
ZIPCODE CHAR(7));
--AUTO COMMIT

SELECT * FROM BUSEO1;
DESC BUSEO1;
INSERT INTO BUSEO1 VALUES(10,'AAA','123-123');
SELECT * FROM BUSEO1;

--[테이블이름]
/*
(특징)
: 반드시 영문자로 시작해야한다.
: 특수문자는 (_,$,#)만 사용 가능하며 첫글자에는 사용할 수 없다.
: 테이블 이름의 중복을 허용하지않는다.
: COLUMN명과 달라야 한다.
: 예약어를 사용할 수 없다.(INSERT, VALUE, SELECT 등등) 
-> 오라클의 쿼리이름과 동일하게 이름을 지을 수 없다.
*/

--사용가능한 테이블 이름 : SAWON, P_NO, DIV10
--사용불가능한 테이블 이름 : 10DIV, $SAL, ALTER(예약어)

CREATE TABLE CUSINFO
(ID CHAR(5) PRIMARY KEY, ->아이디의 값이 절대 중복되지 않기를 원하는 경우
NAME CHAR(10),
JUMIN CHAR(14),
AGE NUMBER(3),
ADDR VARCHAR2(50)); -> 주소의 값

SELECT * FROM CUSINFO;
DESC CUSINFO;

INSERT INTO CUSINFO VALUES('A100','SUZI','123456-1234567',27,'서울');

SELECT * FROM CUSINFO;

SELECT * FROM USER_CONSTRAINTS;

SELECT STARTDATE FROM PERSONNEL;

SELECT STARTDATE,EXTRACT(YEAR FROM STARTDATE) YEAR, --년도만 추출
EXTRACT(MONTH FROM STARTDATE) MONTH, --달만 추출
EXTRACT(DAY FROM STARTDATE) DAY --일만 추출
FROM PERSONNEL; 

--(22-07-07)기준

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM TAB;

CREATE TABLE SALESMAN
AS
SELECT PNO, PNAME, JOB, PAY FROM PERSONNEL
WHERE JOB = 'SALESMAN';

SELECT * FROM SALESMAN1;

DESC SALESMAN1;

--(예제)PERSONNEL 테이블에서 업무가 MANAGER인 사원의 모든 내용을 
--질의하여 새로운 테이블인 MANAGER1을 생성한다.

CREATE TABLE MANAGER1
AS
SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER1;
/*새로운 테이블 MANAGER1을 생성한다. PERSONNEL TABLE에있는 
JOB COLUMN의 데이터가 MANAGER인 데이터를 추출해서
MANAGER1 테이블에 저장한다. */

--(예제)PAY가 3000 이상인 직원의 데이터를 저장할 PAY3000테이블 생성하기
CREATE TABLE PAY3000
AS
SELECT * FROM PERSONNEL
WHERE PAY >= 3000;

SELECT * FROM PAY3000;

--(예제)PERSONNEL 테이블에서 12월달에 입사한 직원들의 데이터를
--MON12라는 테이블로 복사하시오.
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

--(예제)부서번호가 10인 부서의 총 급여 정보를 DIV10테이블로 만드시오
CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 10;

SELECT * FROM DIV10;

--[테이블 구조 복사]

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0 = 1; --일부러 다른 숫자를 줘 중복되지 않게 함. FALSE값을 줌

SELECT * FROM SAWON1;
--데이터나 제약조건은 복사되지 않고 구조만 복사된다.

SELECT * FROM PERSONNEL;
DESC PERSONNEL;
DESC SAWON1;


--[[테이블 수정]]
SELECT * FROM SALESMAN1;

DESC SALESMAN1;

--[ADD(COLUMN 추가)]
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2));
--컬럼을 여러개 추가할 경우에는 반드시 괄호로 컬럼을 묶어주어야함

INSERT INTO SALESMAN1 VALUES (1234, 'SUZI', 'SALESMAN',3000,10); 
--L자 테이블 최악의 테이블임

SELECT * FROM SALESMAN1;


ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1 VALUES (4444,'INNA','SALESMAN',2000,10,'1234','1234');
-- 계단식 테이블 최악의 테이블이다.

ALTER TABLE SALESMAN1
ADD BIGO VARCHAR2(10) DEFAULT('AA');

--테이블을 만들면서 특정 컬럼에 프라이머리 키를 만들어줌
CREATE TABLE CUSINFO
(ID NUMBER(3) CONSTRAINT CUSINFO_ID_PK PRIMARY KEY,
NAME CHAR(10),
BIRTH DATE DEFAULT SYSDATE);

--INSERT INTO CUSINFO VALUES (111,'SUZI');
--MS-SQL에선 이렇게 써도 출력이 됨. BUT ORACLE에서는 안됨

INSERT INTO CUSINFO (ID, NAME) VALUES (111,'SUZI');
--VALUES 앞에 반드시 컬럼명을 지정해주어야 한다.

SELECT * FROM CUSINFO;

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED')));

SELECT * FROM SALESMAN1;

SELECT * FROM USER_CONSTRAINTS;

INSERT INTO SALESMAN1 
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SOLO');
--SALESMAN1_MARRIGE_CK만들어 놓은 값의 위배되어 실행 오류남
--SINGLE아니면 MARRIED 둘 중 하나의 값을 입력해야한다.

INSERT INTO SALESMAN1 
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SINGLE');

DESC SALESMAN1;

--만들어진 테이블에 프라이머리 키를 지정해주고 싶을때
--PRIMARY KEY(컬럼명)을 입력해주면 된다.
ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;
--DICTIONARY 중에 하나의 테이블임
-- Oracle이 돌아가기 위한 정보가 저장되는 곳(테이블들)을 출력
--딕셔너리는 항상 복수형태이기 때문에 -s가 붙는다.

ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

DESC MANAGER1;
--COPY한 테이블이기 때문에 프라이머리 키가 없는 상태임.

SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
ADD CONSTRAINT MANAGER1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;

--[MODIFY(컬럼을 수정)]
/*: 데이터가 들어가있는 경우에는 최소값으로 데이터의 최대 크기값으로
사이즈를 지정해야한다.*/
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(16);
--PNAME VARCHAR2(9)를 16자리 입력할 수 있게 변경한다.

SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7);
--PNAME의 최대 글자가 7이기 때문에 그 밑의 숫자를 입력하면 에러가 남.

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7) NOT NULL;
--PNO의 NOT NULL은 PK값이기 때문에 자동으로 생성
--PNAME NOT NULL은 사용자가 직접 NOT NULL의 값을 넣어주어 생성된 것


--[DROP]
--COULMN이나 제약조건을 삭제
SELECT * FROM MANAGER1;
DESC MANAGER1;
--제약조건이 PNO, PNMAE 2개에 있음

--ALTER, CREATE, DROP
--ADD, MODIFY, DROP
--지금 배우는 것은 ALTER의 ADD, MODIFY, DROP
ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;
--DROP에는 CONSTRAINT가 같이 딸려와야 함.
--이름으로 지우는 방법
--CONSTRAINT해서 제약조건의 이름을 넣어 삭제, 정석적인 방법이다.

ALTER TABLE SALESMAN1
DROP PRIMARY KEY;
--PRIMARY KEY로 지우는 방법, 사용 많이함 

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE DIVISION
DROP CONSTRAINT DIVISION_DNO_PK CASCADE;
--모든 데이터를 다 지우는 방법임.
--DIVISION을 참조하고 있는 값이 있기 때문에 DIVISION 하나만 지울 수 
--없기 때문에 CASCADE를 통해 전부 다 삭제하는 것이다.

--[COLUMN 삭제]
SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;
--데이터가 몇개 존재했건 상관없이 컬럼을 지워버린다.

--일시적으로 데이터를 안보이게 하는 방법
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;
--급하게 당장 사용자가 보지 못하게 해야하는 경우 사용함
--비활성화 한다고 생각하면 된다. 값이 삭제 된 것이 아니라 숨겨진 것임

ALTER TABLE SALESMAN1
DROP UNUSED COLUMN;
--DB에서 완전히 지워진 것, 내가 아까 비활성화 시킨
--값 지워줘. 컬럼 COLUMN 뒤에 컬럼명인 DNO는 생략 가능
--ALTER의 DROP

SELECT * FROM DBA_UNUSED_COL_TABS;
--DBA로 시작하는 것은 일반 사용자가 볼 수 없다 관리자만 볼 수 있음
--일반 사용자는 USER로 사용한다.

SELECT COUNT(*) FROM DICTIONARY;
--일반 사용자의 DICTIONARY는 804개이다.

--DROP(테이블 삭제) 
--CREATE로 만든 것을 삭제

SELECT * FROM TAB;
SELECT * FROM TABS; -- 좀 더 상세한 테이블의 내용이 출력된다.

DROP TABLE SALESMAN1; --테이블 삭제

SELECT * FROM TAB;
--테이블 삭제 후 출력하면 SALESMAN1;자리에 쓰레기 값이 나온다.

SELECT * FROM RECYCLEBIN;
--쓰레기값을 출력하는 명령어

FLASHBACK TABLE "BIN$DeenBX1OQNykX8Oaw/0gCg==$0" TO BEFORE DROP;
--휴지통의 값 다시 꺼내오기 방법1) OBJECT명 사용

FLASHBACK TABLE SALESMAN1 TO BEFORE DROP;
--휴지통의 값 다시 꺼내오기 방법2) COLUMN명 사용

SELECT * FROM "BIN$GmUvwQFoS9+rTKXUmPCAFQ==$0";
--값이 휴지통에 있어도 데이터는 출력이 된다.

SELECT * FROM TAB;

PURGE RECYCLEBIN;
--테이블을 완전히 삭제

DROP TABLE MANAGER1; --삭제된 것이 아니고 휴지통에 들어간 것임

DROP TABLE MANAGER1 PURGE; --완전히 삭제, 복구가 불가능

DROP TABLE SALESMAN11 PURGE;

COMMIT; --여기까지 저장됨
--만약 밑에부터데이터가 잘못되어 롤백하면 여기서 부터 실행되는 것임

--[레코드 삭제]
--TRUNCATE / DELETE

--[DELETE]
SELECT * FROM CUSINFO;

DELETE CUSINFO;
--CUSINFO의 정보를 삭제
--DELETE가 실행되는 순간 바로 트랜젝션이 시작됨.

SELECT * FROM CUSINFO;
--데이터가 삭제됨

ROLLBACK;
--되돌리기

SELECT * FROM CUSINFO;
--데이터가 다시 출력이 된다.


--[TRUNCATE] (DROP과 비슷)
--헷갈리지 않게 유의

TRUNCATE TABLE CUSINFO;
--CUSINFO의 레코드를 삭제

SELECT * FROM CUSINFO;
--레코드 값이 삭제 되어 출력

ROLLBACK;
--되돌리기

SELECT * FROM CUSINFO;
--되돌리기 명령어를 입력해도 삭제 된 값이 다시 돌아오지 않는다.
--무조건 삭제해버리기 때문에 복구되지 않는다.
--TRUNCATE는 트랜젝션이 시작이 안되는 것임. (ROLLBACK이 사용 불가)

--[RENAME](테이블의 이름 변경)
--컬럼명 알터 테이블 에서 알터 투
SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;
--이름을 변경하고 난 후에 이전의 값으로 값을 검색하면 에러가 난다.

--[COMMENT]
--: 주석처리하는 것임
SELECT * FROM USER_TAB_COMMENTS;
--딕셔너리, 복수이기 때문에 -S가 붙음

COMMENT ON TABLE HIGHPAY
IS '월급 많이 받는 사람';
--HIGH PAY의 COMMENTS 월급 많이 받는 사람이라는 문구가 출력됨.

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON TABLE HIGHPAY
IS '';
--주석 처리 한 것 삭제

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON COLUMN HIGHPAY.PAY
IS '실 수령 금액';

SELECT * FROM USER_COL_COMMENTS;

SELECT * FROM HIGHPAY;

COMMENT ON COLUMN HIGHPAY.BONUS
IS '올해 보너스 없다.';

SELECT * FROM USER_COL_COMMENTS;

--[DCL] (GRANT, REVOKE)
/* 사용자는 사용 불가, SYS에서 사용 가능
GRANT : USER(사용자)나 OBJECT(CREATE로 생성할 수 있는 것들)에
권한을 부여할 때 사용한다. 
REVOKE : USER(사용자)나 OBJECT(CREATE로 생성할 수 있는 것들)에
권한을 회수, 박탈할 때 사용한다.
*/

CREATE USER YOUNG
IDENTIFIED BY YOUNG
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
--KIM에게도 계정을 생성할 수 있는 권한이 생겼다.

--OBJECT권한
--일반 사용자가 주는것이기 때문에 SYS에서 불가능하다.
-- 일반 사용자인 KIM에서 실행한다.
GRANT SELECT ON PERSONNEL TO TEST;
GRANT SELECT,INSERT,DELETE ON DIVISION TO TEST;
--KIM이 TEST라는 계정에게 권한을 준 것임.
--UPDATE권한은 주지 않았기 때문에 할 수 없다.

SELECT * FROM USER_TAB_PRIVS_MADE;
--KIM한테 어떤 권한을 줬는지 확인할 수 있는 딕셔너리

--권한 뺏어오기
REVOKE SELECT ON PERSONNEL FROM TEST;
--테스트 권한에게 PERSONNEL을 셀렉트 할 수 있는 권한을 뺏어올거얌
SELECT * FROM USER_TAB_PRIVS_MADE;
--권한을 뺏은 것을 확인하는 코드

REVOKE SELECT ON DIVISION FROM TEST;
--SELECT하는 권한을 뺏음
REVOKE INSERT ON DIVISION FROM TEST;
--INSET하는 권한을 뺏음
REVOKE DELETE ON DIVISION FROM TEST;
--DELETE하는 권한을 뺏음
SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE SELECT,INSERT,DELETE ON DIVISION FROM TEST;
--한번에 실행시키고 싶다면 코드를 끝까지 입력하고 실행한다.
--SELECT하고 저장하고 INSERT하고 실행하려하면 SELECT는 이미
--삭제한 상태이기 때문에 출력이 안되고 에러가 난다.

CREATE ROLE MANAGER;
--CREATE ROLE 권한이 없기 때문에 실행이 되지 않는다.

CREATE ROLE KIMOBJ;
--ROLE 생성

GRANT SELECT,INSERT,DELETE ON DIVISION TO KIMOBJ;
--ON DIVISION테이블의 권한을 KIMOBJ에게 넣어준 것임.

GRANT KIMOBJ TO lee;
--LEE에게 KIMOBJ의 권한을 넘겨줌

SELECT * FROM ROLE_SYS_PRIVS;
SELECT * FROM USER_ROLE_PRIVS; --KIM이 가지고 있는 ROLE


--[제약조건] (CONSTRAINT)
--: 테이블 만들때 무조건 필요하다. 없으면 좋지 않은 DB임
--: 무결성(결함이 없어야 한다.)
/*
PRIMARY KEY(PK)
FOREIGN KEY(FK)
UNIQUE KEY(UK)
NOT NULL(NN)
CHECK KEY(CK)
*/
--DEFAULT 오라클에서는 제약조건에 포함x MS-SQL에서 포함됨.


























































































