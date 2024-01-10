-- replace(바꿀 컬럼, 현재 값, 바꿀 값)
select restaurant_name "원래 상점명",
       replace(restaurant_name, 'Blue', 'Pink') "바뀐 상점명"
from food_orders
where restaurant_name like '%Blue Ribbon%';

select addr "원래 주소",
       replace(addr, '문곡리', '문가리') "바뀐 주소"
from food_orders
where addr like '%문곡리%';

-- substr(조회 할 컬럼, 시작 위치, 글자 수)
select addr "원래 주소",
       substr(addr, 1, 2) "시도"
from food_orders
where addr like '%서울특별시%';

-- concat(붙이고 싶은 값1, 붙이고 싶은 값2, 붙이고 싶은 값3, .....)
select restaurant_name "원래 이름",   
       addr "원래 주소",
       concat('[', substring(addr, 1, 2), '] ', restaurant_name) "바뀐 이름"
from food_orders
where addr like '%서울%';

select restaurant_name "원래 이름",   
       addr "원래 주소",
       CONCAT(restaurant_name, ' - ', cuisine_type) "음식타입별 음식점",
       concat('[', substring(addr, 1, 2), '] ', restaurant_name) "바뀐 이름"
from food_orders
where addr like '%서울%';

-- group by 사용
select substring(addr, 1, 2) "시도",
       cuisine_type "음식 종류",
       avg(price) "평균 금액"
from food_orders
where addr like '%서울%'
group by 1, 2;

select substring(email, 10) "이메일 도메인",
       count(customer_id) "고객 수",
       avg(age) "평균 연령"
from customers
group by 1;

select concat('[', substring(addr, 1, 2), '] ', restaurant_name, ' (', cuisine_type, ')') "바뀐이름",
       count(1) "주문건수"
from food_orders
group by 1;