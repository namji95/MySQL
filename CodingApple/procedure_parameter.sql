-- parameter를 이용한 procedure
-- procedure이 많이 생성되게 될 때 사용하는 방법
-- parameter를 이용한 가변적인 procedure 만들기
-- DELIMITER $$
-- $$
-- CREATE PROCEDURE 데이터베이스명.테이블명(파라미터 파라미터타입)
-- BEGIN
--   SELECT * FROM 테이블명 WHERE 컬럼명 > 파라미터;
-- END 
-- $$ 
-- DELIMITER ;

DROP PROCEDURE IF EXISTS mart.get_all2;

DELIMITER $$
$$
CREATE PROCEDURE mart.get_all2(파라미터 int)
BEGIN
  SELECT * FROM product WHERE 가격 > 파라미터;
END 
$$ 
DELIMITER ;

CALL mart.get_all2(7000);

DELIMITER $$
$$
CREATE PROCEDURE mart.get_all3(파라미터 int, 파라미터2 varchar(100))
BEGIN
  SELECT * FROM product WHERE 가격 > 파라미터 OR 카테고리 = 파라미터2;
END 
$$ 
DELIMITER ;

CALL mart.get_all3(7000, '가구');

-- out parameter
-- procedure의 자료를 꺼내는 방법
DELIMITER $$
$$
CREATE PROCEDURE mart.get_age(OUT var_age int)
BEGIN
	SET var_age = 20;
END 
$$ 
DELIMITER ;

CALL mart.get_age(@변수);
SELECT @변수;

-- IN 파라미터 (procedure 안에 데이터를 넣을 때)
-- OUT 파라미터 (procedure 안에 데이터를 빼낼 때)