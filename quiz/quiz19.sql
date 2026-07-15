-- 1.
-- emp2 테이블 활용
-- 직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
SELECT NAME, POSITION, PAY 
FROM EMP2
WHERE PAY > (SELECT MIN(PAY)
             FROM EMP2
             WHERE POSITION = 'Section head')
ORDER BY PAY DESC;

SELECT NAME, POSITION, PAY 
FROM EMP2
WHERE PAY >ANY (SELECT PAY
                FROM EMP2
                WHERE POSITION = 'Section head')
ORDER BY PAY DESC;

-- 2.
-- Student 테이블.
-- 전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적게 나가는 학생보다
-- 몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT < (SELECT MIN(WEIGHT)
                FROM STUDENT
                WHERE GRADE = 2);

SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT <ALL (SELECT WEIGHT
                   FROM STUDENT
                   WHERE GRADE = 2);
-- 3.
-- emp2, dept2 활용
-- 각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
-- 부서명, 직원명, 연봉 출력
SELECT
    D.DNAME,
    E.NAME,
    E.PAY
FROM EMP2 E, DEPT2 D
WHERE E.PAY < (SELECT MIN(D_AVG_PAY)
               FROM (SELECT AVG(PAY) D_AVG_PAY
                     FROM EMP2
                     GROUP BY DEPTNO))
AND E.DEPTNO = D.DCODE
ORDER BY PAY DESC;

SELECT
    D.DNAME,
    E.NAME,
    E.PAY
FROM EMP2 E, DEPT2 D
WHERE E.PAY <ALL (SELECT AVG(PAY)
                  FROM EMP2
                  GROUP BY DEPTNO)
AND E.DEPTNO = D.DCODE;