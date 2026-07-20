/***************************************/
DDL 제약조건 KEY

PK(Primary Key) 기본키 (테이블에 한개만 설정 가능)
FK(Foreign Key) 외래키


CREATE TABLE T3
(
    NO NUMBER(3) PRIMARY KEY,   --기본키 설정 (NOT NULL, UNIQUE 포함)
    NAME VARCHAR(16),
    BIRTH DATE
);

SELECT * FROM T3;

INSERT INTO T3 VALUES (1, 'n1', SYSDATE);
INSERT INTO T3 VALUES (1, 'n1', SYSDATE); --NO 컬럼 (PK) 중복으로 불가
INSERT INTO T3 VALUES (NULL, 'n1', SYSDATE); --NO 컬럼 (PK) NOT NULL 제약


-- 기본키를 2개이상 설정 X
CREATE TABLE T4
(
    NO NUMBER(3) PRIMARY KEY,       --기본키(PK) 설정
    ID VARCHAR2(32) PRIMARY KEY,    --기본키(PK) 설정
    NAME VARCHAR(16) NOT NULL,
    BIRTH DATE DEFAULT SYSDATE
);

-- 2~N개의 컬럼을 조합해서 PK로 설정
CREATE TABLE T4
(
    NO NUMBER(3),       
    ID VARCHAR2(32),    
    NAME VARCHAR(16) NOT NULL,
    BIRTH DATE DEFAULT SYSDATE,
    CONSTRAINT T4_PK PRIMARY KEY (NO, ID) -- NO ID 두개 컬럼을 조합으로 PK 설정
);

------------------------------------------------


