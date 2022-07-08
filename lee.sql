--lee
--(22.07.04)기준
SELECT * FROM CUSTOM;

--실제로 있는 데이터에서 주민번호 가져오기
SELECT USERNAME, RPAD(SUBSTR(JUMIN,1,8),14,'*') JUMIN FROM CUSTOM;

--(22.07.05)기준
SELECT * FROM CUSTOM;

--주소별 인원수 구하기
SELECT ADDR1, COUNT(*), ROUND(AVG(POINT)), SUM(POINT) FROM CUSTOM
GROUP BY ADDR1;

--오라클의 SWITCH문
--성별의 있는 값을 가지고 남자/여자를 만들었기 때문에 파생컬럼이므로
--별칭을 꼭 생성해주어야 한다.
--방법1)
SELECT 
CASE SEX
WHEN '1' THEN '남자'
WHEN '0' THEN '여자'
END GENDER,
COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;

--방법2)
SELECT 
CASE SEX
WHEN '1' THEN '남자' ELSE '여자'
END GENDER,
COUNT(*), ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;

--[CASE문의 문법]

방법 1)
SELECT
CASE 컬럼명
	WHEN 1 THEN 100
	WHEN 2 THEN 200
	WHEN 3 THEN 300
	WHEN 4 THEN 400
	ELSE 500
	END AS 별칭
FROM DUAL;

방법 2)
SELECT
CASE 컬럼명 WHEN 1 THEN 100 ELSE 0,
CASE 컬럼명	WHEN 2 THEN 200 ELSE 0,
CASE 컬럼명	WHEN 3 THEN 300 ELSE 0,
CASE 컬럼명	WHEN 4 THEN 400 ELSE 0,
FROM DUAL;


SELECT * FROM CUSTOM;

SELECT
CASE ADDR1
WHEN '서울특별시' THEN '서울'
WHEN '경기도' THEN '경기'
WHEN '경상남도' THEN '경남'
END ADDR
FROM CUSTOM;

/*
JOIN문
EQUITE JOIN(INNER JOIN)
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/
--JOIN문의 특징 : 공통되는 분모가 있어야 조인문을 실행할 수 있다.
--무조건 만들어야함 안만들면 조인문 자체를 사용할 수 없기 때문에 엉터리 DB가 된다.

SELECT * FROM TAB;
/*테이블들끼리 공통되는 컬럼이 있어야만 조인문이 가능하다.*/
SELECT * FROM CUSTOM WHERE USERID='nu7634';
SELECT * FROM COMPANY WHERE USERID='nu7634';
SELECT * FROM POINT WHERE USERID='nu7634';
SELECT * FROM SALES WHERE USERID='nu7634';
--공통분모인 USERID='nu7634'가 있기 때문에 
--USERID='nu7634'의 이름, 회사, 포인트 정보, 구매 목록을 한번에 SELECT할 수 있다.

--[EQUITE JOIN(INNER JOIN)] - 가장기본적이고 많이 사용된다.
SELECT CUSTOM.USERID, USERNAME, AGE, COMPANY.USERID, ADDR1, PAY
FROM CUSTOM, COMPANY --중복되는 컬럼은 꼭 위치를 표기해줘야한다.
WHERE CUSTOM.USERID = COMPANY.USERID; -- 공통분모

--앞에 입력되는 USERID에 컬럼명을 붙이면 뒤에 오는 USERID를 생략해도 값이 출력된다.

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A, COMPANY B 
--테이블에 별칭을 붙일때는 AS를 사용하면 오류가 난다.
WHERE A.USERID = B.USERID;

SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A INNER JOIN COMPANY B 
ON A.USERID = B.USERID;
--FM방식임 국제 표준값이지만 오라클에서는 ,로 사용할 수 있게 만들어놓음. 
-- , 대신 INNER JOIN(INNER는 생략 가능) WHERE 대신 ON 입력

--(예제)'CUSTOM'에서 UserID, UserName을 검색하고 POINT 테이블에서 
--제품구입, 로그인에 관계된 점수 POINT 점수(Product, Login)를 검색

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

--[OUTER JOIN] - 외부조인이라고도 함.
--한쪽 테이블을 기준으로 다른쪽에 있는 데이터를 매치시키는 것이다.
--기준 테이블을 어떤 테이블로 정하냐에 따라 출력값이 달라질 수있다.

