-- PROCEDURE 대신 FUNCTION 사용
-- FUNCTION 특징
-- CALL 없이 사용가능
-- 파라미터 사용 가능
-- BEGIN ~ END 사이 마지막에 RETURN을 꼭 써야함
-- RETURN할 자료의 타입 기입 필요
-- DETERMINISTIC / NO SQL / READS SQL DATA / MODIFIES SQL DATA 기입
-- DETERMINISTIC은 항상 같은 값을 RETURN 할 때 기입
-- NO SQL은 SQL 문법을 사용하지 않을 때 기입
-- READS SQL DATA는 SELECT를 사용할 때 기입
-- MODIFIES SQL DATA는 INSERT DELETE 사용할 때 기입
-- PROCEDURE은 긴 쿼리문을 간단하게 재사용 하기 위해
-- 엄격한 검사는 아니지만 function 읽을 때 이해를 돕기 위해 작성
-- 그래도 DETERMINISTIC은 항상 기입
-- 데이터가 많으면 제대로 기입해야 됨
-- FUNCTION은 계산기능 간단하게 재사용 하기 위해
-- IN, OUT 파라미터 쓰기 쉬워서 function에는 데이터 넣고 뺴기 쉬움
-- CREATE FUNCTION mart.yen(가격 int)
-- RETURNS INT
-- DETERMINISTIC
-- BEGIN
-- 	RETURN 가격 * 0.1 + 50;
-- END

-- ex) product 테이블의 가격 컬럼을 엔화로 바꾼다고 가정하고 function 만들어보기
SELECT yen(가격) FROM product;

-- ex) product 테이블의 가격 컬럼에 배송비를 더해서 출력할 수 있도록 function 만들어보기
-- 단, 가격이 5000원 이상은 배송비 무료인 조건
SELECT delivery(가격) FROM product;

-- 주의 muSQL에서 function 안에서 SELECT 사용금지
-- 단, select로 찾은 결과를 넣어주는건 상관없음