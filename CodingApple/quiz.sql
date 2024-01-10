-- sales는 일별 매출장부
-- product는 상품id, 상품명, 가격
-- user_table은 유저id, 고객명이 들어있다.
SELECT * FROM sales;
SELECT * FROM product;
SELECT * FROM user_table;

-- quiz1 sales 테이블을 출력하는데 product 테이블에 있던 상품명, 가격도 함께 출력
SELECT sales.id, 고객번호, 구매날짜, 상품명, 가격
FROM sales
INNER JOIN product
ON sales.상품id = product.id;
-- 강의 풀이
SELECT * FROM sales
INNER JOIN product
ON 상품id = product.id;

-- quiz2 sales 테이블을 출력하는데 상품명, 가격, 고객명도 함께 출력
SELECT sales.id, 고객번호, 구매날짜, 상품명, 가격, 고객명
FROM sales
INNER JOIN product
ON sales.상품id = product.id 
INNER JOIN user_table
ON sales.고객번호 = user_table.id;
-- 테이블 3개를 함께 출력하고 싶으면
SELECT sales.id, 고객번호, 구매날짜, 상품명, 가격, 고객명
FROM sales, product, user_table
WHERE sales.상품id = product.id
AND sales.고객번호 = user_table.id;
-- 강의 풀이
SELECT * FROM sales
INNER JOIN product
ON 상품id = product.id
INNER JOIN user_table
ON 고객번호 = user_table.id;

-- quiz3 날짜별 매출 합계를 출력하도록 2번에서 작성한 코드를 업그레이드 해보기
SELECT 구매날짜, sum(가격)
FROM sales
INNER JOIN product
ON sales.상품id = product.id
INNER JOIN user_table
ON sales.고객번호 = user_table.id
GROUP BY 구매날짜;
-- 강의 풀이
SELECT 고객번호, 구매날짜, 상품명, sum(가격), 고객명
FROM sales
INNER JOIN product
ON 상품id = product.id
INNER JOIN user_table
ON 고객번호 = user_table.id
GROUP BY 구매날짜;