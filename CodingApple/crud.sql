CREATE TABLE stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  상품명 varchar(100),
  가격 INT
);

-- insert문
-- insert into 테이블명 (컬럼명) values (데이터);
-- 컬럼명은 내가 저장한 테이블의 컬럼명을 기입하면 되고 ,로 구분
-- values 뒤에 데이터는 컬럼의 순서에 맞게 기입
-- 만약 컬럼을 모두 사용하면 컬럼명 생략 가능
-- values 값에도 서브쿼리 작성 가능 values 대신으로도 서브쿼리 작성 가능
INSERT INTO insertTest.stock (id, 상품명, 가격) 
VALUES (1, '김치', 500);
INSERT INTO insertTest.stock (id, 상품명, 가격) 
VALUES (2, '' ,500);
INSERT INTO insertTest.stock
VALUES (4, '참외', 2000);
INSERT INTO insertTest.stock
VALUES (5, '배추', 2500);

-- values 대시 select문 활용해보기
INSERT INTO stock SELECT * FROM stock2;

-- 기존 테이블을 복사하여 새로운 테이블로 생성할 때
-- SELECT * INTO 새로운 테이블 명 FROM 기존 테이블 명
-- mySQL에서는 CREATE TABLE 새로운 테이블 명 SELECT * FROM 기존 테이블 명
-- CREATE 뒤에 TEMPORARY를 붙이면 임시 테이블 생성 db 종료 후 다시 접속하면 사라짐
-- CREATE TEMPORARY TABLE 새로운 테이블 명 SELECT * FROM 기존 테이블 명

-- update문
-- UPDATE stock SET 수정하고 싶은 컬럼 = 수정 값 WHERE 수정하고 싶은 행 = 행 구분 값
-- ,로 여러가지 컬럼을 수정할 수 있음
-- 값을 변경하고 싶을 때 내가 직접 입력한 값을 넣어도 되지만 수정 값에 수정하고 싶은 컬럼을 더하면
-- 원래 있던 값과 수정하려는 값을 더해서 입력
-- join한 테이블도 수정 가능
-- UPDATE A INNER JOIN B ON SET 수정하고 싶은 컬럼 = 수정 값 WHERE 수정하고 싶은 행 = 행 구분 값
UPDATE stock SET 가격 = 1000 WHERE id = 1;
UPDATE stock SET 가격 = 가격 + 1000 WHERE id = 1;
-- update문에서 where을 빼면 모든 행에 수정됨
UPDATE stock SET 가격 = 가격 + 100;

-- delete문
-- DELETE FROM 테이블명 WHERE 삭제하고 싶은 행 = 행 구분 값
-- delete문도 where를 빼면 모든 행이 삭제됨
-- 다른 테이블에서 foreign key로 사용중일 경우 삭제되지 않음
-- DELETE 삭제하고 싶은 행의 테이블 FROM A INNER JOIN B ON 삭제하고 싶은 행 WHERE 삭제하고 싶은 행의 값
DELETE FROM stock WHERE id = 100;

-- quiz1 테이블 2개 조인 후 update 해보기

-- quiz2 테이블 2개 조인 후 delete 해보기

-- quiz3 공백인 곳에 일괄적으로 데이터를 기입해보기 (email 예시)
-- UPDATE 테이블명 SET email = IF (조건식) WHERE email = '';
-- 공백이라 where 조건에 '' 처리

-- quiz4 null값들 일괄 삭제해보기
-- DELETE FROM 테이블명 WHERE 컬럼명 IS NULL;