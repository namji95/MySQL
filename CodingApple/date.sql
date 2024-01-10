-- date 알아보기
-- DATE : YYYY-MM-DD : 9999년까지 저장 가능
-- DATETIME() : YYYY-MM-DD hh:mm:ss 9999년까지 저장 가능
-- () 안에 1~6까지 기입 가능 의미는 0.소수점 자리수 최소 0.0 ~ 0.000000자리까지 출력 가능
-- TIMESTAMP : YYYY-MM-DD hh:mm:ss 2038년까지 저장 가능
-- date는 DBMS 마다 조금씩 다름
-- 기입 방법
-- INSERT INTO datetable VALUES ('2020-01-01 12:00:00');

INSERT INTO datetable VALUES ('2020-01-01 12:00:00');

SELECT * FROM blog;

-- 날짜 조회 (년월일 날짜만으로 필터링은 =기호로 불가능 범위 지정해줘야 함)
SELECT * FROM blog WHERE 발행일 > '2022-03-09 23:24:25';
SELECT * FROM blog WHERE 발행일 = '2022-03-09 23:24:25';

-- 날짜 조회 범위 지정
SELECT * FROM blog WHERE 발행일 > '2022-03-09 00:00:00'
AND 발행일 < '2022-03-10 00:00:00';

-- 아래의 코드 보다는 위의 코드가 더 좋다.

SELECT * FROM blog WHERE BETWEEN '2022-03-09 00:00:00'
AND '2022-03-10 00:00:00'; 

-- now() : 현재 DATETIME 남겨줌 괄호 안에는 1~6까지 기입 가능 초를 소수점 자릿수 지정
SELECT * FROM blog WHERE 발행일 >= '2022-03-09 00:00:00'
AND 발행일 < now();

-- 날짜 / 시간을 다른 형식으로 포맷팅
-- 바꿀 형식에 %Y, %m, %d을 작성하면 왼쪽 값의 년, 월, 일 출력
-- %H, %i, %s를 작성하면 왼쪽 값의 시, 분, 초 출력
-- SELECT date_format(날짜시간, '바꿀형식')
SELECT date_format(now(), '%Y몇일?');
