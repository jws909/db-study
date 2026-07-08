-- 1.Student 테이블의 birthday 컬럼을 사용하여 
--   생일이 1월인 학생의 이름과 birthday 를 출력하세요.
SELECT
    STUDNO,
    NAME,
    TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') BIRTHDAY
FROM STUDENT
WHERE TO_CHAR(BIRTHDAY, 'MM') = '01';

-- 2.emp 테이블의 hiredate 컬럼을 사용하여 
--   입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.
SELECT
    EMPNO,
    ENAME,
    HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE, 'MM') IN ('01','02','03');