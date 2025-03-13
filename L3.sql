use study
go

select *
from companyinfo
where id = 40853

select *
from StockPrice

select max(close_) as 최고가, min(close_) as 최소가, avg(close_) as 평균가
from StockPrice
where id = 40853

select id, max(close_) as 최고가, min(close_) as 최소가, avg(close_) as 평균가, COUNT(close_) as 거래일수
from StockPrice
group by id
order by 거래일수

select city
, sum(employees) as 고용인
, max(employees) as 최대고용
, count(*) as 회사수
from companyinfo
group by City
order by 고용인 desc

-- 고용인이 200만 명 이상인 도시 알아보기
select city
, sum(employees) as 고용인
, max(employees) as 최대고용
, count(*) as 회사수
from companyinfo
group by City
having sum(employees) >= 2000000
order by 고용인 desc
