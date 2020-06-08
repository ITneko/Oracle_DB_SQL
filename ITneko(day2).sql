/*
create, alter, from : 객체생성, 변경, 삭제

create table 테이블명(
컬럼명 자료형(크기)
);

컬럼을 정의 할 때 지정 할 수 있는 자료형
char(size) : 1~2000byte // 고정 데이터
varchar2(size) : 1~4000byte 까지 지정(가변) // 지정한 데이터에 의해서 데이터의 크기가 늘었다 줄었다함
number(size, 소수점자리수(생략가능)) : number(9), number(9,2);
date : bc 4712년 1월 1일부터 ad 4712년 12월 31일까지의 날짜
long : 가변길이 문자형 데이터 타입 최대 크기(2GByte)
        하나의 테이블중에 오직 하나의 long 타입 컬럼만 지정
lob : 바이너리 가변길이(이미지, 문서 실행 파일을 저장할 수 있음): 2GByte까지 설정가능


-- 테이블 명과 컬럼명을 만드는 규칙

1. 반드시 문자로 시작해야함
2. 1 - 30자 까지 가능
3. A - Z 까지의 대문자와 0-9까지의 숫자, 특수문자(_,$,#)만 가능
4. 오라클에서 사용되는 예약어 및 다른 객체명과 중복 불가
5. 공백 허용 안함

*/

-- 사원번호, 사원이름, 급여, 3개의 컬름으로 구성된 EMP01 테이블 생성
CREATE TABLE EMP01(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
SAL NUMBER(5));

SELECT * FROM EMP01;

-- 테이블 구조 확인
DESC EMP01; 

-- 데이터 추가
INSERT INTO EMP01 VALUES(1112,'권혁진',600);
INSERT INTO EMP01 VALUES(1113,'김대원',600);
INSERT INTO EMP01 (ENAME, SAL) VALUES('김유신',600);

-- 2번째 중복 데이터 제거
DELETE FROM EMP01 a
      WHERE ROWID > (SELECT MIN(ROWID) 
                       FROM EMP01 b
                      WHERE b.ENAME = a.ENAME);

-- 3번째 중복 데이터 제거             
DELETE FROM EMP01 a
      WHERE ROWID < (SELECT MAX(ROWID) 
                       FROM EMP01 b
                        WHERE a.ENAME = b.ENAME);


CREATE TABLE NUM_TEMP(
N1 NUMBER,
N2 NUMBER(9),
N3 NUMBER(9,2),
N4 NUMBER(9,1),
N5 NUMBER(7),
N6 NUMBER(7,-2),
N7 NUMBER(6),
N8 NUMBER(3,5)
);

DESC NUM_TEMP;

INSERT INTO NUM_TEMP(N1,N2,N3,N4,N5,N6) 
VALUES (1234567.89, 1234567.89,1234567.89,1234567.89,1234567.89,1234567.89);

SELECT * FROM num_temp;


-- 테이블 복사
CREATE TABLE EMP02 AS SELECT * FROM EMP01;

SELECT * FROM EMP02;


/*
ALTER TABLE : 테이블 구조 변경
ADD COLUMN : 새로운 컬럼 추가
MODIFY COLUMN : 기존 컬럼 재정의
DROP COLUMN : 컬럼 삭제
*/

DESC EMP01;
-- EMP01 테이블에 JOB컬럼 추가
ALTER TABLE EMP01 ADD (JOB VARCHAR2(9));
DESC EMP01;

-- 문제 EMP01 테이블에 입사일을 추가하시오.
ALTER TABLE EMP01 ADD (HIREDATE DATE);
DESC EMP01;

-- 테이블 구조 변경 컬럼 크기변경
ALTER TABLE EMP01 MODIFY(JOB VARCHAR2(30));

-- 테이블 구조 변경 컬럼 제거
ALTER TABLE EMP01 DROP COLUMN JOB;

CREATE TABLE EMP03 AS SELECT * FROM EMP01 WHERE 1=0;
SELECT * FROM EMP03;
DESC EMP03;

-- delete 명령으로 삭제한 경우는 rollback 명령으로 복구됨
--truncate로 내용을 지울경우 rollback 불가

-- 테이블 내의 데이터 삭제
delete from emp02;
ROLLBACK;
select * from emp02;
-- delete 명령으로 삭제한 경우는 rollback 명령으로 복구됨
--truncate로 내용을 지울경우 rollback 불가
TRUNCATE table emp02;
desc emp02;

select * from emp; -- emp01
select * from dept; -- dept01

create table emp03 as select * from emp;
create table dept01 as select * from dept;
--------------------------------------------------------------------------------

select * from emp01;
select * from dept01;

--문] 모든 사원의 부서번호를 30번으로 수정하시오
update emp01 set deptno=30;

-- 문 ] 모든 사원의 급여를 10% 인상
update emp01 set sal= sal*1.1;
rollback;











