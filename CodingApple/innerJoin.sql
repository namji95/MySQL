-- inner join 사용법
SELECT 프로그램, 강사, 출신대학 FROM program, teacher;
-- 이런식으로 출력 가능
-- 테이블간 컬럼명이 겹치는 것을 방지하기 위해 아래와 같이 작성
SELECT program.프로그램, 강사, 출신대학 FROM program, teacher;

SELECT * FROM program, teacher;
-- 이렇게 작성하면 각 테이블에서 가능한 모든 행의 조합을 출력

-- 테이블 2개 합쳐서 출력하는 방법
SELECT * FROM program, teacher
WHERE 강사id = teacher.id;

-- inner join을 사용하여 테이블 2개 합치기
SELECT * FROM program INNER JOIN teacher;
SELECT * FROM program INNER JOIN teacher
ON 강사id = teacher.id;
SELECT 프로그램, 가격, 강사, 출신대학 
FROM program INNER JOIN teacher
ON 강사id = teacher.id;

-- 응용 테이블 여러개 합치기
-- SELECT * FROM 테이블1, 테이블2, 테이블3 ....
-- SELECT * FROM 테이블1 
-- INNER JOIN 테이블2 ON 
-- INNER JOIN 테이블3 ON ~~~
-- 테이블1과 테이블2를 inner join 해주고
-- 그 결과를 테이블3과 inner join 해주는 방식

-- cross join = 모든 행의 조합 출력 가능
-- 더미데이터가 필요할 때도 간혹 사용
-- 보통 inner join 사용
SELECT * FROM program CROSS JOIN teacher;
