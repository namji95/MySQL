-- if(조건, 조건을 충족할 때, 조건을 충족하지 못할 때)
select restaurant_name,
       cuisine_type "원래 음식 타입",
       if(cuisine_type='Korean', '한식', '기타') "음식 타입"
from food_orders;

-- if(조건, 조건을 충족할 때, 조건을 충족하지 못할 때)
-- replace(바꿀 컬럼, 현재 값, 바꿀 값)
select addr "원래 주소",
       if(addr like '%평택군%', replace(addr, '문곡리', '문가리'), addr) "바뀐 주소"
from food_orders
where addr like '%문곡리%';

-- substr(조회 할 컬럼, 시작 위치, 글자 수)
-- if(조건, 조건을 충족할 때, 조건을 충족하지 못할 때)
-- replace(바꿀 컬럼, 현재 값, 바꿀 값)
select substring(if(email like '%gmail%', replace(email, 'gmail', '@gmail'), email), 10) "이메일 도메인",
       count(customer_id) "고객 수",
       avg(age) "평균 연령"
from customers
group by 1;

-- case when 조건1 then 값(수식)1
--      when 조건2 then 값(수식)2
--      else 값(수식)3
-- end

-- if(조건, 조건을 충족할 때, 조건을 충족하지 못할 때)
SELECT CASE WHEN cuisine_type = 'Korean' THEN '한식'
			WHEN cuisine_type IN ('Japanese', 'Chinese') THEN '아시아'
			ELSE '기타' END "음식 타입",
		cuisine_type 
FROM food_orders;

select order_id,
       price,
       quantity,
       case when quantity=1 then price
            when quantity>=2 then price/quantity end "음식 단가"
from food_orders;

select restaurant_name,
       addr,
       case when addr like '%경기도%' then '경기도'
            when addr like '%특별%' or addr like '%광역%' then substring(addr, 1, 5)
            else substring(addr, 1, 2) end "변경된 주소"
from food_orders;

select name,
       age,
       gender,
       case when (age between 10 and 19) and gender='male' then "10대 남자"
            when (age between 10 and 19) and gender='female' then "10대 여자"
            when (age between 20 and 29) and gender='male' then "20대 남자"
            when (age between 20 and 29) and gender='female' then "20대 여자" end "그룹" 
from customers
where age between 10 and 29;

select restaurant_name "음식점 이름",
       price/quantity "단가",
       cuisine_type "음식 국가",
       order_id "주문번호",
       case when (price/quantity <5000) and cuisine_type='Korean' then '한식1'
            when (price/quantity between 5000 and 15000) and cuisine_type='Korean' then '한식2'
            when (price/quantity > 15000) and cuisine_type='Korean' then '한식3'
            when (price/quantity <5000) and cuisine_type in ('Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '아시아식1'
            when (price/quantity between 5000 and 15000) and cuisine_type in ('Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '아시아식2'
            when (price/quantity > 15000) and cuisine_type in ('Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '아시아식3'
            when (price/quantity <5000) and cuisine_type not in ('Korean', 'Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '기타1'
            when (price/quantity between 5000 and 15000) and cuisine_type not in ('Korean', 'Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '기타2'
            when (price/quantity > 15000) and cuisine_type not in ('Korean', 'Japanese', 'Chinese', 'Thai', 'Vietnamese', 'Indian') then '기타3' end "식당 그룹"
from food_orders;

select restaurant_name "식당명",
       order_id "주문번호",
       delivery_time "배달시간",
       price "가격",
       addr "주소",
       case when delivery_time>25 and delivery_time<=30 then price*1.05*(if(addr like '%서울%', 1.1, 1))
            when delivery_time>30 then price*1.1*(if(addr like '%서울%', 1.1, 1))
            else 0 end "수수료"
from food_orders;

select order_id AS "주문번호",
       price AS "가격",
       quantity AS "주문수",
       day_of_the_week AS "요일",
       if(day_of_the_week='Weekday', 3000, 3500)*(if(quantity<=3, 1, 1.2)) "할증료"
from food_orders;

-- data type 변경하는 방법 > cast 함수 사용
-- 숫자로 변경
cast(if(rating='Not given', '1', rating) as decimal); 

-- 문자로 변경
concat(restaurant_name, '-', cast(order_id as char));

SELECT day_of_the_week FROM food_orders;

SELECT
	order_id "주문번호",
	restaurant_name "식당명",
	day_of_the_week "주중, 주말",
	delivery_time "배달 시간",
	CASE WHEN day_of_the_week = 'Weekday'
		 THEN (IF(delivery_time >= 25, "Late", "On-time"))
		 WHEN day_of_the_week = 'Weekend'
		 THEN (IF(delivery_time >= 30, "Late", "On-time"))
	END "지연여부"
FROM food_orders;

select order_id,  
       restaurant_name,
       day_of_the_week,
       delivery_time,
       case when day_of_the_week='Weekday' and delivery_time>=25 then 'Late'
            when day_of_the_week='Weekend' and delivery_time>=30 then 'Late'
            else 'On-time' end "지연여부"
from food_orders