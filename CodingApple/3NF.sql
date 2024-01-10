-- 제3정규화
-- transitive dependency 제거
-- 즉, 쓸데없는 컬럼에 종속된 컬럼은 빼기
-- 유의사항
-- 1. 첫 컬럼은 항상 primary key를 넣는게 좋다.
-- 2. 다른 테이블의 데이터 사용 시 primary key 적을 수 있으면 적기
-- foreign key = 다른 테이블 primary key를 사용하는 컬럼에 지정

-- foreign key 사용법
CREATE TABLE program (
	id int,
	프로그램 varchar(100),
	가격 int,
	강사id int
);
CREATE TABLE teacher (
	id int,
	teacher varchar(100),
	collage varchar(100)
);

-- foreign key 작성
-- CREATE TABLE 테이블명 (
-- 	컬럼명 데이터타입 REFERENCES 다른테이블 (다른테이블컬럼)
-- )

ALTER TABLE program MODIFY COLUMN id int PRIMARY KEY;
ALTER TABLE 테스트.teacher MODIFY COLUMN id int PRIMARY KEY;
ALTER TABLE 테스트.teacher CHANGE teacher 강사  varchar(100);
ALTER TABLE 테스트.teacher CHANGE collage 출신대학 varchar(100);

-- quiz
CREATE TABLE 구매내역 (
	아이디 varchar(100),
	이름 varchar(100),
	상품명 varchar(100),
	상품카테고리 varchar(100),
	구매수량 int,
	구매날짜 varchar(100),
	가격 int,
	무료배송여부 varchar(100)
);
-- 위 테이블에서 2,3 정규화 해보기
-- 상품카테고리는 항상 상품명에 의해 결정
-- 무료배송여부는 항상 상품카테고리에 의해 결정
-- 가격은 상품 1개의 가격