-- select 카테고리컬럼(원하는컬럼 아무거나),
--        sum(계산 컬럼),
-- from
-- group by 카테고리컬럼(원하는컬럼 아무거나)

SELECT cuisine_type,
       sum(price) sum_of_price
FROM food_orders
GROUP BY cuisine_type;

SELECT restaurant_name,
MAX(price) max_price
FROM food_orders fo
GROUP BY restaurant_name;

SELECT pay_type "결제타입",
       max(date) "최근 결제일"
FROM payments
GROUP BY pay_type;