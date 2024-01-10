-- UNION = 여러개의 SELECT문을 하나로 합칠 수 있음
-- 대신 컬럼수가 다르면 안됨
-- UNION은 죽복 데이터를 제외하고 출력
-- UNION을 사용하여 중복 데이터도 출력하는 방법은 UNION 뒤에 ALL 작성
-- JOIN과 UNION의 차이점은 
-- JOIN은 테이블을 양옆으로 부착한다 생각하면 되고,
-- UNION은 테이블을 위아래로 부착한다 생각하면 됨
-- SELECT*FROM 테이블명 UNION SELECT*FROM 테이블명
-- 컬럼으로도 찾을 수 있음
-- SELECT*FROM 테이블명 WHERE 컬럼명=컬럼값 UNION SELECT*FROM 테이블명 WHERE 컬럼명=컬럼값
SELECT * FROM insertTest.stock
UNION
SELECT * FROM insertTest.stock2;

SELECT * FROM insertTest.stock WHERE id = 1
UNION 
SELECT * FROM insertTest.stock2 WHERE id = 1;

SELECT * FROM insertTest.stock WHERE id = 1 OR id = 2;