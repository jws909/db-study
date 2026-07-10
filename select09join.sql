/*------------------------------------------*/
JOIN 조인

--JOIN 기준 -> 어떤 것(컬럼/값)을 기준으로 테이블 데이터를 합쳐서(연결) 조회

SELECT * FROM EMP;  --DEPTNO 컬럼 부서번호
SELECT * FROM DEPT; -- 부서정보 테이블 DEPTNO 컬럼(식별자)

--SELECT *
SELECT EMPNO,ENAME, DNAME, LOC, E.DEPTNO
--FROM EMP A, DEPT B
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT EMPNO,ENAME, DNAME, LOC, E.DEPTNO
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--EMP, DEPT 조인 + 부서번호 20, 30 번 부서만 조회

-- 오라클 방식 (비 ANSIJOIN 쿼리)
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO IN (20, 30);

-- ANSIJOIN 쿼리
SELECT EMPNO,ENAME, DNAME, LOC, E.DEPTNO
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IN (20, 30);


/*------------------------------------------*/
SELECT *
FROM EMP E, DEPT D; -- 조인 조건 누락 -> 카티션 곱

----------------------------------------------

SELECT * FROM STUDENT;      --PROFNO 교수번호 컬럼
SELECT * FROM PROFESSOR;    --PROFNP 교수번호 컬럼

SELECT 
    S.NAME 학생명, P.NAME 교수명, S.STUDNO, P.PROFNO, P.EMAIL
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO;

SELECT
    S.NAME 학생명, P.NAME 교수명, S.STUDNO, P.PROFNO, P.EMAIL
FROM STUDENT S INNER JOIN PROFESSOR P ON S.PROFNO = P.PROFNO;



/*------------------------------------------*/
INNER JOIN vs OUTER JOIN

select s.name 학생명, p.name 교수명, s.studno, p.profno, p.email
from student s, professor p
where s.profno = p.profno;
--학생X교수 -> 15개

select COUNT(*) from student;    --20명
select COUNT(*) from professor;  --16명

-- INNER JOIN 수행 -> 조인기준에 따라서 합침 ( profno 가 같은가? ) -> profno null이면 비교불가 -> 제외

select *
from student s, professor p
--where s.profno = p.profno;  inner join
where s.profno = p.profno(+);
--where p.profno(+) = s.profno;
--where s.profno(+) = p.profno;
--where p.profno = s.profno(+);


select s.studno, s.name,
    NVL2(s.profno, '지도교수배정완료', '지도교수배정요망') 배정여부,  --DECODE   CASE WHEN
    s.profno,  p.profno, p.name
--select *
from student s LEFT OUTER JOIN professor p
--from professor p LEFT OUTER JOIN student s
--from student s RIGHT OUTER JOIN professor p
--from professor p RIGHT OUTER JOIN student s
ON s.profno = p.profno; 


/*----------------------------------*/
JOIN 결과 갯수

--INNER 
select COUNT(*) 
from student s, professor p
where s.profno = p.profno;
>> 15개    학생20 교수16   학생에 교수배정 null 5개 -> 제외  
               이너조인으로 연결 가능한 대상 15개 -> 결과 15개

-- OUTER
select COUNT(*) 
from student s, professor p
where s.profno = p.profno(+);
>> 20개    학생기준 OUTERJOIN
          학생20 기준 -> null 이어도 유지 -> 결과 20개
  
select *
--select COUNT(*)
from professor p, student s
where p.profno = s.profno(+);
>> 22개      교수갯수 16개  -> 학생 20개  학생 null


--지도학생이 없는 교수의 수는?
select COUNT(*)
--select *
from professor p, student s
where p.profno = s.profno(+)
AND s.studno is null;