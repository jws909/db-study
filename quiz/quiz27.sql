/*-----------------------사전설정------------------------*/
CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

/*-----------------------문제풀이------------------------*/
SELECT 
    TRUNC(PRICE, -4) PRICE_GROUP,
    COUNT(*) PRODUCTS
FROM PRODUCT_QUIZ
GROUP BY TRUNC(PRICE, -4)
ORDER BY PRICE_GROUP;
