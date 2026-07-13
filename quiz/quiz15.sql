--1.
-- student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
-- 각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.
-- 학번 이름 점수 학점 순으로 조회하세요.
SELECT
    S.STUDNO 학번, S.NAME 이름, SC.TOTAL 점수, H.GRADE 학점
FROM STUDENT S, SCORE SC, HAKJUM H
WHERE S.STUDNO = SC.STUDNO
AND SC.TOTAL BETWEEN H.MIN_POINT AND H.MAX_POINT
ORDER BY 점수 DESC;

--2.
--student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.
--위 내역에서 101, 102 학과에 속한 학생들의 정보만 보여주세요.
SELECT
    S.STUDNO 학번, S.NAME 이름, SC.TOTAL 점수, H.GRADE 학점
FROM STUDENT S, SCORE SC, HAKJUM H
WHERE S.DEPTNO1 IN (101, 102)
AND S.STUDNO = SC.STUDNO
AND SC.TOTAL BETWEEN H.MIN_POINT AND H.MAX_POINT
ORDER BY 점수 DESC;

-- 3.
--학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 을 Join하여
--301학과 속한 교수를 제외한 교수를 지도교수로 두고 있는
--학생의 이름과 학생의 학년, 학생의 지도교수 이름, 지도교수의 학과 번호, 지도교수가 속한 학과이름을 출력하세요.
SELECT 
    S.NAME 학생이름, S.GRADE 학생학년,
    P.NAME 교수이름, P.DEPTNO 교수학과번호, D.DNAME 교수소속학과이름
FROM STUDENT S, PROFESSOR P, DEPARTMENT D
WHERE S.PROFNO = P.PROFNO
AND P.DEPTNO = D.DEPTNO
AND P.DEPTNO <> 301;

SELECT
    S.NAME 학생이름, S.GRADE 학생학년,
    P.NAME 교수이름, P.DEPTNO 교수학과번호, D.DNAME 교수소속학과이름
FROM
    STUDENT S
    INNER JOIN PROFESSOR P
    ON S.PROFNO = P.PROFNO
    INNER JOIN DEPARTMENT D
    ON P.DEPTNO = D.DEPTNO
WHERE P.DEPTNO != 301;

