SELECT * FROM program_1 INNER JOIN teacher_1
ON program_1.강사id = teacher_1.id;

-- left join = inner join + 왼쪽 테이블 전부 출력
SELECT * FROM program_1 LEFT JOIN teacher_1
ON program_1.강사id = teacher_1.id;

-- right join = inner join + 오른쪽 테이블 전부 출력
SELECT * FROM program_1 RIGHT JOIN teacher_1
ON program_1.강사id = teacher_1.id;

-- left join과 right join은 두 테이블간 접점이 없는 행들을 출력하고 싶을 때 사용

-- null 값만 골라서 출력해보기 left join과 left outer는 같은 의미
SELECT * FROM program_1 RIGHT JOIN teacher_1
ON 강사id = teacher.id 
WHERE 강사id IS NULL;