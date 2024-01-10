-- 제1정규화 제2정규화
-- 제1정규화 = 한 칸엔 하나의 데이터만 작성하는 방법
-- array, json 데이터를 수정하기 힘들어서 제1정규화 사용하는 것이 일반적
-- 제2정규화 = 현재 테이블의 주제와 관련없는 칼람을 다른 테이블로 따로 관리하는 작업
-- 제2정규형 = partial dependency를 제외한 테이블
-- primary key / composite primary key

CREATE TABLE 테스트.book (
	회원아이디 varchar(100),
	책이름 varchar(100),
	날짜 varchar(100),
	회원등급 varchar(100),
	책가격 int,
	반납여부 int
);

-- quiz1 book 테이블에서 책가격 컬럼은 다른 테이블로 옮기는게 좋을까?
-- book 테이블에서 composite primary key는 회원아이디 + 책이름 + 날짜 로 보이고
-- 책가격은 책이름에만 종속되어 있기 때문에 다른 테이블로 옮기는게 좋다.

-- quiz2 book 테이블에서 회원등급 컬럼은 다른 테이블로 옮기는게 좋을까?
-- book 테이블에서 composite primary key는 회원아이디 + 책이름 + 날짜 로 보이고
-- 회원등급은 회원아이디에만 종속되어 있기 때문에 다른 테이블로 옮기는게 좋다.

-- quiz3 book 테이블에서 반납여부 컬럼은 다른 테이블로 옮기는게 좋을까?
-- book 테이블에서 composite primary key는 회원아이디 + 책이름 + 날짜 로 보이고
-- 반납여부는 composite primary key의 조합마다 종속되어야 하기 때문에 옮기지 않는게 좋다.