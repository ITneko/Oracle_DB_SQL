/*
====================================================
                2020-06-06 연습
====================================================
*/
-- 문] 단어 '안녕' 과 '디지몬'을 합쳐서 출력(단 concat 함수 사용)
select concat('안녕', '디지몬') from dual;

-- 문] '안녕디지몬' 의 문자열 길이를 출력
select length('안녕디지몬') from dual;

-- 문] '안녕디지몬'에서 안녕만 출력
select substr('안녕디지몬', -5, 2) from emp;

-- 문] job이 cl로 시작하며 comm 은 널값이며 월급이 900이상인 사원의 사원번호와 이름, 월급, 직급 을 출력하시오
select * from emp;
select empno, ename, sal, job from emp where job like 'CL%' and comm is null and sal>=900;
select empno,ename,sal,job from emp where substr(job,1,2) like 'CL' and comm is null and sal>=900;

-- 문] SMITH란 사람의 이름에서 S와 H를 잘라내고 출력하시오. TRIM
SELECT TRIM('S' FROM ENAME), TRIM('H' FROM ENAME) FROM EMP WHERE ENAME='SMITH';

-- 문] 절대값 -16을 정수로 바꿔서 출력
SELECT ABS(-16) FROM DUAL;

-- 문] 소수점 아래는 아예 없애는 함수 123.45678를 123으로 구현
SELECT FLOOR(123.45678) FROM DUAL;

-- 문] 소숫점 2 자릿수까지 구현 123.45678
SELECT ROUND(123.45678, 2) FROM DUAL;

-- 문] MOD : 나머지 값을 반환
SELECT MOD(34,2),MOD(34,5),MOD(34,7) FROM Dual;

-- 문] 시스템에 저장된 현재 날짜를 반환
SELECT SYSDATE FROM DUAL;


/*
====================================================
                2020-06-07 연습
====================================================
*/
-- 1. 테이블 만들기
CREATE TABLE 사원목록(
EMPNO NUMBER(4) -- 사번
,ENAME VARCHAR2(10) -- 이름
,JOB VARCHAR2(9) -- 직급
,MGR NUMBER(4) -- 매니저 정보
,HIREDATE DATE -- 입사일
,SAL NUMBER(7,2) -- 급여
,COMM NUMBER(7,2) -- 커미션(보너스)
,DEPTNO NUMBER(2) -- 부서코드
);

SELECT * FROM 사원목록;

-- 2. 행 추가
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7369, '개나리', '사원', 7902, '2000-12-17',200,20);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7499, '진달래', '주임', 7698, '2001-12-15',360,20);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7521, '라일락', '주임', 7698, '2001-02-17',355,30);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7654, '손흥민', '과장', 7839, '2002-01-11',400,30);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7698, '박지성', '주임', 7698, '2000-07-12',325,20);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7782, '김연아', '사원', 7698, '2001-12-17',225,10);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7778, '무궁화', '사원', 7839, '2005-11-14',200,10);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7839, '홍길동', '부장', 7566, '2006-06-17',450,20);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7844, '송강호', '과장', 7566, '2018-09-17',400,30);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7876, '정우성', '대표', 7839, '2004-09-09',500,30);
INSERT INTO 사원목록(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO) VALUES (7900, '김혜수', '사원', 7902, '2001-12-03',200,20);

-- 3. 문제
-- 1) 테이블의 필드 목록을 확인하시오 (사번과 이름)
SELECT * FROM 사원목록;

-- 2) 사원이름순 (오름차순) 정렬하시오
SELECT * FROM 사원목록 ORDER BY ENAME;

-- 3) 사원이름순(내림차순) 정렬하시오
SELECT * FROM 사원목록 ORDER BY ENAME DESC;

-- 4) 급여 내림차순으로 사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오
SELECT ENAME, SAL, DEPTNO FROM 사원목록 ORDER BY SAL DESC;

-- 5) 부서코드 오름차순, 급여 내림차순으로 사원이름(ename), 급여(sal), 부서코드(deptno)를 조회하시오  
SELECT ENAME, SAL, DEPTNO FROM 사원목록 ORDER BY DEPTNO ASC, SAL DESC;

-- 6) 이름(ename)/입사일자(hiredate)/부서코드(deptno)를 부서코드 오름차순, 입사일자(hiredate) 오름차순으로 조회하시오
SELECT ENAME, HIREDATE, DEPTNO FROM 사원목록 ORDER BY DEPTNO ASC, HIREDATE ASC;

-- 7) 직급(job) 칼럼의 중복데이터를 하나씩만 조회하시오
SELECT DISTINCT(JOB) FROM 사원목록;

