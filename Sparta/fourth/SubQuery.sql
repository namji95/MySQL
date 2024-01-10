-- SubQuery를 사용하는 겨우?
-- 여러번의 연산을 수행해야 할 때
-- 조건문에 연산 결과를 사용해야 할 때
-- 조건에 Query 결과를 사용하고 싶을 때

-- SubQuery 기본 문법

-- select column1, special_column
-- from
--     ( /* subquery */
--     select column1, column2 special_column
--     from table1
--     ) a
-- a는 서브쿼리의 이름이라고 생각하면 됩니다.;
    
-- select column1, column2
-- from table1
-- where column1 = (select col1 from table2);

SELECT price / quantity
FROM 
(
SELECT price, quantity
FROM food_orders
) a;

SELECT order_id, restaurant_name, food_preparation_time
FROM (
SELECT order_id, restaurant_name, food_preparation_time
FROM food_orders) a;

SELECT order_id, restaurant_name, if(over_time>=0, over_time, 0) over_time
FROM (
SELECT order_id, restaurant_name, food_preparation_time-25 over_time
FROM food_orders) a;

SELECT order_id, restaurant_name, food_preparation_time-25 over_time
FROM food_orders;

select restaurant_name,
       price_per_plate*ratio_of_add "수수료"
from 
(
select restaurant_name,
       case when price_per_plate<5000 then 0.005
            when price_per_plate between 5000 and 19999 then 0.01
            when price_per_plate between 20000 and 29999 then 0.02
            else 0.03 end ratio_of_add,
       price_per_plate
from 
(
select restaurant_name, avg(price/quantity) price_per_plate
from food_orders
group by 1
) a
) b;

select restaurant_name,
       sido,
       avg_time,
       case when avg_time<=20 then '<=20'
            when avg_time>20 and avg_time <=30 then '20<x<=30'
            when avg_time>30 then '>30' end time_segment
from 
(
select restaurant_name,
       substring(addr, 1, 2) sido,
       avg(delivery_time) avg_time
from food_orders
group by 1, 2
) a;

select cuisine_type,
		total_quantity,
		count_res,
		case when count_res>=5 and total_quantity>=30 then 0.005
             when count_res>=5 and total_quantity<30 then 0.008
             when count_res<5 and total_quantity>=30 then 0.01
             when count_res<5 and total_quantity<30 then 0.02 
             end ratio_of_add
from
(
select cuisine_type,
       sum(quantity) total_quantity,
       count(distinct restaurant_name) count_res
from food_orders
group by 1
) a;

select restaurant_name '식당명',
		sum_of_quantity '주문수 합계',
		sum_of_price '가격 합계',
		case when sum_of_quantity<=5 then 0.1
			 when sum_of_quantity>15 and sum_of_price>=300000 then 0.005
             else 0.01 
             end ratio_of_add
from 
(
select restaurant_name,
       sum(quantity) sum_of_quantity,
       sum(price) sum_of_price
from food_orders
group by 1
) a;