-- group by를 통해 통계내는 방법
SELECT avg(사용금액) FROM card WHERE 고객등급 = 'vip';
SELECT avg(사용금액) FROM card WHERE 고객등급 = '패밀리';
SELECT avg(사용금액) FROM card WHERE 고객등급 = '로열';
 
-- 위 세개를 group by로 작성해 보기
SELECT 고객등급, avg(사용금액) FROM card GROUP BY 고객등급;
-- group by 뒤에는 주로 카테고리 컬럼을 사용

-- group by 필터링
SELECT 고객등급, avg(사용금액) FROM card GROUP BY 고객등급 HAVING 고객등급 = 'vip' OR 고객등급 = '패밀리';

-- where / having 차이
-- having은 주로 group by 뒤에 사용 (group by 결과 필터링)
-- where은 주로 select from (select from 결과 필터링)
-- 예시
SELECT 고객등급, max(사용금액) FROM card WHERE 연체횟수 = 0 GROUP BY  고객등급 HAVING 고객등급 = 'vip';

-- quiz1 card 테이블에서 연체횟수마다 몇명이 있는지 출력해보기
SELECT 연체횟수, count(*) AS 몇명 FROM card GROUP BY 연체횟수 ORDER BY 연체횟수;

-- quiz1에서 출력한 결과가 너무 길어서 몇명 컬럼의 값이 1명인 행은 안 보이게 필터링 해보기
SELECT 연체횟수, count(*) AS 몇명 FROM card GROUP BY 연체횟수 HAVING 몇명 != 1 ORDER BY 연체횟수;

-- quiz3 card 테이블에서 회원등급별로 최대사용금액과 최소사용금액이 몇배나 차이나는지 구해보기
SELECT max(사용금애), min(사용금액), max(사용금액) / min(사용금액) FROM card WHERE 고객등급 = 'vip';
SELECT max(사용금액), min(사용금액), max(사용금액) / min(사용금액) FROM card WHERE 고객등급 = '패밀리';
SELECT 고객등급, max(사용금액), min(사용금액), max(사용금액) / min(사용금액) FROM card GROUP BY 고객등급 ORDER BY 고객등급;