-- 8) emp테이블의 job 오름차순, sal 내림차순으로 정렬해서 ename 이름, job 직급, sal 급여 칼럼명으로 별칭을 바꿔서 조회하시오
SELECT ENAME 이름, JOB 직급, SAL 급여 FROM 사원목록 ORDER BY JOB ASC, SAL DESC;

-- 9) 급여가 100보다 많고 400보다 작은 직원 조회하기(급여 내림차순)
SELECT ENAME, SAL FROM 사원목록 WHERE SAL>100 AND SAL<400 ORDER BY SAL DESC;

-- 10) 급여가 100이하 또는 400 이상의 직원 검색하기(급여 내림차순)
SELECT ENAME, SAL FROM 사원목록 WHERE SAL>=100 OR SAL<=400 ORDER BY SAL DESC;

-- 11) 직급(job)이 과장 또는 부장인 직원들을 이름순으로 조회하시오
SELECT ENAME,JOB FROM 사원목록 WHERE JOB='과장' OR JOB='부장';

-- 12) 부서코드(deptno)가 30인 직원을 조회하시오
SELECT * FROM 사원목록 WHERE DEPTNO=30;

-- 13) 중복된 부서코드를 한개씩만 조회하시오
SELECT DISTINCT(DEPTNO) FROM 사원목록;

-- 14) 부서코드가 10 또는 20 또는 30인 직원을 조회하시오 (or, in연산자 각각 활용해서 조회)
SELECT ENAME, DEPTNO FROM 사원목록 WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=30;
SELECT ENAME, DEPTNO FROM 사원목록 WHERE DEPTNO IN (10,20,30);

-- 15) 급여가 300~500인 직원을 급여순으로 조회하시오 (and, between연산자 각각 활용해서 조회)
SELECT ENAME, SAL FROM 사원목록 WHERE SAL BETWEEN 300 AND 500;
SELECT ENAME, SAL FROM 사원목록 WHERE SAL>=300 AND SAL<=500;

-- 16) 이름이 무궁화 조회하시오
SELECT * FROM 사원목록 WHERE ENAME='무궁화';

-- 17) 김씨성을 조회하시오
SELECT * FROM 사원목록 WHERE ENAME LIKE '김%';

-- 18) 이름에 '화' 포함된 줄을 조회하시오
SELECT * FROM 사원목록 WHERE ENAME LIKE '%화%';

-- 19) 연봉을 아래와 같이 구한후 이름, 급여, 커미션, 연봉을 조회하시오. (연봉구하는 식 : 급여(sal)*12개월+보너스(comm))
SELECT ENAME 이름, SAL 월급, NVL(COMM,0) 보너스, SAL*12+NVL(COMM,0) 연봉 FROM 사원목록;

-- 20) 커미션이 null이면 0으로 바꾼후 연봉을 다시 계산해서 이름, 급여, 커미션, 연봉을 조회하시오
SELECT ENAME 이름, SAL 월급, NVL(COMM,0) 보너스, SAL*12+NVL(COMM,0) 연봉 FROM 사원목록;

-- 21) 각 사람의 급여를 검색해서 '누구누구의 급여는 얼마입니다'로 조회하시오 (|| 결합연산자)
SELECT ENAME ||'의 급여는 ' || SAL ||'만원 입니다.' 급여명단 FROM 사원목록;

-- 22) 다음의 SQL문을 분석하시오
 select empno, sal from emp 
 where not(sal>200 and sal<300)
 order by sal; 

-- 23) 다음의 SQL문을 분석하시오
select empno, sal from emp 
 where not sal>200 and sal<300 
 order by sql; 

/*
    <연산자 우선순위>
   () 괄호 : 연산자 우선순위보다 우선함
   1순위   : 비교연산자, SQL연산자, 산술연산자
   2순위   : not
   3순위   : and
   4순위   : or
   5순위   : 결합연산자
*/

-- 24) emp테이블에서 입사일(hiredate)이 2005년 1월 1일 이전인 사원에 대해 사원의 
-- 이름(ename), 입사일, 부서번호(deptno)를 입사일순으로 조회하시오
SELECT ENAME, HIREDATE, DEPTNO FROM 사원목록 WHERE HIREDATE<TO_DATE('20050101','YYYYMMDD') ORDER BY HIREDATE;
SELECT ENAME, HIREDATE, DEPTNO FROM 사원목록 WHERE HIREDATE<'20050101' ORDER BY HIREDATE;

-- 25) emp테이블에서 부서번호가 20번이나 30번인 부서에 속한 사원들에 대하여 
-- 이름, 직업코드(job), 부서번호를 이름순으로 조회하시오 (or, in연산자 각각 활용해서 모두 조회)
SELECT ENAME, JOB, DEPTNO FROM 사원목록 WHERE DEPTNO=20 OR DEPTNO=30;
SELECT ENAME, JOB, DEPTNO FROM 사원목록 WHERE DEPTNO IN (20,30);







