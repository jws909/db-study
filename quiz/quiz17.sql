-- 1. 
-- 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 
-- 학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.
SELECT
    S.NAME STU_NAME, S.DEPTNO1, D.DNAME DEPT_NAME
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
ORDER BY S.DEPTNO1;

-- 2. emp2 테이블과 p_grade 테이블을 조회하여
-- 현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
-- 해당 직급의 연봉의 하한금액과
-- 상한 금액을 아래 결과 화면과 같이 출력하세요.
SELECT
    E.NAME, E.POSITION, 
    TO_CHAR(E.PAY, '999,999,999') PAY,
    TO_CHAR(P.S_PAY, '999,999,999') "LOW PAY", 
    TO_CHAR(P.E_PAY, '999,999,999') "HIGH PAY"
FROM EMP2 E, P_GRADE P
WHERE E.POSITION = P.POSITION(+)
AND E.POSITION IS NOT NULL;

-- 3. Emp2 테이블과 p_grade 테이블을 조회하여
-- 사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
-- 예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
-- 나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.
SELECT
    E.NAME,
    2010 - TO_NUMBER(TO_CHAR(E.BIRTHDAY, 'YYYY'))+1 한국나이,
    E.POSITION 지금포지션,
    P.POSITION 그나이에맞는포지션
FROM EMP2 E, P_GRADE P
WHERE 2010 - TO_NUMBER(TO_CHAR(E.BIRTHDAY, 'YYYY'))+1 
        BETWEEN P.S_AGE AND P.E_AGE
ORDER BY 한국나이;

-- 4. 
-- customer 테이블과 gift 테이블을 Join하여 
-- 고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때 
-- Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.
SELECT 
    C.GNAME, C.POINT, G.GNAME
FROM CUSTOMER C, GIFT G
WHERE C.POINT >= G.G_START
--AND G.GNAME = 'Notebook';
AND G.GNO = 7;

-- 5. 
-- professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
-- 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
SELECT
    P.PROFNO, P.NAME, P.HIREDATE,
    COUNT(PC.PROFNO) COUNT
FROM PROFESSOR P, PROFESSOR PC
WHERE P.HIREDATE > PC.HIREDATE(+)
GROUP BY P.PROFNO, P.NAME, P.HIREDATE
ORDER BY COUNT;

-- 6. 
-- emp 테이블에서 사원번호,
-- 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요. 
-- 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
SELECT
    E.EMPNO, E.ENAME, E.HIREDATE,
    COUNT(EC.EMPNO) COUNT
FROM EMP E, EMP EC
WHERE E.HIREDATE > EC.HIREDATE(+)
GROUP BY E.EMPNO, E.ENAME, E.HIREDATE
ORDER BY COUNT;

SELECT
    EMPNO, ENAME, HIREDATE,
    RANK() OVER (ORDER BY HIREDATE) - 1 AS "COUNT"
FROM EMP;