SELECT COUNT(*) FROM CUSTOM; --459
SELECT COUNT(*) FROM COMPANY; --464

--CUSTOM 테이블 기준으로 JOIN문 입력
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) -- 기준점은 대각선으로 입력함.
ORDER BY B.COMPANY DESC;
--고객정보 테이블은 있는데 회사정보 테이블이 없는 경우는 NULL값이 됨.

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) AND B.COMPANY IS NULL;
--NULL값만 찾아서 출력

--COMPANY 테이블 기준으로 JOIN문 입력
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID(+) = B.USERID -- 기준점은 대각선으로 입력함.
ORDER BY B.COMPANY DESC;

---------------------------------------
--ANSI 표준 SQL
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

-----------------------------------------

--[CROSS JOIN] - 상호 조인
--많은 양의 데이터를 새로운 테이블에 값을 넣어 테스트 할때 사용함

SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A, COMPANY B;
--459*464 = 212,976개의 ROWS 값이 출력된다.

--ANSI 표준 SQL
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B;

--INNER JOIN
--inner join이랑 같은 역할을 하지만 cross join 형식으로 작성한 것
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B
WHERE A.USERID = B.USERID;

----------------------------------------------------
--[SELF JOIN]
-- 하나의 테이블을 메모리에 두번 올려 놓고 비교할 때 SELF JOIN 사용
-- 하나의 테이블을 두개로 복사해서 값을 비교하는 것은 JOIN문에서만 해당된다.
-- 공식으로 생각하고 외워야함.

SELECT * FROM CUSTOM 
ORDER BY USERNAME;

SELECT DISTINCT A.* -- DISTINCT는 중복되는 값을 삭제함
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME --이름은 같아야하지만
AND A.USERID <> B.USERID --ID는 달라야함
ORDER BY A.USERNAME;

--'CUSTOM' 테이블에서 '제주도'에 살고 있는 사람중 동일한 이름을 갖는 사람을 찾으시오
SELECT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.USERID <> B.USERID AND A.ADDR1 = '제주도' AND B.ADDR1 = '제주도'; 
--WHERE은 순서를 고려하지 않기 때문에 마지막 데이터까지 반드시 
--같은지 비교를 해야 완벽한 값이 출력이 된다.
--한가지의 표를 가지고 두 값을 비교하지 못하기 때문에 표 자체를 복사해서 비교
 
--3개 이상의 테이블 JOIN
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
--A와 B의 조인문 만들어서 비교 후 그 안에 이너조인문 만들어 B와 C값 비교

--[파생 테이블과 조인](이너조인 사용)
--파생 테이블 : 실제로 존재하지 않는 테이블을 생성

--아이디별로 구매횟수와 구매금액의 합 검색
SELECT * FROM SALES;

SELECT USERID, COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID;

--구매 금액의 합계가 150만원 이상인 사람 검색

SELECT USERID, COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID
HAVING SUM(PRICE) >= 1500000;

--위와 아래는 별개의 쿼리
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
SELECT * FROM CUSTOM WHERE ADDR1='제주도';

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1='서울특별시';

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1='경기도';

SELECT * FROM TAB;

SELECT * FROM JEJU;
SELECT * FROM SEOUL;
SELECT * FROM KYUNG;

SELECT * FROM JEJU
UNION
SELECT * FROM SEOUL
UNION
SELECT * FROM KYUNG;
--제주, 서울, 경기도의 값을 UNION을 이용해 한번에 출력할 수 있음


--(22-07-06)기준
--[SUBQUERY(하위쿼리)]
--쿼리안에 쿼리가 들어가있는 것
--하위 쿼리는 괄호를 쓰지 않으면 에러가 난다.
--비교하는 컬럼의 개수는 동일해야한다.
--비교하는 컬럼명은 동일해야 같은 데이터에서 값을 비교하여 출력된다.
--비교하는 컬럼명이 다른 경우 에러가 나지는 않지만 원하는 값으로 출력x
--하위쿼리는 100% JOIN문으로 변경할 수 있다.

--(예제)COMAPNY 테이블에서 USERID, COMPANY, DEPT, PAY, 평균월급 검색
SELECT * FROM COMPANY; --COMPANY정보 출력

SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY; -- 평균 월급 출력

SELECT USERID, COMPANY, DEPT, PAY,
(SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY) A_PAY --하위쿼리 괄호 중요
FROM COMPANY;

