-- 데이터베이스 생성
CREATE DATABASE 테스트;

-- 데이터베이스 삭제
DROP DATABASE 테스트;

-- 테이블 생성
-- 주의 테이블 생성하고 싶은 DB 우클릭을 통한 sql 에디터 생성 후 쿼리문 작성
-- CREATE TABLE DB.작명 ();
-- default를 작성하면 테이블 생성 시 컬럼에 삽입되어 출력
CREATE TABLE 테스트.new_table (
	id int,
	이름 varchar(100) DEFAULT '홍길동',
	나이 int
);