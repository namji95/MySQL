-- window function 기본 문법
-- window_function(argument) over (partition by 그룹 기준 컬럼 order by 정렬 기준)
-- window function : 기능 명을 사용해줍니다. (sum,avg와 같이 기능명이 있습니다.)
-- argument : 함수에 따라 작성하거나 생략합니다.
-- partition by : 그룹을 나누기 위한 기준입니다. group by 절과 유사하다고 생각해주시면 됩니다.

-- 특정 기준으로 순위를 매길 때 사용하는 window 함수 rank

SELECT
	cuisine_type, 
	restaurant_name, 
	COUNT(1) order_count
FROM food_orders
GROUP BY 1, 2;

SELECT 
	cuisine_type,
	restaurant_name,
	order_count,
	RANK() OVER (PARTITION BY cuisine_type ORDER BY order_count DESC) rn
FROM
(
SELECT 
	cuisine_type, 
	restaurant_name, 
	COUNT(1) order_count
FROM food_orders
GROUP BY 1, 2
) a;

SELECT cuisine_type,
       restaurant_name,
       order_count,
       rn "순위"
FROM
(
SELECT 
	cuisine_type,
	restaurant_name,
	order_count,
	RANK() OVER (PARTITION BY cuisine_type ORDER BY order_count DESC) rn
FROM
(
SELECT 
	cuisine_type, 
	restaurant_name, 
	COUNT(1) order_count
FROM food_orders
GROUP BY 1, 2
) a
) b
WHERE rn<=3
ORDER BY 1, 4;

-- window 함수 sum

SELECT  
	cuisine_type, 
	restaurant_name, 
	COUNT(1) order_count
FROM food_orders
GROUP BY 1, 2;

SELECT cuisine_type,
       restaurant_name,
       order_count,
       sum(order_count) OVER (PARTITION BY cuisine_type) sum_cuisine_type,
       sum(order_count) OVER (PARTITION BY cuisine_type ORDER BY order_count, restaurant_name) cumulative_sum
FROM
(
SELECT cuisine_type, restaurant_name, COUNT(1) order_count
FROM food_orders
GROUP BY 1, 2
) a
ORDER BY cuisine_type, order_count;

