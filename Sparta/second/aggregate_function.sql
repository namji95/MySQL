SELECT * FROM food_orders;

select food_preparation_time,
       delivery_time,
       food_preparation_time + delivery_time as total_time
from food_orders;

select sum(food_preparation_time) total_food_preparation_time,
       avg(delivery_time) avg_food_preparation_time
from food_orders;

SELECT AVG(age) 평균나이 FROM customers;
SELECT AVG(age) '평균 나이' FROM customers;

-- count에 *또는 1을 작성하면 내가 선택한 컬럼의 갯수를 모두 구하라는 의미입니다.
select count(1) count_of_orders,
-- distinct = 중복제거
       count(distinct customer_id) count_of_customers
from food_orders;

select min(price) min_price,
       max(price) max_price
from food_orders;

-- where절 응용
select count(order_id) count_of_orders
from food_orders
where price>=30000;

SELECT AVG(price) AS average_price
FROM food_orders
WHERE cuisine_type = 'Korean';