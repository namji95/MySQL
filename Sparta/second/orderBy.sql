-- select 카테고리컬럼(원하는컬럼 아무거나),
--        sum(계산 컬럼),
-- from
-- group by 카테고리컬럼(원하는컬럼 아무거나)
-- order by 정렬을 원하는 컬럼 (카테고리컬럼(원하는컬럼 아무거나), sum(계산 컬럼) 둘 다 가능)

SELECT cuisine_type,
       sum(price) sum_of_price
FROM food_orders
GROUP BY cuisine_type
ORDER BY sum(price);

SELECT restaurant_name,
       max(price) "최대 주문금액"
FROM food_orders
GROUP BY restaurant_name
ORDER BY max(price) DESC;

select *
from customers
order by name;

SELECT * FROM customers
ORDER BY gender, name;