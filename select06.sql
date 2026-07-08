/*-----------------------------------------*/
단일행 함수


NVL 함수
값이 NULL 일때 기본값 처리
NVL(대상, NULL일때 기본값)


SELECT
    SAL,
    COMM,
    (SAL*12)+COMM,   -- (800*12) + NULL -> NULL
    NVL(COMM, 0),
    (SAL*12)+NVL(COMM, 0)
FROM EMP;



SELECT
    SAL,
    COMM,
    SAL*12 + COMM 연봉
FROM EMP
WHERE COMM IS NOT NULL
UNION ALL
SELECT
    SAL,
    COMM,
    SAL*12
FROM EMP
WHERE COMM IS NULL;


NVL2(대상값, 있을때, 없을때)

SELECT
    NVL(NULL, 10),
    NVL(20, 10),
    NVL2(NULL, '있다', '없다'),
    NVL2(1234, '있다', '없다')
FROM DUAL;

SELECT 
    SAL,
    COMM,
    (SAL*12)+NVL(COMM, 0),
    NVL2(COMM, COMM, 0),
    (SAL*12)+NVL2(COMM, COMM, 0),
    NVL2(COMM, (SAL*12)+COMM, SAL*12)
FROM EMP;

***DECODE

DECODE(대상, 비교값, '같다', '다르다')
DECODE(대상, 비교값, '같다', DECODE(대상, 비교값, '같다', '다르다'))
DECODE(대상, 비교값1, '같다1', 비교값2, '같다2', 비교값3, '같다3', '다르다')
DECODE(대상, 비교값1, '같다1', 비교값2, '같다2', 비교값3, '같다3') --> 전부 다르면 NULL

SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 10, '같다'),
    DECODE(10, 20, '같다'),   --다르다 생략 -> NULL
    DECODE(10, 20, '같다', NULL),
    DECODE(10, 10, '10이다', 20, '20이다', 30, '30이다', '아니다'),
    DECODE(30, 10, '10이다', 20, '20이다', 30, '30이다'),
    DECODE(20, 10, '10이다', 20, '20이다', 30, '30이다', NULL),
    DECODE(99, 10, '10이다', 20, '20이다', 30, '30이다', NULL)
FROM DUAL;

SWITCH(20):
    CASE 20: '20이다'
    CASE 30: ...
    
SELECT
    NAME,
    DEPTNO,
    DECODE(DEPTNO, 
        101, '컴공', 
        102, '전기', 
        103, '기계',
        201, '물리',
        202, '화학',
        203, '수학',
        '기타전공') 학과이름
FROM PROFESSOR;


***CASE 문

SELECT *
FROM STUDENT;
--학년 1 2 3 4
--학년구분 -> 컬럼
-- 1 2 저학년
-- 3 4 고학년

SELECT
    GRADE,
    DECODE(GRADE,
        1, '저학년',
        2, '저학년',
        3, '고학년',
        4, '고학년',
        '범위벗어남') 구분,
    CASE GRADE
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
        ELSE '범위벗어남'
    END AS "구분CASE",
    CASE
        WHEN GRADE IN (1,2) THEN '저학년'
        WHEN GRADE BETWEEN 3 AND 4 THEN '고학년'
        ELSE '범위벗어남'
    END 구분CASE2
FROM STUDENT;




-----------------------------
연봉계산

SELECT
    SAL,
    COMM,
    SAL*12 + COMM 연봉1,
    SAL*12 + NVL(COMM, 0) 연봉2,
    SAL*12 + NVL2(COMM, COMM, 0) 연봉3,
    NVL2(COMM, SAL*12+COMM, SAL*12) 연봉4,
    SAL*12 + DECODE(COMM, NULL, 0, COMM) 연봉5,
    CASE COMM
        WHEN NULL THEN SAL*12   -- COMM = NULL 형태
        ELSE SAL*12+COMM
    END 연봉6,  --안되는 케이스
    CASE
        WHEN COMM IS NULL THEN SAL*12
        WHEN COMM IS NOT NULL THEN SAL*12+COMM
    END 연봉7
FROM EMP;