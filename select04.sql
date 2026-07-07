/*------------------------------*/
단일행 함수

SELECT * FROM DUAL;
DUAL : 더미 데이터가 있는 임시 테이블

SELECT INITCAP('abc') FROM DUAL;
SELECT ENAME, INITCAP(ENAME) FROM EMP;

SELECT NAME, LOWER(NAME), UPPER(NAME)
FROM STUDENT;

SELECT NAME, LENGTH(NAME)
FROM STUDENT;

SELECT
    LENGTH('abcd'), LENGTHB('abcd'),
    LENGTH('한글'), LENGTHB('한글') --한글 한글자에 3byte
FROM DUAL;

--이름이 다섯자 이상 이름 가진사람만 조회
SELECT *
FROM EMP
WHERE LENGTH(ENAME) >= 5;

SELECT
    '아침' || '점심',
    CONCAT('아침', '점심')
FROM DUAL;

SELECT
    '아침' || '점심' || '저녁',
    CONCAT(CONCAT('아침', '점심'), '저녁')
FROM DUAL;


--SUBSTR(대상값|컬럼명, 시작지점(1~), 자릿수)
SELECT
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -4, 2),
    SUBSTR('abcdefg', -3, 3)
FROM DUAL;


-- INSTR(대상값|컬럼명, 찾는값)
-- INSTR(대상값|컬럼명, 찾는값, 시작위치)
-- INSTR(대상값|컬럼명, 찾는값, 시작위치, 몇번째값)

SELECT
    '2026-01-02 10:11:33',
    INSTR('2026-01-02 10:11:33', '-'),
    INSTR('2026-01-02 10:11:33', '-', 6),
    INSTR('2026-01-02 10:11:33', ':', 15),
    INSTR('2026-01-02 10:11:33', '-', 1, 2)
FROM DUAL;


SELECT
    TEL,
    INSTR(TEL, ')'),
    INSTR(TEL, '-')
FROM STUDENT;


--LPAD RPAD 왼쪽 오른쪽 채우기
SELECT
    LPAD('문자', 10, '-'),
    RPAD('13ab', 8, '*'),
    LPAD(5, 2, 0),
    LPAD(5, 3, 0),
    LPAD(77, 2, 0)
FROM DUAL;

SELECT
    '*' || ' abcd ' || '*',
    '*' || LTRIM(' abcd ') || '*',
    '*' || RTRIM(' abcd ') || '*',
    '*' || TRIM(' abcd ') || '*',
    LTRIM('**abcd**', '*'),
    RTRIM('**abcd**', '*')
FROM DUAL;

--REPLACE(기준값, 찾는대상, 바꿀값)
SELECT
    REPLACE('abcde', 'c', '/')
FROM DUAL;

SELECT
    BIRTHDAY,
    REPLACE(BIRTHDAY, '/', '$')
FROM STUDENT;


/*------------------------------*/
숫자

SELECT
    ROUND(1.123),   --반올림
    ROUND(1.789),
    ROUND(1.789, 1),    --소수점 1번째 자리수까지
    ROUND(1.789613, 3),
    ROUND(1.789613, 0),
    ROUND(3561.4564, -1),
    TRUNC(1.12244), --버림
    TRUNC(1.167844, 2),
    MOD(15, 4), --나머지연산 15%4
    CEIL(123.123),  --인접한 큰 정수
    FLOOR(123.123),  --인접한 작은 정수
    POWER(6, 3) -- 6의 3제곱 6*6*6  
FROM DUAL;

SELECT
    ROWNUM, --조회결과에 대해서 행번호
    CEIL(ROWNUM/3) 그룹번호,
    CEIL(ROWNUM/4) 팀번호,
    EMPNO,
    ENAME
FROM EMP;


/*------------------------------*/
--날짜

SELECT
    SYSDATE, --현재 날짜
    SYSTIMESTAMP,  --현재 날짜시간
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'),
    MONTHS_BETWEEN('2024-11-05', '2024-04-20')
    -- 앞날짜 - 뒷날짜 -> 월단위 환산
FROM DUAL;

SELECT
    ADD_MONTHS(SYSDATE, 3),
    ADD_MONTHS(SYSDATE, 6),
    ADD_MONTHS(SYSDATE, -4),
    LAST_DAY(SYSDATE),  --해당 날짜(월)기준 마지막 일자 28 29 30 31
    NEXT_DAY(SYSDATE, '토'),
    NEXT_DAY(SYSDATE, '화')
FROM DUAL;

SELECT
    SYSDATE,
    ROUND(SYSDATE),
    TRUNC(SYSDATE),
    TRUNC(SYSDATE, 'YY'),
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'DD'),
    ADD_MONTHS(SYSDATE, 1),  --월단위 계산 +1월
    SYSDATE + 3, --일단위 계산 +3일
    SYSDATE + 7,
    --다음달 첫날
    LAST_DAY(SYSDATE)+1,
    TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM'),
    --전월의 마지막
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
    TRUNC(SYSDATE, 'MM')-1
FROM DUAL;