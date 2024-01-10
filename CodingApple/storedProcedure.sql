-- stored procedure 긴 쿼리문 한 단어로 축약
/*
DELIMITER $$
$$
CREATE PROCEDURE 테이블명.프로시져명()
BEGIN 
	축약하고 싶은 SQL문;
END
$$
DELIMITER;
중간에 세미콜론을 작성하면
END까지 오지 못하고 문장이 종료될 수 있기 때문에
DELIMITER로 세미콜론 대신 사용할 기호를 정하여
문장의 시작과 끝을 알려줌
*/
-- 불러오는 방법 = CALL 테이블명.프로시져명
-- 기존 프로시져 수정하는 방법은 삭제 후 변경하고 싶은 프로시져 재생성
-- 삭제하는 방법
-- DROP PROCEDURE IF EXISTS mart.get_all;

SELECT * FROM product WHERE 가격 > 5000;
CALL mart.get_all();

DROP PROCEDURE IF EXISTS mart.get_all;

DELIMITER $$
$$
CREATE PROCEDURE mart.get_all()
BEGIN
  SELECT * FROM product WHERE 가격 > 6000;
END 
$$ 
DELIMITER ;

CALL mart.get_all();

-- quiz 테이블에 하나의 행을 추가하는 코드를 procedure로 저장해두고 사용해보기

DROP PROCEDURE IF EXISTS mart.add_one;

DELIMITER $$
$$
CREATE PROCEDURE mart.add_one()
BEGIN
	INSERT INTO product (번호, 상품명, 카테고리, 가격, 재고) VALUES (14, '원목 의자', '가구', 2000, 30);
END 
$$
DELIMITER ;

CALL mart.add_one();

SELECT * FROM product;

-- SQL 코드 실행 시
-- 문법 검사
-- 조작 권한 검사
-- 어떻게 실행하는게 좋을지 검사
-- 캐싱 (DBMS마다 다름)
-- 컴퓨터가 알아듣게 컴파일
-- 실행
-- stored procedure 사용 시 
-- 위 순서와 비슷하지만 살짝 다른점은
-- 어떻게 실행하는게 좋을지 검사 후
-- stored procedure 발견 시
-- 컴퓨터가 알아듣게 컴파일로 넘어감
-- 그래서 조금 더 빠름