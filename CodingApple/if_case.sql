-- if / case 문법 가변적인 숫자나 문자 기입하는 방법
-- if(조건식, 조건식이 맞을 때 남길 값, 조건식이 틀릴 때 남길 값)
-- ex)
SELECT if(1+2=3, 'aaa', 'bbb');
SELECT if(1+2=4, 'aaa', 'bbb');
SELECT 사용금액, IF(사용금액 > 200000, '우수', '준수') FROM card;
-- if문은 선택을 하나밖에 못 하기 때문에 이때 case문을 사용하면 됨
-- if문 안에 if문을 넣을 수 있지만 복잡하다.

-- case 문법 작성법
-- CASE
-- 	WHEN 조건식1 THEN 남길값1
-- 	WHEN 조건식2 THEN 남길값2
-- 	else 남길값 (생략 가능)
-- END
SELECT 사용금액,
CASE
	WHEN 사용금액 >= 200000 THEN '우수'
	WHEN 사용금액 >= 100000 AND 사용금액 < 200000 THEN '준수'
	WHEN 사용금액 < 100000 THEN '거지'
	ELSE 
END AS 평가
FROM card;

-- 등급이 vip면 3점 로열은 2점 패밀리는 1점
SELECT sum(
CASE
	WHEN 고객등급 = 'vip' THEN 3
	WHEN 고객등급 = '로열' THEN 2
	ELSE 1
END
) FROM card;
SELECT sum(3) FROM card;

-- quiz1 사용금액 30만원 이상은 50% 증액, 30만원 미만은 10% 증액해서
-- 사용금액의 총 합계를 출력 5147559
SELECT sum(
IF(사용금액 >= 300000, 사용금액 * 1.5, 사용금액 * 1.1)) AS 총합
FROM mart.card;

-- quiz2 사용금액이 30만원 이상은 vip 20만원 이상 30만원 미만은 로열 그 외엔 패밀리로 다시 설정해보기
SELECT 고객명, 사용금액, 고객등급,
CASE
	WHEN 사용금액 >= 300000 THEN 'vip'
	WHEN 사용금액 >= 200000 THEN '로열'
	ELSE '패밀리'
END
FROM card;
-- 이러면 현재 고객등급과 바뀔 고객등급이 차례로 출력
-- 이 상황에서 현재 고객등급 != 바뀔 고객등급인 행만 필터링
SELECT 고객명, 사용금액, 고객등급
FROM card
WHERE 고객등급 != CASE
	WHEN 사용금액 >= 300000 THEN 'vip'
	WHEN 사용금액 >= 200000 THEN '로열'
	ELSE '패밀리'
END

