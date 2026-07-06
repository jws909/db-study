/*-------------------*/
1. 조회하기 SELECT

SELECT 조회대상(컬럼명) FROM 테이블명;
조회대상 * : 전체컬럼 ALL

테이블 구조 확인 (Describe)
DESC 테이블명;
desc emp;


select * from dept;
SELECT * FROM DEPT;

SELECT * FROM FRUIT;  -- fruit 테이블의 모든 컬럼 데이터 조회
SELECT * FROM LOAN;
SELECT * FROM PRODUCT; -- product 테이블의 모든 컬럼 조회

SELECT * FROM EMP;
SELECT JOB FROM EMP;
SELECT JOB, HIREDATE, MGR FROM EMP;

--가독성
SELECT
    JOB,
    HIREDATE,
    MGR
FROM EMP;

SELECT * FROM EMP;

SELECT *
FROM EMP;

/*----------------------*/
-- 컬럼명 별도 지정 (별칭 지정)
SELECT
    컬럼명 AS "컬럼별칭",
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭
FROM 테이블명;

SELECT
    EMPNO AS "사원번호",
    ENAME "사원명",
    JOB 직업,
    SAL "급여 데이터"
FROM EMP;

SELECT
    EMPNO, 
    EMPNO EMPNUMBER, 
    EMPNO EMPLOYEENO
FROM EMP;


/*----------------------*/
--조회데이터 리터럴 값 활용

SELECT '문자', 123 FROM EMP;
SELECT '문자', 123, EMPNO FROM EMP;

SELECT '문자', 123 FROM DEPT;
SELECT * FROM DEPT;

SELECT '문자', 123 FROM DUAL; --dual 임시테이블
SELECT * FROM DUAL;

SELECT 
    '문자확인' AS "문자컬럼별칭",
    123+234-33 숫자연산결과
FROM DUAL;

SELECT DNAME, LOC, '문자안녕', 12345 FROM DEPT;
SELECT '문자''작은따옴표' FROM DUAL;
SELECT Q'[이 안에다가 문자를 '작은"큰 이렇게]' FROM DUAL;
-- Q'[문자작성]'

/*----------------------*/
-- 문자 이어 붙이기  ||

SELECT '문자' || '이어붙이기' FROM DUAL;
SELECT * FROM DEPT;
SELECT DEPTNO, DNAME FROM DEPT;
SELECT DEPTNO || DNAME FROM DEPT;
SELECT
    '부서번호 : ' || DEPTNO AS "부서번호",
    DEPTNO,
    '부서번호+500 = ' || (DEPTNO + 500) 부서번호더하기500
FROM DEPT;


/*----------------------*/
-- DISTINCT 중복제거
SELECT * FROM EMP;
SELECT JOB FROM EMP;
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT(JOB) FROM EMP;

SELECT DISTINCT JOB, DEPTNO FROM EMP;
