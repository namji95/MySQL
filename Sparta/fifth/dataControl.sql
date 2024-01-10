-- 빈갑 제외하고 출력하는 방법1
SELECT 
	restaurant_name,
	AVG(rating) avg_rating,
	AVG(IF(rating <> 'Not given', rating, null)) avg_rating2 
FROM food_orders
GROUP BY 1;

-- 빈값 제외하고 출력하는 방법2
SELECT a.order_id,
       a.customer_id,
       a.restaurant_name,
       a.price,
       b.name,
       b.age,
       b.gender
FROM food_orders a LEFT JOIN customers b ON a.customer_id=b.customer_id
WHERE b.customer_id IS NOT NULL;

SELECT a.order_id,
       a.customer_id,
       a.restaurant_name,
       a.price,
       b.name,
       b.age,
       COALESCE(b.age, 20) "null 제거",
       b.gender
FROM food_orders a LEFT JOIN customers b ON a.customer_id=b.customer_id
WHERE b.age is NULL;

-- 조회한 데이터가 예상치 못한 데이터일때
SELECT name,
	   age,
	   CASE
		   WHEN age < 15 THEN 15
		   WHEN age >= 80 THEN 80
		   ELSE age
	   END re_age
FROM customers;

select customer_id, name, email, age,
       case when age<15 then 15
            when age>80 then 80
            else age end "범위를 지정해준 age"
from customers;