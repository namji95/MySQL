-- MIN, MAX, AVG, SUM 집계함수로 통계내기
SELECT * FROM card;

-- 최댓값을 구하기 위한 함수로 max(컬럼명)를 사용하면 된다.
SELECT max(사용금액) FROM card;

-- 최솟값을 구하기 위한 함수로 min(컬럼명)를 사용하면 된다.
SELECT min(사용금액) FROM card;

-- 평균을 구하기 위한 함수로 avg(컬럼명)를 사용하면 된다.
SELECT avg(사용금액) FROM card;

-- 합계를 구하기 위한 함수로 sum(컬럼명)를 사용하면 된다.
SELECT sum(사용금액) FROM card;

-- 현재행의 갯수를 구하기 위한 함수로 count(컬럼명)를 사용하면 된다.
SELECT count(사용금액) FROM card;

-- 집계함수는 한 컬럼만 구한다. 대신 ,를 이용하여 각각 다른 집계함수를 구하는 것은 상관없음
SELECT max(사용금액), min(결제횟수) FROM card;

-- AS문법으로 컬럼명을 바꿔서 출력 가능
-- SELECT 컬럼명 AS 작명 FROM 테이블명 기본적으로 이렇게 작성 
SELECT max(사용금액) AS 최댓값 FROM card;

-- 일부만 평균내는 방법 > 고객등급이 vip의 사용금액 평균 내보기
SELECT avg(사용금액) FROM card WHERE 고객등급 = 'vip';

-- 중복 제거하는 방법 DISTINCT 문법 사용 컬럼명 왼쪽에 작성
SELECT DISTINCT 연체횟수 FROM card;

-- 중복제거 DISTINCT 또 다른 사용법
SELECT avg(DISTINCT 연체횟수) FROM card;
SELECT sum(DISTINCT 연체횟수) FROM card;

-- max와 min을 사용하지 않고 최대 최소 값 구하는 방법 > 오르차순 및 내림차순 사용
SELECT 사용금액 FROM card ORDER BY 사용금액 ASC; -- 최솟값
SELECT 사용금액 FROM card ORDER BY 사용금액 DESC; -- 최댓값


 
