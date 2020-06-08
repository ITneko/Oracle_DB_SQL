-- where 조건절 = if 문과 비슷하게 생각하면 된다
--비교 연산자
--(<>,!=,^=) 이표현이 같지 않다라고 하는 표현 방법 

SELECT * from emp;
-- 급여가 3000만원 미만인 사원을 출력하시오
-- 단, 사원 번호, 사원 이름 , 급여 출력
select empno,ename,sal from emp where sal<3000;

-- emp 사원테이블에서 부서 번호가 10인 사원의 모즌 정보를 출력하시오

select * from emp where deptno=10;

-- 사원 테이블 중에서 급여가 2000미만이 되는 사원을 정보중 사원 번호 이름 급여를 출력
SELECT ename,empno,sal from emp where sal=3000;

-- 문자 데이터 조회 
-- 문자 데이터를 조회시 반드시 '' (싱클쿼터, 단일따옴표)안에 표시, 대소문자 구분 필수
-- 문1] 사원의 이름이 scott인 사원의 사번 이름 급여를 출력하시오
SELECT ename,empno,sal from emp where ename='SCOTT';

--날짜 데이터 조회
-- 반드시 싱글 쿼터안에 표시 한다.
-- 날짜 형식을 정확히 기술해야함 ex)2020/06/04
-- 문2] 인사일이 1985년 이후에  사람을 정보를 출력하시오 사원이름 입사일 출렷
SELECT ename, hiredate from emp where hiredate<'1985/01/01';

-- and ,or ,not ,between and ,in, 

-- AND 연산자
/* 여러 조건을 모두 만족해야 할 경우 사용하는 연산자

문 ] 부서번호가 10번이고 직급이 manager 인 사원을 정보를 출력하시오

*/

SELECT
    ename,deptno,job
FROM emp WHERE deptno=10 and job='MANAGER';

-- 문] 급여가 1000에서 3000 사이인 사원의 모든 정보를 출력하시오
SELECT
    *
FROM emp where sal>=1000 and sal<=3000;

/*
or 연산자
 두가지 조건 중에서 한간지만 만족하더하도 검생 할 수 있도록 하기 위해서는 or 연산자를 사용함

문] 부서번호가 10번이거나 직급이 manager 인 사원을 검색하시오



*/

SELECT
    ename,deptno,job
FROM emp where deptno=10 or job='MANAGER';

-- 문] 사원 번호가 7844 이거나 7654 이거나 7521 인 사원의 정보를 출력하시오

SELECT
    *
FROM emp where empno=7844 or empno=7654 or empno=7521;

-- nor 연산자 : 값을 부정 (반대) 되는 논리값을 구함
-- 문] 부서본호가 10번이 아닌 사원의 사원번호 부서번호 직급을 입력하시오

SELECT empno,deptno,job from emp where not deptno=10;
-- 문 직급니 manager 가 아닌 사람을 검색

select * from emp where  not job='MANAGE';

--between and 연산자
-- 특정 범위내에 속한 데이터를 알아보려고 할 때 사용함
-- 컬럼 이름 between A and B

-- 문] 급여가 1000에서 3000 사이의 있는 사원의 이름과 급여를 출려하시오 

select ename, sal from emp where sal BETWEEN 1000 and 3000; -- >= <= 사이에 있다는 것임

-- 문] 급여가 1500과 2500가이인 가원의 사번 이름 급여를 출력하시오
SELECT empno,ename ,sal from emp where sal BETWEEN 1500 and 2500;

-- in 연산자 : 동일한 컬럼이 여러개 의 값중에 하나 인지르 알아보는 연산자
-- 형식 : 컬럼 in (값1 , 값2 ,값3...);

SELECT ename,sal from emp where empno in(7844,7654,7521);

-- 문 ] comm 300이거나 500이거나 1400 중의 하나의 사원을 이름 급여 거미션을 출력

SELECT ename, sal,comm from emp where COMM in(300,500,1400);

-- like : 검색하고자 하는 값을 정확히 모를 경우 와일드 카드와 함께 사용하여 원하는 내용을 검색하는 연산자
/* 와일드 카드의 종류 
    : % , - , _
    %: 문자가 없거나 , 하나 이상의 문자가 어떤 값인지 상관없을 때 
    _ : 하나의 문자가 어떤 값이 오든 상관 없음
*/

-- %  : 검색하고 자 하는 값을 정확히 모를 경우 사용 %는 몇개의 문자가 오든 상관없음

