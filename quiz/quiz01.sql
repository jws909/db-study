-- 연결 연산자 연습 문제 1
SELECT
    NAME || '''s ID : ' || ID || ', WEIGHT is ' || WEIGHT || 'Kg' AS "ID AND WEIGHT"
FROM STUDENT;

-- 연결 연산자 연습 문제 2
SELECT
    ENAME || '(' || JOB || ') , ' || ENAME || '''' || JOB || '''' AS "NAME AND JOB"
FROM EMP;

-- 연결 연산자 연습 문제 3
SELECT
    ENAME || '''s sal is $' || SAL AS "Name and Sal"
FROM EMP;