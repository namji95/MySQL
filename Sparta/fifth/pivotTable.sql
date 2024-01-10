-- pivot table 만들어 보기
SELECT
	f.restaurant_name,
	SUBSTR(p.time, 1, 2) hh,
	COUNT(1) cnt_order 
FROM food_orders f 
INNER JOIN payments p 
ON f.order_id = p.order_id
WHERE SUBSTR(p.time, 1, 2) BETWEEN 15 AND 20
GROUP BY 1, 2; 

SELECT restaurant_name,
       max(if(hh='15', cnt_order, 0)) "15",
       max(if(hh='16', cnt_order, 0)) "16",
       max(if(hh='17', cnt_order, 0)) "17",
       max(if(hh='18', cnt_order, 0)) "18",
       max(if(hh='19', cnt_order, 0)) "19",
       max(if(hh='20', cnt_order, 0)) "20"
FROM 
(
SELECT a.restaurant_name,
       substring(b.time, 1, 2) hh,
       count(1) cnt_order
FROM food_orders a 
INNER JOIN payments b 
ON a.order_id=b.order_id
WHERE substring(b.time, 1, 2) 
BETWEEN 15 AND 20
GROUP BY 1, 2
) a
GROUP BY 1
ORDER BY 7 DESC;

select b.gender,
       case when age between 10 and 19 then 10
            when age between 20 and 29 then 20
            when age between 30 and 39 then 30
            when age between 40 and 49 then 40
            when age between 50 and 59 then 50 end age,
       count(1)
from food_orders a inner join customers b on a.customer_id=b.customer_id
where b.age between 10 and 59
group by 1, 2;

SELECT
	age,
	MAX(IF (gender = 'male', cnt_order, 0)) "male",
	MAX(IF (gender = 'female', cnt_order, 0)) "female"
FROM 
(
SELECT 
	gender,
	CASE
		WHEN age BETWEEN 10 AND 19 THEN 10
		WHEN age BETWEEN 20 AND 29 THEN 20
		WHEN age BETWEEN 30 AND 39 THEN 30
		WHEN age BETWEEN 40 AND 49 THEN 40
		WHEN age BETWEEN 50 AND 59 THEN 50
	END age,
	COUNT(1) cnt_order 
FROM food_orders f
INNER JOIN customers c
ON f.customer_id = c.customer_id
WHERE age BETWEEN 10 AND 59
GROUP BY 1, 2
) a
GROUP BY 1
ORDER BY 1 DESC ;