-- 문] k로 시작하는 사원 번호 , 사원의 이름을 출력하시오

SELECT  empno, ename from emp where ename like 'K%';
-- 문] 사원의 이름중에 k가 포함이 되어있는 사원의 번호 이름을 출력 
SELECT   empno, ename from emp where ename like '%K%';
-- 문 사원의 이름이 K로 끝나는 직원 출력
SELECT   empno, ename from emp where ename like '%K';
--------------------------------------------------------------

--와일드 카드 (_)
-- _ 는 한문자를 대신해서 사용한 것임
-- 문제] 사원의이름의 두번째 글자가 a인 사원을 사웝번호 와 이름을 출력하시오

SELECT empno,ename from emp WHERE ename like '_A%_';

-- 문제 ] 사원의 이름에 A를 포함하지 않은  사원 번호 와 이름 출력

SELECT empno,ename from emp WHERE not ename like '%A%';


SELECT
    *
FROM emp;

/*
null 을 위한 연산자
- 오라클에서는 컬럼에  null 갑ㅅ이 저장되는 것을 허용함
- null 은 미확정 , 알 수 없느 값을 의미함 0도 빈공간도 아닌 어떤값이 존재 하시는 하지만 
    어떤 값인지를 알아 낼 수 없는 것을 의미함
    
    null 은 연산 할당 비교가 불가능하다.
*/

--SELECT 100 + null from dual; 연산 안됨

-- 문] 커미션을 받지 않은 사원에 대하여 사원이름 커미션 직업을 출력하시오

--SELECT ename, comm,job from emp where com=null; 비교가 안됨

/*
 is null 과 is not null 
 - 특정 컬럼 값인지를 비교 할 경우에는 비교 연산자 (=) 를 사용하지 않고 is null 연산자를 사용
    null 값이 아닌지를 알아보려면 비교 ㅎ련산자 (<>)를 사용하지 않고 is not null연산자를 사용함
    
    is null :  null이면 만족
    is not  null : null이 아니면 만족
    
    
*/

SELECT ename, comm,job from emp where Comm is null;

SELECT ename, comm,job from emp where Comm is not null;


--문] 자신의 직속 상관이 없는 사원의 이름과 직급 직속 상관을 사번을 출력하라.

SELECT  empno,ename,job  from emp where mgr is null;

/*
정렬을 위한 order by절
- order by 절 은 로우 (행) 을 정렬하는데 사용하며 워리문 맨 뒤에 기술해야 하며,
정렬의 기준이 되는 컬럼이름 또는 select 절에서 명시된 별칭을 사용함

        오름차순(asc)        내림차순(desc)
숫자    작은 값부터            큰값부터
문자    사전식으로               사전의 반대 순서로
날짜   날짜가 빠른 순서로 정렬         늦은 날짜 순서로 정렬
null    가장 마지막에 나옴          가장 먼저나옴
        
   영문자의 경우 소문자를 가장 큰값으로,
   null값은 모든 값들중 가장 작은 값으로 인식함     
    

*/


--문 ] 사번을 기준으로 오름 차순 정렬하시오

SELECT empno, ename from emp order by empno;
-- 오름 차순 정렬일 경우 asc 생략 가능


-- 문 ] 사원번호를 기준으로 내림차순 정렬 하시오
SELECT empno ,ename from emp order by empno desc;

-- 문] 사원의 사번, 이름 급여를 급여가 높은 수준으로 순으로 출력

SELECT empno, ename from emp order by sal;

-- 문] 입사일이 가장 최근인 사원 순으로 사번 , 이름 입사일을 출력하시오 
SELECT empno,ename,hiredate from emp order by hiredate; 
--ex 내림차순
SELECT empno,ename,hiredate from emp order by hiredate desc; 


SELECT 80*20 from dual;
-- dual 단일행 함수 

SELECT *from dept;
SELECT *from emp;

-- 부서 번호가 30번인 사원의 급여를 출력하시오

SELECT deptno,sal from emp where deptno=30;
-- 그룹함수 이용해서 총급여를 구함
select deptno,sum(sal) from emp group by deptno HAVING deptno=30;


