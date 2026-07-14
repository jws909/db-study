/********--------------------*/
서브쿼리 (Sub-Query)

SELECT (쿼리: 스칼라 서브쿼리)
FROM   (쿼리: 인라인 뷰)
WHERE  (쿼리: 서브쿼리)
;

SELECT * FROM EMP;

20번 부서 사람들만 조회
SELECT * FROM EMP
WHERE DEPTNO = 20
;

사번이 7844인 사원과 같은 부서 사람들 조회

SELECT * FROM EMP
WHERE DEPTNO = 30;  --직접 데이터 확인 -> 부서번호 하드코딩


SELECT * FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP
                WHERE EMPNO = 7844);

SELECT DEPTNO FROM EMP  --7844사번을 가진 사원의 부서번호
WHERE EMPNO = 7844;



-------------------------
SELECT * FROM EMP2;
SELECT * FROM DEPT2;

포항 사무실에서 일하는 직원 목록 조회

SELECT * FROM DEPT2
WHERE AREA = 'Pohang Main Office';


-- JOIN
SELECT *
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO = D.DCODE
AND D.AREA = 'Pohang Main Office';

-- 서브쿼리
SELECT *
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office');
                
0001번팀을 제외하고 포항 사무실에서 일하는 직원 목록 조회

SELECT *
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office'
                AND DCODE <> '0001');
                
SELECT *
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office')
AND DEPTNO <> '0001';

------------------------------
SELECT *
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office'
                AND DCODE = DEPTNO);
                
SELECT *
FROM EMP2
WHERE EXISTS (SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office'
                AND DCODE = DEPTNO);
                
SELECT *
FROM EMP2 E2
WHERE EXISTS (SELECT DCODE 
                FROM DEPT2
                WHERE AREA = 'Pohang Main Office'
                AND DCODE = E2.DEPTNO);
                

----------------------------------------
학생 STUDENT

> 학번 9513 학생보다 키 작은 학생들 조회

SELECT * 
FROM STUDENT
WHERE HEIGHT < (SELECT HEIGHT
                FROM STUDENT
                WHERE STUDNO = 9513);

> 2학년 학생들 기준 제일 많은 몸무게보다 더 많은 몸무게 나가는 학생 목록 조회

SELECT *
FROM STUDENT
WHERE WEIGHT > (SELECT MAX(WEIGHT)
                FROM STUDENT
                WHERE GRADE = 2);
                
---- 각 학년별로 가장 큰 몸무게
SELECT *
FROM STUDENT
WHERE WEIGHT <ALL (SELECT MAX(WEIGHT)
                FROM STUDENT
                GROUP BY GRADE);
                
    ANY ALL
    
    < ANY <83          (81 82 83 58)
    < ALL <58
    > ANY >58
    > ALL >83


>> 단일행 비교   = IN
>> 다중행 비교   IN, NOT IN, >ANY ALL
>> 다중컬럼 비교  (컬럼수를 맞춰서 비교)

---- 각 학년별로 가장 큰 몸무게

-- 학년, 몸무게
SELECT *
FROM STUDENT
WHERE WEIGHT IN (SELECT     -- 몸무게만 비교하면, 학년별 최대 몸무게 학생 추출에 문제 발생
                    MAX(WEIGHT)
                 FROM STUDENT
                 GROUP BY GRADE);
                 
SELECT *
FROM STUDENT
WHERE (GRADE,WEIGHT) IN (SELECT GRADE, MAX(WEIGHT)
                         FROM STUDENT
                         GROUP BY GRADE);


--EMP2 기준   전체 평균급여보다 많이 받는 직원 조회
SELECT *
FROM EMP2
WHERE PAY > (SELECT AVG(PAY)
             FROM EMP2);


-- 어떤 특정 사람의 포지션의 평균 급여
SELECT AVG(PAY)
FROM EMP2
WHERE POSITION = (
                    --SELECT POSITION
                    SELECT POSITION
                    FROM EMP2
                    --WHERE NAME = 'AL Pacino';
                    WHERE EMPNO = 19960101);
                    
--EMP2 기준   각자, 자신과 같은 직급(POSITION)의 평균 급여보다 많이 받는 직원 조회

SELECT *
FROM EMP2 A
WHERE PAY > (SELECT AVG(PAY)
             FROM EMP2 B
             WHERE B.POSITION = A.POSITION
             --WHERE POSITION = 현재비교하는대상POSITION
             );
             
----EMP2 기준  자신과 같은 고용형태(EMP_TYPE)의 평균 급여보다 적게 받는 직원목록 조회

SELECT *
FROM EMP2 A
WHERE PAY < (--EMPTYPE 같은 평균급여
             SELECT AVG(PAY)
             FROM EMP2 B
             WHERE B.EMP_TYPE = A.EMP_TYPE);
             


/*******************************************/
SELECT * FROM EMP2;
SELECT * FROM DEPT2;

사원이름 부서번호 부서이름

--JOIN
SELECT E.NAME, E.DEPTNO, D.DNAME
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO = D.DCODE;

--SUBQUERY
SELECT 
    E.NAME, 
    E.DEPTNO,
    (SELECT DNAME
     FROM DEPT2
     WHERE DCODE = E.DEPTNO) DNAME
FROM EMP2 E;

SELECT DNAME
FROM DEPT2
WHERE DCODE = '1007';


SELECT * FROM PANMAE;
SELECT * FROM PRODUCT;

--JOIN
SELECT
    A.P_DATE,
    A.P_CODE,
    B.P_NAME
FROM PANMAE A, PRODUCT B
WHERE A.P_CODE = B.P_CODE;

--Subquery
SELECT
    A.P_DATE,
    A.P_CODE,
    (SELECT P_NAME
     FROM PRODUCT
     WHERE P_CODE = A.P_CODE) 상품명
FROM PANMAE A;




/*******************************************/

SELECT JOB, MGR, SAL, COMM, DEPTNO
FROM EMP;


SELECT EMPNO, ENAME, JOB --SAL FROM 절에 속해있는 SELECT 결과를 테이블(뷰)로 간주
FROM (
    SELECT EMPNO, ENAME, JOB
    --SELECT *
    FROM EMP );
    
SELECT ENUM, EMP_NAME, JJB 
FROM (
    SELECT          --컬럼 별칭을 설정하면 외부에서 조회시 기본 컬럼명으로 인식
        EMPNO ENUM, 
        ENAME EMP_NAME, 
        JOB JJB
    FROM EMP );
    
SELECT *
FROM(
    SELECT E.EMPNO, E.NAME, E.DEPTNO, D.DNAME
    FROM EMP2 E, DEPT2 D
    WHERE E.DEPTNO = D.DCODE);
    
    
    
----EMP2 기준  자신과 같은 고용형태(EMP_TYPE)의 평균 급여보다 적게 받는 직원목록 조회

--SELECT AVG(PAY) -- 함수로 인식돼서 컬럼선택 불가
--SELECT EMP_TYPE, AVG_PAY
SELECT A.NAME, A.PAY, B.EMP_TYPE, B.AVG_PAY
FROM 
    EMP2 A, (
                SELECT EMP_TYPE, TRUNC(AVG(PAY)) AVG_PAY
                FROM EMP2
                GROUP BY EMP_TYPE) B
WHERE A.EMP_TYPE = B.EMP_TYPE
AND A.PAY < B.AVG_PAY;