/*emp2 테이블을 기준으로 아래 정보를 출력
사원들 중에 70년대 생이면서 지역번호를 기준으로 서울(02), 경기도(031)에 거주하는
사원들의 정보를 아래와 같이 출력하시오.
사번, 이름, 생년월일, 취미, 급여(pay), 성과급(급여의 150%)
, 직원분류(단, 가족과 같은 직원이라서 family로 표기)  [※뒤쪽 문구를 family 로 변경]
,전화번호, 급여수준
(단, 급여수준은 아래와 같이 분류)
3500만 1원 ~ 4500만 : '하'
4500만 1원 ~ 6천만 : '중"
6000만 1원 이상 : '상'
그 외... : '화이팅'
*/
SELECT
    EMPNO 사번, NAME 이름, BIRTHDAY 생년월일, HOBBY 취미, PAY 급여,
    PAY*1.5 성과급,
    CASE INSTR(EMP_TYPE, ' ')
        WHEN 0 THEN EMP_TYPE || ' family'
        ELSE SUBSTR(EMP_TYPE, 1, INSTR(EMP_TYPE, ' ')) || 'family'
    END "직원 분류",
    TEL,
    CASE
        WHEN PAY BETWEEN 35000001 AND 45000000 THEN '하'
        WHEN PAY BETWEEN 45000001 AND 60000000 THEN '중'
        WHEN PAY >= 60000001 THEN '상'
        ELSE '화이팅'
    END 급여수준
FROM EMP2
WHERE SUBSTR(TO_CHAR(BIRTHDAY, 'YY'), 1, 1) = '7'
    AND SUBSTR(TEL, 1, INSTR(TEL, ')')-1) IN ('02','031');