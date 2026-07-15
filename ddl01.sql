/***********************************************************/
DDL
테이블 조작


테이블 생성

CREATE TABLE 테이블명
(
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    컬럼명 컬럼타입 기타속성/제약,
    ...
);


CREATE TABLE NEW_TABLE1  --테이블 스키마(Schema)
(
    NO NUMBER(3),       --숫자형 3자리수
    NAME VARCHAR2(16),  --문자형 16바이트
    BIRTH DATE          --날짜형
);

SELECT * FROM NEW_TABLE1;

CREATE TABLE NEW_TABLE2  --테이블 스키마(Schema)
(
    NO NUMBER(3),       --숫자형 3자리수
    NAME VARCHAR2(16),  --문자형 16바이트
    BIRTH DATE          --날짜형
);

SELECT * FROM NEW_TABLE2;

SELECT *
FROM TAB;

SELECT *
FROM TAB
WHERE TNAME LIKE '%NEW%';




---------------------------------
테이블 복사


SELECT * FROM DEPT2;


> DEPT2 테이블 구조 + 데이터 -> 복사 -> DEPT3 새로운 테이블 생성
SELECT * FROM DEPT3;

CREATE TABLE DEPT3
AS
SELECT * FROM DEPT2;


> DEPT2 테이블 구조 일부 + 데이터 -> 복사 -> DEPT4 새로운 테이블 생성
CREATE TABLE DEPT4
AS
SELECT DCODE, DNAME FROM DEPT2;

SELECT * FROM DEPT4;

> DEPT2 테이블 구조만 복사 (데이터 제외) -> 복사 -> DEPT5 생성
CREATE TABLE DEPT5
AS
SELECT * FROM DEPT2
WHERE 1=2;  --데이터 조회 안되도록 거잣 조건 추가

SELECT * FROM DEPT5;

----------------------------------------
테이블 변경(수정)

SELECT * FROM DEPT4;

> LOC 컬럼 추가
ALTER TABLE DEPT4
ADD (LOC VARCHAR2(32));

> LV 컬럼 추가 기본값 1
ALTER TABLE DEPT4
ADD (LV NUMBER(3) DEFAULT 1);

> 컬럼 삭제
ALTER TABLE DEPT4
DROP COLUMN LV;

> 테이블 삭제
DROP TABLE 테이블명;

> 테이블 내부 데이터 포맷(초기화)
TRUNCATE TABLE 테이블명;

DDL : ROLLBACK 불가, 자동 COMMIT 발생

SELECT * FROM DEPT4;

TRUNCATE TABLE DEPT4;
DROP TABLE DEPT4;