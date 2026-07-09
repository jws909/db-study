-- 1.
-- Professor 테이블에서 
-- 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 출력하세요.
-- 단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.
SELECT
    PROFNO,
    NAME,
    PAY,
    BONUS,
    PAY*12 + NVL(BONUS, 0) TOTAL
FROM PROFESSOR
WHERE DEPTNO = 201;

-- 2.
-- emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 
-- comm 값이 있을 경우 'Exist' 을 출력하고 
-- comm 값이 null 일 경우 'NULL' 을 출력하세요.
SELECT
    EMPNO,
    ENAME,
    COMM,
    NVL2(COMM, 'Exist', 'NULL') NVL2
FROM EMP
WHERE DEPTNO = 30;