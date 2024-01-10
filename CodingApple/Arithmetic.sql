-- 사칙연산 sql문 작성법 (사칙연사는 숫자 컬럼에만 사용 가능)

SELECT * FROM card;

SELECT 사용금액 FROM card;

SELECT 사용금액 * 10 FROM card;

SELECT 사용금액 * 10, 연체횟수 * 10 FROM card;

SELECT 사용금액 * 10 AS 실제사용금액 FROM card;

SELECT 사용금액 * 결제횟수 FROM card;

-- 문자끼리 덧셈하는 방법 concat 사용
SELECT concat(고객명, 고객등급) FROM card;

-- 문자 덧셈은 컬럼만 연결시키는게 아닌 내가 입력한 문자도 더할 수 있다. ,와 ''사용
SELECT concat(고객명, ' is ', 고객등급) FROM card;

-- postgreSQL, Oracle은 concat 대신 ||을 써야함. 
SELECT 고객명 || ' is ' || 고객등급 FROM card;

-- 공백 제거 trim()
SELECT trim('            공백제거') FROM card;

-- 다른 글자로 교체 replace(바꾸고 싶은 컬럼, 그 컬럼에서 바꾸고 싶은 문자, 바꿀 문자) 사용
SELECT REPLACE(고객등급, '패', '훼')  FROM card;

-- 내가 원하는 문자만 골리서 출력하기 substr() 사용
SELECT substr(고객명, 2, 3) FROM card;

-- 일부 단어를 다른 단어로 교체 insert
SELECT INSERT('test@test.com', 1, 4, 'hello') FROM card;

-- quiz1 특정 문자에 있는 모든 공백을 제고해서 출력하려면 어떻게 해야 할까
SELECT (컬럼명, ' ', '') FROM 테이블명;

-- quiz2 휴대폰 번호를 뒷자리 4글자만 출력하는 방법?
SELECT RIGHT(번호, 4) FROM 테이블명;
SELECT substr(번호, 10, 4) FROM 테이블명; -- 번호가 13자리라면

-- 여러 숫자 중 최대 최소만 뽑아주는 함수
-- greatest, least

-- 소수점들을 정수로 변환하는 함수
-- floor, ceil

-- 소수점 반올림 내림 함수
-- round, truncate

-- 거듭제곱
-- power

-- 절댓값
-- abs