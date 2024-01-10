-- quiz1 매출내역에 없는 상품들 출력
SELECT * FROM 
sales RIGHT JOIN product
ON sales.상품id = product.id;

-- quiz2 매출내역에 없는 고객들 출력
SELECT * FROM
sales RIGHT JOIN user_table
ON sales.고객번호 = user_table.id;