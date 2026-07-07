-- 1)
SELECT
    DEPTNO AS "부서번호",
    DNAME AS "부서이름",
    LOC AS "위치"
FROM DEPT;

-- 2)
SELECT 
    NAME || '(' || ID || ')' AS "교수정보",
    POSITION,
    HIREDATE AS "입사일자",
    EMAIL AS "이메일"
FROM PROFESSOR;