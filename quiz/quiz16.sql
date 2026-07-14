/*
참조 테이블 : panmae, product, gift
출력 데이터 : 상품명, 상품가, 구매수량, 총금액,
적립포인트, 새해2배적립포인트, 사은품명, 포인트 범위

- panmae 테이블을 기준으로 포인트를 보여준다.
- 포인트는 구매한 금액 1원당 100의 포인트를 부여한다.
(단, 01월 01인 경우는 새해 이벤트로 인해 1원당 200의 포인트를 부여한다.)
- 적립포인트와 새해2배적립포인트를 모두 보여준다.
(이 경우, 이벤트 날인 01월 01일을 제외하고는 포인트가 동일 할 것이다.)
- 새해2배적립포인트를 기준으로 해당 포인트 기준으로 받을수 있는 사은품을 보여준다.
- 사은품 명 옆에 해당 사은품을 받을 수 있는 포인트의 범위를 함께 보여준다.

* 출력 양식과 컬럼 헤더에 표기되는 이름 확인!
*/
SELECT
    TO_CHAR(TO_DATE(PA.P_DATE, 'YYYYMMDD'), 'YYYY-MM-DD') 판매일자,
    PA.P_CODE 상품코드,
    PR.P_NAME 상품명,
    TO_CHAR(PR.P_PRICE, 'FM999,999,999,999') 상품가,
    PA.P_QTY 구매수량,
    TO_CHAR(PA.P_TOTAL, 'FM999,999,999,999') 총금액,
    TO_CHAR(PA.P_TOTAL*100, 'FM999,999,999,999') 적립포인트,
    TO_CHAR(
        CASE
            WHEN PA.P_DATE LIKE '20__0101' THEN PA.P_TOTAL*200
            ELSE PA.P_TOTAL*100
        END
        , 'FM999,999,999,999') 새해2배적립포인트,
    G.GNAME 사은품명,
    TO_CHAR(G.G_START, 'FM999,999,999,999') 포인트START,
    TO_CHAR(G.G_END, 'FM999,999,999,999') 포인트END
FROM PANMAE PA, PRODUCT PR, GIFT G
WHERE PA.P_CODE = PR.P_CODE
AND 
    CASE
        WHEN PA.P_DATE LIKE '20__0101' THEN PA.P_TOTAL*200
        ELSE PA.P_TOTAL*100
    END
    BETWEEN G.G_START AND G.G_END
ORDER BY PA.P_DATE;
            