------------------------------------------------------------------
/*
함수
단일행 함수 : 행마다 함수가 적용됨

    -문자함수 : 문자열을 다른 형태로 변환하여 나타냄
    -숫자함수 : 숫자값을 다른 형태로 변환하여 나타냄
    -날짜함수 : 날짜 값을 다른 형태로 변환하여 나타냄
    -변환함수 : 문자, 날짜, 숫자 값을 서로 다른 타입으로 변환하여 나타냄
    -일반함수 : 기타 함수
    
그룹함수 : 하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과로 나타냄
    -sum : 
    -avg :
    -count :
    -max :
    -min :
    -stddev : 그룹의 표준편차를 구함
    -variance : 그룹의 분산의 구함
    
    
문자함수 : 문자형의 값을 조작하여 변환된 문자 값을 반환함

    lower  : 소문자로 변환
    upper  : 대문자로 변환
    initcap : 첫 글자만 대문자로 나머지는 소문자로 변환
    concat  : 문자의 값을 연결
    substr  : 문자를 잘라서 추출함 (1byte)
    stbstrb : 문자를 잘라서 추출함 (2byte) 
    length  : 문자의 길이를 반환
    lengthhb: 문자의 길이를 반환
    instr   : 특정 문자의 위치값을 반환
    instrv  : 특정 문자의 위치값을 반환
    lpad,rpad : 입력받은 문자열과 기호를 정렬하여 특정 길이의 문자열로 반환함
    trim     : 잘라내고 남은 문자를 표시함
    convert : char set 을 반환함
    chr     : ASCII 코드로 변환
    ascii   : ASCII 값을 문자로 변환함
    replace : 문자열에서 특정 문자로 변경함
*/

-- 소문자로 변환하는 함수 (lower) 함수
-- 입력한 문자 값을 소문자로 변환
select 'DataBase',Lower('DataBase') from dual;

--문] 사원테이블에서 부서번호가 10번인 사원 명을 모두 소문자로 출력하시오

SELECT * from emp;

SELECT Lower(ename) from emp where deptno= 10;

-- 문] 대문자를 소문자로 
select 'DataBase',upper('DataBase') from dual;

-- 문] 직급이 'MANAGER' 인 사원을 검색하여 사원 번호 , 사원 이름 직급을출력하시오
-- 1.
SELECT empno,ename,job from emp where job = upper('MANAGER');
-- 2.
SELECT empno,ename,job from emp where lower(job)='manager';

-- 첫글자만 대문자로 변환 (INITCAP)
SELECT INITCAP('DATABASE PROGRAMING') FROM DUAL;

-- 문] 사원테이블의 부서번호가 10번인 사원 들의 이름첫 글 자만 대문자로 출력하시오

SELECT INITCAP(ENAME) FROM EMP WHERE deptno=10;

-- 문 'SMITH' 란 이름을 가진 사원의 사번 이름 급여 커미션을 출력하시오

SELECT EMPNO,ENAME, SAL,COMM FROM EMP WHERE INITCAP(ENAME) LIKE initcap('smith');

------------------------------------------------------------------

        --6월 5일 수업--
        SELECT * FROM EMP;
-- 두 문자를 연결하는 함수(CONCAT)
SELECT CONCAT('DATA', 'BASE') FROM DUAL;

-- length 문자의 길이를 알려주는 함수
SELECT length (CONCAT('DATA', 'BASE')) FROM DUAL;

-- 문] 사원 테이블에 사원 중 이름이 4글자인 사원의 이름을 소문자로 출력하시오
Select lower(ename) from emp where length(ename)>=4;

-- 문] 10번 부서소속사원들의 이름길이를 출력하시오.
SELECT ENAME,LENGTH(ENAME),DEPTNO FROM EMP WHERE DEPTNO=10; 

-- 문] 이름이 6글자 이상인 사원의 사번과 이름과 급여를 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE LENGTH(ENAME)>=6;

-- 문자열의  일부만 추출하는 함수 (SUBSTR)
select substr('Database',1,3) from dual;
            -- 대상, src, desc
            -- 음수일경우 뒤에서부터 읽어 들임
-- 시작 위치가 음수인 경우 (뒤에서 부터 시작)
select substr('Database',-4,3) from dual;

-- 문] 정처기 문제임
-- 20번 부서 사원들 중 입사년도를 추출하여 출력하시오
select substr(hiredate,1,2) from emp where deptno=20;

-- 문] 87년도에 입사 한 사원을 추출하시오.
-- 단, 비교연산자와 and, between and, substr 함수를 사용
select * from emp where substr(hiredate,1,2)=87;

-- 문] 87년도에 입사한 부서번호 20번 사원을 출력하시오.
select * from emp where substr(hiredate,1,2)=87 and deptno=20;

