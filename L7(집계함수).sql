-- 집계 함수

-- Employees에 집계 함수 적용하기
select SUM(employees) as 합계
, AVG(employees) as 평균
, MAX(employees) as 최대
, MIN(employees) as 최소
, COUNT(employees) as 갯수
from companyinfo;