--(예제)CUSTOM 테이블에서 평균 나이보다 많은 사원의 정보를 검색
SELECT * FROM CUSTOM;

SELECT ROUND(AVG(AGE)) FROM CUSTOM;

SELECT * FROM CUSTOM WHERE AGE>=(SELECT ROUND(AVG(AGE)) FROM CUSTOM);

--(예제)현대자동차 그룹에 근무하는 직원을 출력하시오.
SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%';

SELECT * FROM CUSTOM
WHERE USERID IN('ih9389','418571');

SELECT * FROM CUSTOM
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

--JOIN문을 사용하여 출력하시오.
SELECT A.*
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID AND COMPANY LIKE '현대자동차%';
--출력은 CUSTOM의 모든 데이터만 출력이 되는 것이다.

--(예제)4회 이상 판매 기록이 있는 고객들의 기본 정보를 검색하시오.
--SALES, CUSTOM
SELECT * FROM CUSTOM
ORDER BY USERID;
--USERID를 기준으로 CUSTOM TABLE의 정보를 출력

SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4;
--데이터가 18개
/*USERID 기준(조건 - 기록이 4번 이상)으로 
SALES TABLE의 정보 중 USERID와 기록횟수를 출력*/ 

SELECT * FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4);
/*데이터가 17개 SALES테이블에는 있지만 
CUSTOM테이블에는 없는 데이터를 빼고 출력한다.*/
/* SALES TABLE에서 기록이 4번 이상인 USERID를 CUSTOM TABLE에 있는
USERID에 값을 넣은 후 기준에 맞는 값을 출력한다.
*/

SELECT A.*, CNT
FROM CUSTOM A, 
(SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >= 4) B
WHERE A.USERID = B.USERID;
--위에 값에서 CNT(기록 횟수)까지 출력해준다.

--[ANY(범위값을 포함), ALL(범위값 미포함)]
-- : MAX, MIN보다 ANY가 빠르기 때문에 ANY를 사용하는 것이다.
/*
 >ANY : 최소값보다 큰 데이터(ANY보다 크다)
 <ANY : 최대값보다 작은 데이터(ANY보다 작다)
 >ALL : 최대값보다 큰 데이터(ALL보다 크다)
 <ALL : 최소값보다 작은 데이터(ALL보다 작다)
*/


SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도' ORDER BY POINT;
--MIN : 132, MAX : 269
--CUSTOM테이블에 있는 ADDR1의 값이 제주도인 포인트값을 출력

/*제주도에 사는 사람 중 포인트가 제일 적은 사람보다
 큰 포인트를 가진 사람의 데이터를 찾아 출력해라*/
