-- PROCEDURE과 FUNCTION에서 IF문 사용하기
-- DELIMITER $$
-- CREATE PROCEDURE mart.test
-- BEGIN
-- 	
-- 	IF 조건식1 THEN
-- 		실행할 SQL 쿼리문;
--	ELSEIF 조건식2 THEN
--		실행할 SQL 쿼리문;
-- 	ELSE
-- 		실행할 SQL 쿼리문;
-- 	END IF;
-- 	
-- END $$
-- DELIMITER ;

DROP PROCEDURE IF EXISTS mart.test;

-- 사용금액 범위 지정으로 출력하는 문구 다르게 하기
DELIMITER $$
CREATE PROCEDURE mart.test()
BEGIN
	
	IF (SELECT sum(사용금액) FROM mart.card) > 5000000 THEN
		SELECT '잘했어요';
	ELSE 
		SELECT '분발하세요';
	END IF;
	
	
END $$
DELIMITER ;

CALL mart.test();

SELECT sum(사용금액) FROM card; 

-- 나이 입력으로 미성년자여부 판단해주는 함수

DROP FUNCTION IF EXISTS mart.age;

DELIMITER $$
CREATE FUNCTION mart.age(나이 int)
RETURNS varchar(100)
DETERMINISTIC
BEGIN
	
	IF 나이 < 20 THEN
		RETURN '미성년자에요';
	ELSE 
		RETURN '미성년자 아니에요';
	END IF;
	
END $$
DELIMITER ;

SELECT mart.age(10);

-- quiz1 월을 파라미터로 입력하면 '해당 월이 며칠까지 있는지'를 리턴해주는 함수 만들어보기
-- 이상한 숫자를 넣으면 0을 return하게 함
-- select 함수(3);을 실행하면 31이 출력
-- select 함수(2);를 실행하면 28이 출력 (윤년 무시)
-- select 함수(13);을 실행하면 0일 출력 (13월 존재 X)
DELIMITER $$
CREATE FUNCTION mart.calendar (num int)
RETURNS int
DETERMINISTIC 
BEGIN 
	IF num IN (1,3,5,7,8,10,12) THEN
		RETURN 31;
	ELSEIF num IN (4,6,9,11) THEN
		RETURN 30;
	ELSEIF num = 2 THEN 
		RETURN 28;
	ELSE
		RETURN 0;		
	END IF;
	
END $$
DELIMITER ;

SELECT mart.calendar (1);

-- quiz2 파라미터로 '평균'을 입력하면 card 테이블 사용금액 컬럼의 평균을 구해주고
-- '최댓값'을 입력하면 사용금액의 최댓값
-- '최빈값'을 입력하면 고객등급의 최빈값의 등장횟수를 구해주는 procedure 만들어보기
-- 최빈값이란 vip라는 문자가 가장 많이 있으면 vip 테이블이 몇개 있는지 출력하는 문제
-- CALL 프로시져('평균');을 실행하면 245766.6이 출력 (사용금액 평균값)
-- CALL 프로시져('최댓값');을 실행하면 894000이 출력 (사용금액 최댓값)
-- CALL 프로시져('최빈값');을 실행하면 6이 출력 (vip가 최빈값으로 6번 출력)
DELIMITER $$
CREATE PROCEDURE mart.proced(입력 varchar(100))
BEGIN
	IF 입력 = '평균' THEN
		SELECT avg(사용금액) FROM mart.card;
	ELSEIF 입력 = '최댓값' THEN
		SELECT max(사용금액) FROM mart.card;
	ELSEIF 입력 = '최빈값' THEN
		SELECT 고객등급, count(고객등급) FROM mart.card
		GROUP BY 고객등급 ORDER BY count(고객등급) DESC LIMIT 1; 		
	END IF;
	
END $$
DELIMITER ;

CALL mart.proced('평균');
CALL mart.proced('최댓값');
CALL mart.proced('최빈값');
