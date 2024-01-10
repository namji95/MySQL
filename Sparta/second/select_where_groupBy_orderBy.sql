SELECT cuisine_type, sum(delivery_time) total_delivery_time
FROM food_orders
WHERE day_of_the_week = 'Weekend'
GROUP BY cuisine_type
ORDER BY sum(delivery_time) DESC;

SELECT age, COUNT(name) count_of_name
FROM customers
WHERE age BETWEEN 20 AND 40
GROUP BY age
ORDER BY age;

SELECT
cuisine_type,
MAX(price),
MIN(price) 
FROM food_orders
GROUP BY cuisine_type
ORDER BY MIN(price) DESC;