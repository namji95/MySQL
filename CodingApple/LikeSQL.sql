SELECT * FROM product;
/*
 * 목록에서 내가 원하는 단어가 들어 있는 행만 출력하는 방법
 * LIKE 사용
 * SELECT 컬럼명 FROM 테이블명 WHERE 컬럼명 LIKE %검색명%
 * % > 아무문자 모두를 가리키는 기호
 * '%검색명%' > 아무문자 + 검색명 + 아무문자 > 검색명이 들어간 모든 문자
 * '%검색명' > 아무문자 + 검색명 > 검색명으로 끝나는 문자
 * '검색명%' > 검색명 + 아무문자 > 검색명으로 시작하는 문자
 * % 대신할 수 있는 기호 _
 * 다른점은 _ 기호는 아무문자라는 뜻은 같지만 한글자만 찾아줌
 * */
SELECT * FROM product WHERE 상품명 LIKE '%소파%';
SELECT * FROM product WHERE 상품명 LIKE '%소파';
SELECT * FROM product WHERE 상품명 LIKE '소파%';

-- Green으로 시작해서 chair로 끝나는 상품명 검색
SELECT * FROM product WHERE 상품명 LIKE 'Green%chair';

-- 상품명에 소파가 들어 있거나 chair가 들어 있는 모든 상품 검색
SELECT * FROM product WHERE 상품명 LIKE '%소파%' OR 상품명 LIKE '%chair%';

-- 상품명에 소파가 들어 있는데 나무는 들어 있지 않은 모든 상품 검색
SELECT * FROM product WHERE 상품명 LIKE '%소파%' AND NOT 상품명 LIKE '%나무%';

SELECT * FROM product WHERE 상품명 LIKE '원%';