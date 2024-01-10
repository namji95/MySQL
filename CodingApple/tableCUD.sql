-- database 생성
-- CREATE DATABASE db명;
CREATE DATABASE 테스트;

-- database 삭제
-- DROP DATABASE db명;
DROP DATABASE 테스트;

-- 테이블 생성
-- CREATE TABLE db명.table명
-- 컬럼 뒤에 default 입력 후 값 작성하면 테이블 생성 시 데이터 입력이 없으면 null로 생성되는데
-- default 값을 입력하면 default 값이 들어가 있음
CREATE TABLE 테스트.new_table (
	id int,
	이름 varchar(100),
	나이 int
);

-- 테이블 삭제
-- DROP TABLE table명;
DROP TABLE new_table;

-- 테이블 수정
-- ALTER TABLE NEW_table ADD 컬럼명 데이터타입
ALTER TABLE NEW_table ADD 컬럼명 varchar(100);

-- 컬럼 수정
ALTER TABLE new_table MODIFY COLUMN 나이 varchar(100);

-- 컬럼 내 값이 있을 때 데이터 타입이 다른 값으로 변경하려고 하면 안됨