SELECT * FROM CUSTOM
WHERE POINT > ANY(SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

------------------------------------------------------------------

--최대값보다 작은 데이터를 찾기
/*제주도에 사는 사람 중 포인트가 제일 많은 사람보다 
포인트가 적은 사람의 데이터를 찾아 출력해라*/
SELECT * FROM CUSTOM
WHERE POINT < ANY(SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

--------------------------------------------------------------------

--최대값보다 큰 데이터를 찾기
/*제주도에 사는 사람 중 포인트가 제일 많은 사람보다
더 포인트를 많이 가진 사람의 데이터를 출력해라*/
SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

--------------------------------------------------------------------

--132보다 작은 데이터가 없어서 출력이 되지 않음
--최소값보다 작은 데이터를 찾기
/*제주도에 사는 사람 중 포인트가 제일 적은 사람보다
더 작은 포인트를 가진 사람의 데이터를 출력해라*/
SELECT * FROM CUSTOM
WHERE POINT < ALL(SELECT POINT FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '제주도');

SELECT * FROM CUSTOM; --UPDATE 입력 후 실행하면 바뀐 값이 실행됨.

--USERID='nu7634'를 132보다 작은 값으로 업데이트 시켜 값이 출력되게 만듦
UPDATE CUSTOM SET POINT=130 WHERE USERID='nu7634';

---------------------------------------------------------------------

SELECT POINT FROM CUSTOM WHERE AGE >= 70; -- 값이 없음
--CUSTOM 테이블의 AGE COULMN이 70살 이상인 경우를 출력하시오

--하위쿼리의 결과가 없으면 상위쿼리의 결과도 나오지 않는다.

--하위쿼리의 값이 없을때 ANY는 모든 결과가 나오지 않는다.
SELECT * FROM CUSTOM
WHERE POINT > ANY (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

SELECT * FROM CUSTOM
WHERE POINT < ANY (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

--하위쿼리가 없을때 ALL은 모든 결과가 출력된다.
SELECT * FROM CUSTOM
WHERE POINT < ALL (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE AGE >= 70);

--하위쿼리의 값을 제일 먼저 출력시켜 데이터를 확인해 보고
--코드를 작성해야 원하는 값을 제대로 출력할 수 있다.

--------------------------------------------------------------------
SELECT * FROM COMPANY WHERE COMPANY LIKE '현대자동차%';
-- COMPANY테이블의 COMPANY 컬럼에서 현대자동차%의 값을 출력하시오.  

--IN연산자는 OR 연산자이다. 
SELECT * FROM CUSTOM
WHERE USERID IN(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '현대자동차%');
/* COMPANY테이블의 COMPANY 컬럼에서 현대자동차%를 가진 USERID와 같은
USERID를 가진 CUSTOM TABLE의 값을 출력하시오. */
/* CUSTOM 테이블에는 없는 COMPANY 현대자동차%가 있다.
현대자동차%의 값을 출력하기 위해 테이블에서 공통되는 
USERID를 통해 값을 출력하는 것이다.*/

--IN과 =ANY는 같은 역할을 한다.
--ANY가 연산속도가 훨씬 빠름
SELECT * FROM CUSTOM
WHERE USERID =ANY(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '현대자동차%');

---------------------------------------------------------------------
-- 446ROWS
/* COMPANY테이블의 COMPANY 컬럼에서 현대자동차%를 가진 USERID와 같은
USERID를 제외한 CUSTOM TABLE의 값을 출력하시오. */
SELECT * FROM CUSTOM
WHERE USERID NOT IN(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '현대자동차%');

-- NOT IN과 똑같은 연산자는  <>ALL 
SELECT * FROM CUSTOM
WHERE USERID <>ALL(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '현대자동차%');

-- 459ROWS 틀린 데이터. 전체 데이터가 출력된다.
SELECT * FROM CUSTOM
WHERE USERID <>ANY(SELECT USERID FROM COMPANY WHERE COMPANY 
LIKE '현대자동차%');

/*
--IN과 =ANY는 같은 역할을 한다.
--NOT IN과 <>ALL는 같은 역할을 한다.
*/

-----------------------------------------------------------------
--하위쿼리
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

--하위쿼리의 값은 독자적으로 실행이됨. 같은 테이블 값이기 때문
SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%';

--상관쿼리(하위쿼리와 비슷하게 생김) -> 속도가 빠름
/*
SELECT 해서 COMPANY TABLE의 데이터를 꺼내라, 
조건은 괄호 밖의 테이블의 USERID를 가져와 값을 비교, 
그리고 현대자동차에 근무해야함
*/
SELECT USERID, USERNAME, ADDR1, SCHOL FROM CUSTOM
WHERE EXISTS
(SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID 
AND COMPANY LIKE '현대자동차%');

SELECT * FROM COMPANY,CUSTOM WHERE COMPANY.USERID = CUSTOM.USERID 
AND COMPANY LIKE '현대자동차%';
--상관쿼리의 값은 독자적으로 실행이 되지 않음
--CUSTOM.USERID는 괄호 밖의 SELECT의 TABLE값이기 때문
SELECT * FROM COMPANY WHERE USERID = CUSTOM.USERID 
AND COMPANY LIKE '현대자동차%';

--값이 독자적으로 실행되는 유무에 따라 하위쿼리, 상관쿼리를 구분한다.

--------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE ADDR1 = '경기도';

SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1='경기도') A;

--경기도에 살면서 나이가 20살보다 어린 사람(조건)
--AND연산자이기 때문에 순서가 상관이 없음
SELECT * FROM CUSTOM WHERE ADDR1 = '경기도' AND AGE<=20;

--하위쿼리를 넣고 조건을 실행
--1차로 경기도에 사는 사람을 SORTING한 후 2차로 조건에 맞는 사람을 찾음
--괄호를 먼저 실행시킨 후 밑에 조건을 실행함.
SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1='경기도') A
WHERE AGE <= 20;

--DML(INSERT, UPDATE, DELETE)




