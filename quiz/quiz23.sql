--사전준비.
CREATE TABLE temp_professor
AS
SELECT * FROM professor;

-- 1.
-- temp_professor 테이블에서 
-- 직급이 조교수(assistant professor) 인 교수들의 BONUS 를 200 만원으로 인상하세요.
UPDATE TEMP_PROFESSOR
SET BONUS = 200
--SELECT * FROM TEMP_PROFESSOR
WHERE POSITION = 'assistant professor';

-- 2.
-- temp_professor 테이블에서 
-- 'Sharon Stone' 교수의 직급과 동일한 직급을 가진 교수들 중 
-- 현재 급여가 250 만원이 안 되는 교수들의 급여를 15% 인상하세요.
UPDATE TEMP_PROFESSOR
SET PAY = PAY * 1.15
--SELECT * FROM TEMP_PROFESSOR
WHERE POSITION = (SELECT POSITION
                  FROM TEMP_PROFESSOR
                  WHERE NAME = 'Sharon Stone')
AND PAY < 250;