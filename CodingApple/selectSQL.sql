SELECT * FROM product;

SELECT 번호 FROM product;

SELECT 상품명 FROM product;

SELECT 카테고리 FROM product;

SELECT 가격 FROM product;

SELECT 번호, 상품명 FROM product;

SELECT 카테고리, 가격 FROM product;

/*
 * select 컬럼명 from 테이블명 읽어오는 sql 기본 문법 
 * select 컬럼명, 컬럼명 from 테이블명
 * ,로 구분하여 원하는 컬럼을 가져올 수 있다.
 * */

SELECT * FROM product ORDER BY 가격 ASC;
/*
 * order by 컬럼명 asc 또는 desc
 * asc 오름차순
 * desc 내림차순
 * */
SELECT * FROM product ORDER BY 카테고리 ASC, 가격 DESC ;
-- quiz1 현재 테이블의 상품명과 가격컬럼을 출력
SELECT 상품명, 가격 FROM product;

-- quiz2 현재 테이블의 모든 컬럼을 출력하는데 가격 낮은 순으로 정렬
SELECT * FROM product ORDER BY 가격 ASC ;

-- quiz3 현재 테이블의 모든 컬럼을 출력하는데 가격 낮은순, 가격이 같으면 카테고리가 가나다순으로 뜨도록 출력
SELECT * FROM product ORDER BY 가격 ASC, 카테고리 ASC ;