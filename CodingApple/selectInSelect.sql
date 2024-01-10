-- select문 안에 select문 넣기 (서브 쿼리)
SELECT * FROM card;

-- 서브쿼리 예) 사용금액이 평균보다 높은 사람만 출력해 보기
SELECT avg(사용금액) FROM card;
SELECT * FROM card WHERE 사용금액 > 245000;
-- 위 두개 합친 쿼리문
SELECT * FROM card WHERE 사용금액 > (SELECT avg(사용금액) FROM card);
-- 서브쿼리는 2개위 쿼리를 하나로 합칠 때 사용 대신 
-- 1. 문자와 숫자가 들어간 곳에만 사용 가능
-- 2. 1개의 데이터만 출력하는 쿼리문만 서브쿼리 역할 가능 (여러가지 행을 출력은 불가)
-- 3. 서브쿼리 작성시 소괄호 작성 필수

SELECT 사용금액 / (SELECT avg(사용금액) FROM card) FROM card;
-- 이런식으로 작성도 가능

SELECT 사용금액, (SELECT avg(사용금액) FROM card) FROM card;
-- 이런식으로 작성도 가능

-- 서브쿼리 사용법2
SELECT * FROM card WHERE 고객명 IN ('Pristine', 'Amy', 'George');
SELECT * FROM card WHERE 고객명 IN (SELECT 이름 FROM blacklist);

-- quiz1 고객등급이 패밀리인 사람들의 평균 연체횟수 보다 연체횟수가 높은 사람은?
SELECT avg(연체횟수) FROM card WHERE 고객등급 = '패밀리';
SELECT count(*) FROM card WHERE 연체횟수 > 6.25;
-- 위 두개 합치기
SELECT count(*) FROM card WHERE 연체횟수 > (SELECT avg(연체횟수) FROM card WHERE 고객등급 = '패밀리');

-- quiz2 개인의 사용금액이 평균 사용 금액과 얼마나 차이가 있는지 출력
SELECT avg(사용금액) FROM card;
SELECT 고객명, 사용금액, 사용금액 - 245000 AS DIFF FROM card;
-- 위 두개 합치기
SELECT 고객명, 사용금액, 사용금액 - (SELECT avg(사용금액) FROM card) AS DIFF FROM card;