-- 날짜 형식의 SQL
-- yyyy-mm-dd 형식의 컬럼을 date type 으로 변경하기
select date(date) date_type,
       date
from payments;

-- date type에 date_format 이용해보기
-- 년 : (y)2자리 (Y)4자리
-- 월 : M, m
-- 일 : d, e
-- 요일 : w
select 
	date(date) date_type,
	date_format(date(date), '%Y') "년",
	date_format(date(date), '%m') "월",
	date_format(date(date), '%d') "일",
	date_format(date(date), '%w') "요일"
from payments;

SELECT 
	date_format(date(date), '%Y') y,
    date_format(date(date), '%m') m
FROM food_orders a
INNER JOIN payments b 
ON a.order_id = b.order_id;

SELECT date_format(date(date), '%Y') y,
       date_format(date(date), '%m') m,
       count(1) order_count
FROM food_orders a 
INNER JOIN payments b 
ON a.order_id = b.order_id
GROUP BY 1, 2;

select date_format(date(date), '%Y') y,
       date_format(date(date), '%m') m,
       date_format(date(date), '%Y%m') ym,
       count(1) order_count
from food_orders a inner join payments b on a.order_id=b.order_id
where date_format(date(date), '%m')='03'
group by 1, 2, 3
order by 1;

SELECT cuisine_type,
	MAX(IF (age=10, order_count, 0)) "10대",
	MAX(IF (age=20, order_count, 0)) "20대",
	MAX(IF (age=30, order_count, 0)) "30대",
	MAX(IF (age=40, order_count, 0)) "40대",
	MAX(IF (age=50, order_count, 0)) "50대"
FROM 
(
SELECT
	f.cuisine_type,
	CASE 
		WHEN age BETWEEN 10 AND 19 THEN 10
		WHEN age BETWEEN 20 AND 29 THEN 20
		WHEN age BETWEEN 30 AND 39 THEN 30
		WHEN age BETWEEN 40 AND 49 THEN 40
		WHEN age BETWEEN 50 AND 59 THEN 50
	END age,
	COUNT(1) order_count 
FROM food_orders f
INNER JOIN customers c 
ON f.customer_id = c.customer_id
WHERE age BETWEEN 10 AND 59
GROUP BY 1, 2
) a 
GROUP BY 1;