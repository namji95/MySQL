-- Full Text Index이란 어떤 컬럼의 내용을 검색하고 싶을 때
-- 모든 문장들 안에서 모든 단어를 뽑아 정렬시키고 그 단어들이 어떤 행들에 있는지 기억해두고
-- 이 내용을 바탕으로 검색기능 수
-- 이것을 Full Text Index라 부르고 또는 Inverted Index라고 부름
-- stopwords(is are and or the등)을 제거하고 index를 만들어줌
-- 한글은 stopwords 없음
-- Full Text Index 작성법
-- select * from 테이블명 where match(컬럼명) against(검색하고 싶은 단어)
-- 단 2자 이하는 검색이 안됨
-- MySQL Server8.0/my.ini 파일 맨 밑에 (설치폴더 안에 my.ini 파일 찾기)
-- innodb_ft_min_token_size=2를 작성하면 2자 검색 가능
SELECT * FROM library WHERE MATCH(서명) AGAINST('부동산');
-- 기본적으로 아래 코드처럼 IN NATURAL LANGUAGE MODE 이게 생략된 상태
-- IN NATURAL LANGUAGE MODE 이 코드로 인해 stopwords가 제거되어 검색 가능
-- SELECT * FROM library WHERE MATCH(서명) 
-- AGAINST('adfsads' IN NATURAL LANGUAGE MODE);
-- 한글을 검색할 때는 IN BOOLEAN MODE를 작성하면 여러가지 기호를 붙일 수 있음
-- *기호는 아무문자라는 뜻
-- 검색하려는 단어에 띄어쓰기를 사용해서 여러 단어를 작성한 경우 찾으려는 단어를 모두 찾아줌
-- +는 필수를 의미
-- -는 not을 의미
SELECT * FROM library WHERE MATCH(서명)
AGAINST('부동산*' IN BOOLEAN MODE);
-- 단어* 는 단어 뒤에 아무문자나 다 검색하기

SELECT * FROM library WHERE MATCH(서명) 
AGAINST('부동산 종이접기' IN BOOLEAN MODE);
-- 띄어쓰기는 or과 같은 의미로 의 코드로 예를 들면 부동산 또는 종이접기라는 단어가 포함된 행을 다 검색

SELECT * FROM library WHERE MATCH(서명) 
AGAINST('+부동산 +빅데이터' IN BOOLEAN MODE);
-- +는 필수의 의미로 위 코드로 예를 들면 부동산과 빅데이터라는 단어가 필수로 포함되게 행을 검색

SELECT * FROM library WHERE MATCH(서명) 
AGAINST('-부동산 +빅데이터' IN BOOLEAN MODE);
-- 부동산 단어는 제외하고 빅데이터 단어는 필수로 포함하여 검색하기

-- FullTextIndex SQL 쿼리문으로 생성하는 방법
-- ngram parser를 이용하여 FullTextIndex를 만들었을 때의 장점은
-- 기본적으로 FullTextIndex는 띄어씌로 단어를 구분하는데 띄어쓰기를 하지 않는 단어들을 구분하지 못한다.
-- ngram parser를 이용하면 두자씩 끊어서 index로 저장하기 때문에 띄어쓰기에 방해받지 않고 검색할 수 있다.
-- 예를 들어 "가나 다라"를 실수로 "가 나다라"라고 저장했다면
-- ngram parser를 이용하지 않는다면 "가나"라고 검색하면 검색되지 않지만
-- ngram parser를 이용하면 index에 "가나", "나다", "다라" 라고 저장되어 "가나"를 검색해도 검색이 가능함

-- fulltextindex를 삭제하고 ngram parser로 다시 생성해보기
CREATE FULLTEXT INDEX ngram_parser ON library(서명) WITH PARSER ngram;
-- index를 확인하기 위해 검색
SELECT * FROM library WHERE MATCH(서명) against('철학을');

-- NATURAL LANGUAGE MODE로 검색하면 관려도 높은걸 먼저 출력 (단어가 많이 포함된 행 등등)
-- 검색 기능이 중요하면 elastic search 등 쓰는게 좋다