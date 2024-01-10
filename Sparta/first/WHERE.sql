-- 특정 값 지정하여 데이터 조회하는 방법
SELECT * FROM customers WHERE age=21;
SELECT * FROM customers WHERE gender="male";

-- SQL문은 대소문자를 구분하기 때문에 주의해야 합니다.
SELECT * FROM food_orders WHERE cuisine_type = 'Korean' ;

-- payments 테이블의 pay_type이 card인 것에 대한 정보만 불러오기
SELECT * FROM payments WHERE pay_type = 'card';

-- customers 테이블의 age가 21살 이상인 데이터 조회
SELECT * FROM customers WHERE age >= 21;

-- customers 테이블의 gender가 male이 아닌 값의 데이터 조회
SELECT * FROM customers WHERE gender <> 'male';

-- A와 B 사이의 데이터 조회하는 방법 BETWEEN
SELECT * FROM customers WHERE age BETWEEN 21 AND 23;

-- 내가 지정한 값의 데이터만 조회하는 방법 IN
SELECT * FROM  customers WHERE age IN (21, 25, 27);
 
-- 내가 지정한 입력값의 데이터만 조회하는 방법 LIKE
SELECT * FROM customers WHERE name LIKE '김%';

-- 여러가지 데이터 조회하는 방법
SELECT * FROM customers WHERE age >= 21 AND gender = 'male';
SELECT * FROM payments WHERE pay_type = 'card' OR vat <= 0.2;