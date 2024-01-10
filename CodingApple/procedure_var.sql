-- 자주 사용하는 숫자나 문자 변수로 지정하는 방법
-- SET @변수명 = 저장할 값;
SET @hello = '안녕하세요 감사합니다';
SELECT @hello;

SET @age = 20;
SELECT @age AS 나이;

-- procedure과 비슷
-- procedure은 긴 SQL 쿼리문을 한 단어로 축약
-- 변수는 자료 하나만 한 단어로 축약
-- 변수 수정은 저장한 코드 밑에 새로 변수 선언하여 수정

SET @age = @age + 10

-- 변수 선언은 2가지 방법이 있음
-- procedure declare 사용
DELIMITER $$
$$
CREATE PROCEDURE mart.var_test()
BEGIN
	DECLARE 변수1 int DEFAULT 123;
	DECLARE 변수2 varchar(100) DEFAULT '안녕하세요';
	SELECT 변수1;
	SELECT 변수2;
END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS mart.var_test;

CALL mart.var_test();

-- @변수와 declare 변수의 차이
-- @변수는 전역변수로 sql을 작성하는 모든 곳에서 사용 가능
-- declare 변수는 지역변수로 procedure 안에서만 사용 가능
-- @변수는 db 연결 종료 시 사라짐
-- procedure 실행 종료 시 사라짐