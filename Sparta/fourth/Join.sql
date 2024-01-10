-- 여러 테이블에서 데이터를 불러올 때 JOIN 사용
-- LEFT JOIN
-- A 테이블과 B 테이블이 있을 때 공통 부분과 선택한 테이블의 정보만 가져올 때 사용
-- select 조회 할 컬럼
-- from 테이블1 a left join 테이블2 b on a.공통컬럼명=b.공통컬럼명
-- 
-- -- INNER JOIN
-- A 테이블과 B 테이블이 있을 때 공통 부분의 정보를 가져올 때 사용
-- select 조회 할 컬럼
-- from 테이블1 a inner join 테이블2 b on a.공통컬럼명=b.공통컬럼명

SELECT * FROM food_orders fo ;
SELECT * FROM payments p ;
-- food_orders와 payments 테이블의 공통 컬럼은 order_id
SELECT * FROM food_orders 
LEFT JOIN payments 
ON food_orders.order_id = payments.order_id;

SELECT * FROM food_orders 
INNER JOIN payments 
ON food_orders.order_id = payments.order_id;
select a.order_id,
       a.customer_id,
       a.restaurant_name,
       a.price,
       b.name,
       b.age,
       b.gender
from food_orders a left join customers b on a.customer_id=b.customer_id;

select a.order_id,
       a.restaurant_name,
       a.price,
       b.pay_type,
       b.vat
from food_orders a left join payments b on a.order_id=b.order_id
where cuisine_type='Korean';

select distinct a.name,
       a.age,
       a.gender,
       b.restaurant_name
from customers a inner join food_orders b on a.customer_id=b.customer_id
ORDER BY a.name;

select a.order_id,
       a.restaurant_name,
       a.price,
       b.vat,
       a.price*b.vat "수수료율"
from food_orders a inner join payments b on a.order_id=b.order_id;

select cuisine_type ,
       sum(price) "원래 가격",
       sum(price)-sum(discount_price) "할인 적용 가격",
       sum(discount_price) "할인 가격" 
from 
(
select a.cuisine_type,
       a.price,
       b.age,
       price*((b.age-50)*0.005) discount_price
from food_orders a inner join customers b on a.customer_id=b.customer_id
where b.age>=50
) t
group by 1
order by 4 DESC;

SELECT * FROM food_orders fo ;
SELECT * FROM customers c;

SELECT restaurant_name,
	CASE WHEN avgPrice <= 5000 THEN 'price_group1'
		 WHEN avgPrice > 5000 AND avgPrice <= 10000 THEN 'price_gourp2'
		 WHEN avgPrice > 10000 AND avgPrice <= 30000 THEN 'price_group3'
		 WHEN avgPrice > 30000 THEN 'price_group4'
		 END price_group,
	CASE WHEN avgAge < 30 THEN 'age_group1'
		 WHEN avgAge BETWEEN 31 AND 39 THEN 'age_group2'
		 WHEN avgAge BETWEEN 40 AND 49 THEN 'age_group3'
		 ELSE 'age_group4'
		 END age_group
FROM 
(
SELECT 
	f.restaurant_name,
	AVG(f.price) avgPrice,
	AVG(c.age) avgAge
FROM food_orders f INNER JOIN customers c ON f.customer_id = c.customer_id
GROUP BY 1
) a
ORDER BY 1
;