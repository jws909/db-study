-- 1.
-- student , department
-- 이름이 'Anthony Hopkins' 인 학생과 1전공이 동일한 학생들의 정보 
-- (이름, 학과번호, 학과이름) 출력하기.
SELECT * FROM STUDENT;
SELECT
    S.NAME,
    S.DEPTNO1,
    D.DNAME
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
AND S.DEPTNO1 = (SELECT DEPTNO1
                 FROM STUDENT
                 WHERE NAME = 'Anthony Hopkins')
ORDER BY S.NAME;

SELECT
    NAME, DEPTNO1,
    (SELECT DNAME
     FROM DEPARTMENT
     WHERE DEPTNO = DEPTNO1) DNAME
FROM STUDENT
WHERE DEPTNO1 = (SELECT DEPTNO1
                 FROM STUDENT
                 WHERE NAME = 'Anthony Hopkins')
ORDER BY NAME;

-- 2.
-- professor, department 테이블 활용. 
-- 이름이 'Meg Ryan' 인 교수보다 나중에 입사한 사람의 이름, 입사일, 학과명 을 출력하세요.
SELECT * FROM PROFESSOR;
SELECT
    P.NAME,
    P.HIREDATE,
    D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE P.DEPTNO = D.DEPTNO
AND P.HIREDATE > (SELECT HIREDATE
                  FROM PROFESSOR
                  WHERE NAME = 'Meg Ryan')
ORDER BY P.HIREDATE;

-- 3.
-- student 테이블, 1전공이 201번 학과의 평균 몸무게보다 
-- 몸무게가 많이 나가는 학생들의 이름과 몸무게 출력하세요.
SELECT NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT > (SELECT AVG(WEIGHT)
                FROM STUDENT
                WHERE DEPTNO1 = 201)
;

-- 4.
-- emp2, dept2 테이블을 참고하여,
-- 근무지역이 포항인 모든 사원들의 사번, 이름, 부서번호 출력하기!!
SELECT * FROM EMP2;
SELECT * FROM DEPT2;
SELECT EMPNO, NAME, DEPTNO
FROM EMP2
WHERE EXISTS (SELECT DCODE
              FROM DEPT2
              WHERE AREA = 'Pohang Main Office'
              AND DCODE = DEPTNO)
;
