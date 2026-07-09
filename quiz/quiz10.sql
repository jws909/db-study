--1.
SELECT
    DEPTNO,
    NAME,
    DECODE(DEPTNO, 101, 
        DECODE(NAME, 'Audie Murphy', 'BEST!', NULL), NULL) DECODE
FROM PROFESSOR;

--2.
SELECT
    DEPTNO,
    NAME,
    DECODE(DEPTNO, 101, 
        DECODE(NAME, 'Audie Murphy', 'BEST!', 'GOOD!'), NULL) 비고
FROM PROFESSOR;

--3.
SELECT
    DEPTNO,
    NAME,
    DECODE(DEPTNO, 101, 
        DECODE(NAME, 'Audie Murphy', 'BEST!', 'GOOD!'), 'N/A') 비고
FROM PROFESSOR;

--4.
SELECT
    NAME,
    JUMIN,
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', 2, '여자') 성별
FROM STUDENT
WHERE DEPTNO1 = 101;

--5.
SELECT
    NAME,
    TEL,
    CASE SUBSTR(TEL, 1, INSTR(TEL, ')')-1)
        WHEN '02' THEN '서울'
        WHEN '031' THEN '경기'
        WHEN '051' THEN '부산'
        WHEN '052' THEN '울산'
        WHEN '055' THEN '경남'
    END 지역명
FROM STUDENT
WHERE DEPTNO1 = 101;