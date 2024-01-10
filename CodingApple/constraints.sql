-- 테이블 안전하게 관리하는 방법
-- 컬럼 제약 조건
-- not null (null 방지)
CREATE TABLE new_table1 (
	id int NOT NULL,
	이름 varchar(100),
	나이 int
);

-- unique (중복 차단)
CREATE TABLE new_table1 (
	id int UNIQUE ,
	이름 varchar(100),
	나이 int
);
CREATE TABLE new_table1 (
	id int,
	이름 varchar(100),
	나이 int
	UNIQUE (이름, 나이)
);

-- check (들어올 데이터 값 검사)
CREATE TABLE new_table1 (
	id int,
	이름 varchar(100),
	나이 int CHECK(나이 > 0)
);

-- primary key (not null과 unique 제약이 자동 부여됨)
CREATE TABLE new_table1 (
	id int PRIMARY KEY,
	이름 varchar(100),
	나이 int
);

-- auto increment (데이터 안 넣어도 자동으로 1씩 증가)
CREATE TABLE new_table1 (
	id int AUTO_INCREMENT PRIMARY KEY ,
	이름 varchar(100),
	나이 int
);

-- 컬럼 마지막에 constraint 작성
CREATE TABLE new_table1 (
	id int,
	이름 varchar(100),
	나이 int
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT CHECK (나이 > 0)
);
-- 이렇게 작성할 수 있음