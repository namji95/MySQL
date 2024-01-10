-- 데이터를 가져올 때 사용하는 문법 SELECT
-- SELECT 기본 문법 SELECT 컬럼명 FROM 테이블명
-- 선택한 테이블에서 선택한 컬럼의 정보를 가져오겠다는 의미입니다.
SELECT * FROM food_orders;

-- payments 테이블 가져오기
SELECT * FROM payments;

-- customers 테이블 가져오기
SELECT * FROM customers;

-- 원하는 컬럼만 조회하는 방법
-- SELECT 컬럼명, 컬럼명... FROM 테이블명
SELECT restaurant_name, addr FROM food_orders;

-- 원래 컬럼명을 다른 이름으로 조회하는 방법
-- SELECT 컬럼명 AS 다른 이름 FROM 테이블명
-- SELECT 컬럼명 다른이름 FROM 테이블명
SELECT restaurant_name AS 음식점, addr FROM food_orders;
SELECT restaurant_name 음식점 FROM food_orders;

-- 컬럼명 다른 이름으로 사용하는 방법 예시2
SELECT order_id ord_no, price 가격, quantity 수량 FROM food_orders;

SELECT name 이름, email FROM customers;