-- substrb : 바이트 수를 기준으로 문자열을 일부만 추출
select substrb('데이터베이스', 1,5) from dual;
-- 한글자가 2바이트를 차지함 sql 버그로 제대로 출력안됨

--문자열의 위치를 구하는 함수(instr)
--instr(대상,찾을글자,시작위치, 몇번째 발견
select instr('DATABASE', 'A', 3, 1) from dual;

-- 바이트로 계산 하기에 데이터의 '이'를 추출
select instrb('데이터베이스', '이', 3,1) from dual;

-- 특정 기호로 채우는 함수(LPAD/RPAD)$ # %로 빈곳을 채워 가는 것 
-- L은 왼쪽 R은 오른쪽, pad는 padding(내부 여백), Margin(외부 여백)
select lpad('DATABASE', 20, '$') from dual;
select rpad('DATABASE', 20, '$') from dual;
         -- 대상 , 총 글자 수, 채울 문자

-- TRIM : 특정 문자를 잘라내는 함수
--        컬럼이나 대상 문자열에서 특정문자가 첫번째 글자이거나 
--        마지막 글자라면 잘라내고 남은 문자열만 반환

select trim ('A' from 'AAADATABASE PROGRAMAAAA') from dual;
-- A문자를 삭제함

-- 문] SMITH란 사원의 이름에서 S와 H를 잘라내고 출력
select ENAME, TRIM('S' FROM ENAME), TRIM('H' FROM ENAME) FROM EMP WHERE ENAME='SMITH';

/* 
    숫자함수 : 숫자형 데이터를 조작하여 변환된 숫자값을 반환하는 함수
    ABS : 절대값을 반환
    COS : 코사인 값을 반환
    EXP : 제곱N을 반환 예 2의 N제곱
    FLOOR : 소수점 아래를 잘라냄(버림)
    LOG : LOG 값
    POWER : POWER(2,3) = 8을 반환
    SIGN : N<0이면 -1, N=0이면 0, N>0보다 크면 1을 반환
    SIN : SIN값을 반환
    TAN : 탄잔테 값을 반환
    ROUND : 특정 자릿수를 반올림
    TRUNC : 특정 자리수를 잘라냄(버림)
    MOD : 나머지 값을 반환
*/

SELECT ABS(-15) FROM DUAL;
SELECT FLOOR(34.5678) FROM DUAL;

SELECT ROUND(12.345,2) , ROUND(34.5678,0), ROUND(79.901,-1) FROM DUAL;
-- -1은 일의 자리, -2는 십의 자리, -3은 백의 자리에서 반올림

SELECT MOD(34,2), MOD(34,5), MOD(34,7) FROM DUAL;

/*
날짜함수
- 날짜형에 사용하는 함수이며, 결과 값으로 날짜 또는 기간을 얻을 수 있음
  기간은 주로 일단위로 계산 되지만, 월 단위로 계산되는 경우도 있음
  
  SYSDATE : 시스템에 저장된 현재 날짜를 반환
  MONTHS_BETWEEN : 두 날짜 사이에 몇개월인지 반환
  ADD_MONTHS : 특정 날짜에 개월수를 더한 날짜를 반환 
  NEXT_DAY : 특정 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환
  LAST_DAY : 해당 달의 마지막 날짜를 반환
  ROUND : 인자로 받은 날짜를 특정 기준으로 반올림
  TRUNC : 인자로 받은 날짜를 특정 기준으로 잘라냄(버림)
*/

SELECT SYSDATE FROM DUAL; -- 현재 날짜출력   

-- 연산도 가능 현재날짜에서 더하거나 빼거나
SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일 FROM DUAL;

-- 문] 부서번호가 10인 사원을 대상으로 입사한 날로부터 오늘까지 며칠이 흘렀는지 근무일수를 구하시오
-- 두 날짜 사이의 간격을 구하는 MONTHS_BETWEEN(DATA1,DATA2)
SELECT ENAME, HIREDATE, FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))근무개월 FROM EMP WHERE DEPTNO=10;

-- 문] 부서번호가 10인 사원의 입사일에서 3개월이 지난 날짜를 구하시오.
-- ADD_MONTHS
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,3) FROM EMP WHERE DEPTNO=10;

