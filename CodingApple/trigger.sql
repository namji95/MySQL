-- TRIGGER 사용법
-- DB에 INSERT UPDATE DELETE 실행 시 
-- 자동으로 다른 코드도 실행되게 만들기 위해 사용
CREATE TABLE trigger_test.product(
  상품명 varchar(100),
  가격 int
);
CREATE TABLE trigger_test.counter(
  자료 varchar(100),
  값 int
);

-- TRIGGER 기본 문법
-- DROP TRIGGER IF EXISTS db명.트리거이름;
-- DELIMITER $$ -- 세미콜론 대신 문법의 시작과 끝을 알리는 기호 설정
-- CREATE TRIGGER db명.트리거이름
-- AFTER INSERT ON db명.테이블명
-- FOR EACH ROW 
-- BEGIN
-- 
--   실행할코드~~
-- 
-- END $$
-- DELIMITER ; 

-- TRIGGER 기본 문법 설명
-- DROP TRIGGER IF EXISTS db명.트리거이름;
-- 트리거 제거 문법
-- DELIMITER $$ 
-- 세미콜론 대신 문법의 시작과 끝을 알리는 기호 설정
-- CREATE TRIGGER db명.트리거이름
-- 트리거 생성
-- AFTER INSERT ON db명.테이블명 
-- AFTER : AFTER 뒤의 코드가 실행 된 후에 BEGIN ~ END 문법 실행
-- BEFORE : BEFORE 뒤의 코드가 실행되기 전에 BEGIN ~ END 문법 실행 후 BEFORE 뒤의 문법 실행
-- AFTER나 BEFORE가 오는 자리 뒤에는 INSERT UPDATE DELETE 아무거나 올 수 있음
-- FOR EACH ROW 
-- 이 테이블의 모든 행에
-- BEGIN
-- 
--   실행할코드~~ -- 이 코드를 실행해라
-- 
-- END $$
-- DELIMITER ; 

-- product 테이블에 상품을 추가하면 counter 테이블에도 UPDATE 될 수 있게 하려면 TRIGGER 사용
DROP TRIGGER IF EXISTS trigger_test.counterUp;
DELIMITER $$
CREATE TRIGGER trigger_test.counterUp
AFTER INSERT ON trigger_test.product 
FOR EACH ROW 
BEGIN

	UPDATE trigger_test.counter SET 값 = 값 + 1 WHERE 자료 = '상품갯수';

END $$
DELIMITER ;

INSERT INTO trigger_test.product VALUES ('상품명', 2000);

-- 트리거 내부에서 사용할 수 있는 문법 OLD / NEW
-- DROP TRIGGER IF EXISTS db명.트리거이름;
-- DELIMITER $$ 
-- CREATE TRIGGER db명.트리거이름
-- AFTER INSERT ON db명.테이블명
-- FOR EACH ROW 
-- BEGIN
-- 
-- 	OLD -- 변경 전 데이터
-- 	NEW -- 변경 후 데이터
-- 
-- END $$
-- DELIMITER ; 
-- NEW는 INSERT UPDATE DELETE 의 문법이 실행될 새로운 값이 들어가 있음
-- OLD는 INSERT UPDATE DELETE 의 문법이 실행되기 전의 값이 들어가 있음

-- 서버에서 sql 쿼리문을 관리하는게 에러체크가 쉽고, TRANSACTION 적용도 쉽기 때문에
-- TRIGGER 문법은 참고로 알고 있기만 하기

-- quiz1 trigger_test.product 테이블에 있던 데이터 삭제 시 counter 테이블에 있던 숫자도 -1이 되도록 trigger 만들어보기
DROP TRIGGER IF EXISTS trigger_test.triggerDown;
DELIMITER $$ 
CREATE TRIGGER trigger_test.triggerDown 
AFTER DELETE ON trigger_test.product 
FOR EACH ROW 
BEGIN

    UPDATE trigger_test.counter SET 값 = 값 - 1 WHERE 자료 = '상품갯수';

END $$
DELIMITER ; 

-- quiz2 trigger_test.product 테이블에 있는 가격을 수정할 때 이전 가격보다 10% 넘게 변동시 변경 불가능하게 만드는 TRIGGER 만들어보기
DROP TRIGGER IF EXISTS trigger_test.notChageTrigger;
DELIMITER $$ 
CREATE TRIGGER trigger_test.notChageTrigger 
BEFORE UPDATE ON trigger_test.product 
FOR EACH ROW 
BEGIN

    IF (NEW.가격 - OLD.가격) / OLD.가격 > 0.1 THEN 
        SET NEW.가격 = OLD.가격; 
    END IF;

END $$
DELIMITER ; 