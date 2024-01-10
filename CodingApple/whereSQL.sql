-- SELECT * FROM product WHERE 조건식 (문자들은 ''안에 작성 숫자는 그냥 작성)
SELECT * FROM product;

SELECT * FROM product WHERE 카테고리 = '가구';

SELECT * FROM product WHERE 가격 = 5000;

SELECT * FROM product WHERE 가격 != 5000;

SELECT * FROM product WHERE 상품명 > '가';

SELECT * FROM product WHERE 상품명 > 'ㅅ';

SELECT * FROM product WHERE 가격 BETWEEN 5000 AND 8000;

-- where 뒤에 여러가지 조건을 사용하는 방법
SELECT * FROM product WHERE 가격 = 5000 AND 카테고리 = '가구';
-- AND는 조건식 모두를 만족해야 함

SELECT * FROM product WHERE 가격 = 5000 OR 카테고리 = '가구';
-- OR는 조건식 하나라도 만족하면 됨

SELECT * FROM product WHERE (카테고리 = '가구' OR 카테고리 = '옷') AND 가격 = 5000;
-- 괄호를 감싸면 괄호가 먼저 연산된 후 나머지가 연산됨

SELECT * FROM product WHERE NOT 가격 = 5000;
-- NOT은 조건식이 아닌 것 반대를 의미함 != 이렇게 작성해도 됨

SELECT * FROM product WHERE 카테고리 = ' 신발' OR 카테고리 = '가전' OR 카테고리 = '식품';
-- 신발이고 가전이고 식품인 것을 출력하라는 코드

/*
 * 조건이 많아지면
 * SELECT * FROM product WHERE 컬럼명 IN (값, 값, 값);
 * 이런식으로 간단하게 작성 가능
 * 한 컬럼의 값만을 찾을 수 있음
 */
SELECT * FROM product WHERE 카테고리 IN ('신발', '가전', '식품');
 * */