-- 해당 요일의 가장 가까운 날짜를 반환하는 함수(NEXT_DAY)
-- 문] 오늘을 기준으로 최초로 다가오는 수요일은 언제인지를 구하시오.
SELECT SYSDATE, NEXT_DAY(SYSDATE, '수요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '수')다음주수요일 FROM DUAL;

-- 국가 세션 변경
ALTER SESSION SET NLS_LANGUAGE=AMERICAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'WEDNESDAY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE=KOREAN;
SELECT SYSDATE,NEXT_DAY(SYSDATE,'수요일') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE=JAPANESE;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'水曜日') FROM DUAL;


-- LAST_DAY : 해당달의 마지막 날짜를 구하는 함수
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;


/* ROUND 함수
- 함수에 형식 모델을 지정하면 숫자 이외의 날짜에 대해서도 반올리을 할 수 있음
    ROUND(DATE,'MONTH')
*/
-- 입사일을 기준으로 반올림
--일수가 15일 미만일 경우 01로 바뀌고 반올림 없음
--일수가 15일 이상일 경우 월에 1을 반올림하여 한달 더 추가함. 일수는 1일로됨
SELECT HIREDATE, ROUND(HIREDATE,'MONTH') FROM EMP WHERE DEPTNO=10;

SELECT SYSDATE, ROUND(SYSDATE, 'DAY') FROM DUAL;
--DAY를 기준으로 할 때는 한주가 시작되는 날짜


/*
변환 함수
    - 자료형을 변환시키고자 할때 사용하는 함수
    TO_CHAR : 날짜형 또는 숫자형을 문자형으로 변환
    TO_DATE : 문자형을 날짜형으로 변환
    TO_NUMBER : 문자형을 숫자형으로 변환

    날짜
    YYYY : 년도를 4자리
    YY : 년도를 2자리
    MM : 월을 숫자로
    MON : 월을 알파벳으로
    DD : 일을 표시
    DAY : 요일 표시
    DY : 요일을 약어로 표시
*/

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 문] 사원들의 입사일을 출력하되 요일까지 함께 출력하라.
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY/MM/DD DAY')입사일 FROM EMP WHERE DEPTNO = 10;
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY/MM/DD DY')입사일 FROM EMP WHERE DEPTNO = 10;

INSERT INTO EMP VALUES (7777,'권혁진','DEV',7788,TO_DATE('19-01-01', 'YY-MM-DD'),3000,NULL,40);

SELECT ENAME, TO_CHAR(HIREDATE , 'YYYY/MM/DD DY') FROM EMP WHERE ENAME='권혁진';


/*
시간 출력 형식의 종류

종류              설명
AM 또는 PM        오전, 오후 시각 표시
A.M 또는 P.M      오전, 오후 시각 표시
HH 또는 HH12      시간(24) 또는 시간(1-12)
MI               분 표시
SS               초 표시
*/


/*
숫자형을 문자형으로 변환

숫자 출력 형식

0 : 자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 제출
9 : 자릿수를 나타내며 자릿수가 맞지 않으면 채우지 않는다.
L : 각 지역별 통화 기호를 앞에 표시
. : 소수점
, : 천 단위 자리 구분

EX)
12345.67 : 999,999,999  1,234,567
12345.67 : 99999        12345
12345.67 : $999,999,999 $1,234,567
12345.67 : L999,999,999 ￦1,234,567

*/
SELECT ENAME,SAL, TO_CHAR(SAL,'L999,999') FROM EMP WHERE DEPTNO=10;
SELECT ENAME,SAL, TO_CHAR(123457,'L999,999') FROM EMP WHERE DEPTNO=10;

-- 문] 1981년 2월 20일에 입사한 사원을 검색하여 출력하라
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE=('81/02/20');
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE= TO_DATE(19810220,'YYYYMMDD');


-- 오늘을 기준으로 며칠이 지났는지 날짜 계산
SELECT TRUNC (SYSDATE-TO_DATE(19950314,'YYYYMMDD')) FROM DUAL;

-- 사원 테이블에서 입사일로부터 오늘 날짜 까지 며칠이 지났는지 출력하시오  
SELECT TRUNC(SYSDATE - TO_DATE(hiredate , 'YYYY/MM/DD')) from emp where deptno = 10;


-- 숫자형으로 변환하는 함수 TO_NUMBER

-- SELECT '10,000'+'20,000' FROM DUAL ; 오류
SELECT TO_NUMBER('10,000','999,999')+TO_NUMBER('20,000','999,999')FROM DUAL;

