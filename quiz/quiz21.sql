-- 1.
-- student, department 테이블 활용
-- 학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
SELECT
    D.DNAME,
    DMH.MAX_HEIGHT,
    S.NAME,
    S.HEIGHT
FROM STUDENT S, DEPARTMENT D, (SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT
                               FROM STUDENT
                               GROUP BY DEPTNO1) DMH
WHERE S.DEPTNO1 = DMH.DEPTNO1
AND S.HEIGHT = DMH.MAX_HEIGHT
AND D.DEPTNO = DMH.DEPTNO1;

-- 2.
-- student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
-- 해당 학년의 평균 키를 출력 하세요.
-- (학년 컬럼으로 오름차순 정렬해서 출력하세요)
SELECT
    S.GRADE,
    S.NAME,
    S.HEIGHT,
    AH.AVG_HEIGHT
FROM STUDENT S, (SELECT GRADE, AVG(HEIGHT) AVG_HEIGHT
                 FROM STUDENT
                 GROUP BY GRADE) AH
WHERE S.GRADE = AH.GRADE 
AND S.HEIGHT > AH.AVG_HEIGHT
ORDER BY GRADE;