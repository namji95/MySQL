-- transaction이란 여러개의 쿼리문 중에서 하나라도 에러가 나면 전체 쿼리문을 취소하는 방법
-- transaction 작성법
-- START TRANSACTION
-- COMMIT 
-- ROLLBACK
DELETE FROM product WHERE 번호 = 101;
INSERT INTO mart.product VALUES (100, 'a', 'a', 1, 1);
INSERT INTO mart.product VALUES (101, 'b', 'b', 2, 2);
SELECT * FROM product;

-- START TRANSACTION만 작성하여 실행하면 TRANSACTION 모드가 켜짐
-- 이후 쿼리문을 실행해도 실제 테이블에는 적용되지 않음 보류됨
-- START TRANSACTION ;
-- TRANSACTION 실행 후 실제 테이블에 적용하기 위해서는 COMMIT을 해야 됨
-- COMMIT ;
-- 쿼리문을 실행하고 rollback을 하면 실행이 취소됨
-- ROLLBACK;
-- MySQL이 아닌 다른 DBMS는 try catch를 이용하여 실행 오류가 나면 에러를 반환하는 문법이 있지만
-- MySQL은 try catch 문법이 아닌 DECLARE EXIT이라는 문법 사용
-- DROP PROCEDURE IF EXISTS 테스트.transaction_test; 
-- DELIMITER $$ 
-- CREATE PROCEDURE 테스트.transaction_test() 
-- BEGIN 
-- 
--   DECLARE EXIT HANDLER FOR SQLEXCEPTION
--   BEGIN 
--     ROLLBACK;
--   END;
--   
--   START TRANSACTION;
--     INSERT INTO 테스트.teacher VALUES (100, '테스트', '테스트', 1, 1);
--     INSERT INTO 테스트.teacher VALUES (10, '테스트', '테스트','ㄴㅇㄹ'); 여기서 에러 발생했다고 가정하면 rollback으로 넘어감
--		그게 아니라면 commit 후 테이블에 반영
--   COMMIT; 
--   
-- END$$ 
-- DELIMITER ; 
-- 
-- CALL 테스트.transaction_test();

-- 참고1
-- AUTO COMMIT 
-- 테이블 만들 때 엔진을 innoDB로 설정해 노흥면 (기본이 innoDB)
-- 모든 일반 쿼리문은 하나의 TRANSACTION으로 처리
-- 작성한 모든 쿼리문을 한 줄 마다 START TRANSACTION / COMMIT으로 몰래 감싸놓고 실행해주다는 뜻
-- 이걸 AUTO COMMIT 기능이라고 함
-- 그래서 내가 작성한 INSERT문과 같은 문법이 한 줄이 실행될 때마다 바로바로 테이블에 반영됨
-- AUTO COMMIT 기능을 끄고 싶으면
-- START TRANSACTION 코드를 실행하면 자동으로 꺼짐

-- 참고2
-- TRANSACTION 기능을 ACID TRANSACTION 이렇게 부르는 경우가 있는데
-- ATOMICITY, CONSISTENCY, ISOLATION, DURABILITY 속성을 가져야 TRANSACTION이라고 부를 수 있다는
-- TRANSACTION 기능의 교과서적인 정의같은 것임
-- 
-- ATOMICITY : 1개의 TRANSACTION 안에 있는 코드들은 전부 실행되거나 실행되지 않아야 한다.
-- CONSISTENCY : TRANSACTION은 조작하려는 테이블의 제약조건과 룰 같은걸 잘 따라야 한다.
-- ISOLATION : TRANSACTION끼리는 서로 간섭하지 않아야 한다.
-- DURABILITY : TRANSACTION이 COMMIT 되면 데이터베이스에 영구적으로 기록 되어야 한다.(컴퓨터를 껐다 켜도)
-- 
-- 이렇게 4개 속성을 만족하면서 TRANSACTION이 동작 되어야 한다고 정의하는 경우가 있다.