/*
일반 함수

NVL : 첫번째 인자로 받은 값이 NULL과 같으면 두번재 인자 값으로 변경
DBCODE : 첫번째 인자로 받은 조건에 맞춰 변경
CASE : 조건에 맞는 문장을 수행함

*/
-- 1. NULL 을 다른 값으로 변환하는 NVL함수

-- NULL을 0으로 변환
-- 0또는 다른값으로 변환하기 위해 사용하는 함수

SELECT * FROM EMP;


-- 영업사원이 아닌 사원들의 커미션을 NULL로 지정되어 있음
-- NULL을 0으로 변경


SELECT ENAME, SAL, COMM , NVL(COMM,0),JOB FROM EMP ORDER BY JOB; 


--문] 연봉을 계산하기 위해서 급여에 12를 곱한 후 커미션을 더하여 출현하시오

SELECT ENAME 이름,SAL 월급,SAL*12+NVL(COMM,0)연봉 FROM EMP ORDER BY ENAME;

--문] 모든 사원은 자신의 상관이 있다. 하지만 사원테이블에 유일한 상관이 없는 행이 있는데
--   그 사원의 매니저(MGR) 컬럼값이 NULL이다. 상관이 없는 사원 만 출력하되 
--   매니저 컬럼 값을 NULL 대신 CEO로 변경하여 출력
-- 
SELECT * FROM EMP;

SELECT ENAME,JOB,NVL(TO_CHAR(MGR),'CEO') FROM EMP WHERE MGR IS NULL;



--선택을 위한 DECODE 함수
-- SWITCH - CASE 문과 같이 여러가지의 경우에 대해서 선택 할 수 있는 함수

SELECT DEPTNO,DECODE(DEPTNO,10,'ACCOUTING',
20,'RESERCH',30,'SALES',40,'OPERATIONS')AS DNAME FROM EMP;

-- 조건에 따라 서로 다른 처리가 가능한 CASE 함수
SELECT ENAME,DEPTNO,CASE WHEN DEPTNO=10 THEN 'ACCOUNTING'
                        WHEN DEPTNO=20 THEN 'RESERCH'
                        WHEN DEPTNO=30 THEN 'SALES'
                        WHEN DEPTNO=40 THEN 'OPERATING'
END DNAME FROM EMP;

--DECODE 함수로 처리하시오
--문] 직급에 따하 급여를 인상하도록 하자 
--    사원번호, 사원명, 직급, 급여를 출력
-- 직급이 ANALIST 인 사원은 5% SALESMAN 10% MANAGER 15% CLERK 20%
SELECT * FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL ,CASE WHEN JOB='ANALIYST' THEN SAL*1.05
                                      WHEN JOB='SALESMAN' THEN SAL*1.10
                                        WHEN JOB='MANAGER' THEN SAL*1.15
                                        WHEN JOB='CLERK' THEN SAL*1.20
END 인상률 FROM EMP;                                        


SELECT EMPNO, ENAME, SAL, DECODE(
job, 'CLERK', SAL*1.20,'MANAGER',SAL*1.15,'SALESMAN',SAL*1.10,'ANALYST', SAL*1.05)인상률 from emp;

/*

그룹함수 : 하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과로 나타냄
    -sum : 합계 
    -avg :  평균
    -count : 개수
    -max :  최대값
    -min :  최소값
    -stddev : 그룹의 표준편차를 구함
    -variance : 그룹의 분산의 구함
    
*/


SELECT sum(sal) from emp;
SELECT avg(sal) from emp;
SELECT min(sal) ,max(sal) from emp;

-- 커미션을 받은 사원의 수
SELECT count (comm) from emp;

--전체 사원의 수와 커미션을 받은 사원의 수
select count (*) ,count(comm) from emp;

-- 사원테이블에서 직업을 개수를 구하시오
-- DISTINCT 중복제거
SELECT count(DISTINCT job) from emp;

-- 문] 사원들의 부서번호 기준으로 (10,20,30)으로 그룹지어 출력
SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL),AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, MIN(SAL),MAX(SAL) FROM EMP GROUP BY DEPTNO;

-- 문] 부서별로 사원의 수와 커미션을 받은 사운의 수를 카운트해서 출력
SELECT COUNT(DEPTNO), COUNT(COMM) FROM EMP GROUP BY DEPTNO;
SELECT * FROM EMP;


-- HAVING 조건
-- 그룹의 결과를 제한 할때는 HAVING 절을 사용함
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) >=2000;
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) <=2000;
SELECT deptno,max(sal),min(sal) from emp group by deptno having max(sal) >=2900;






