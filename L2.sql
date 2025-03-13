use study
go

select * from companyinfo

select name, City, IncInCtryCode from companyinfo

select distinct IncInCtryCode from companyinfo

select * from companyinfo where IncInCtryCode='kor'

select * from companyinfo where Employees >= 100000

select * from companyinfo where Employees > 50000 AND IncInCtryCode ='kor'

select * from companyinfo where City = 'seoul' OR City = 'busan'

select * from companyinfo where not IncInCtryCode = 'usa' and not IncInCtryCode ='jpn'

select * from companyinfo where name like 'a%'

select * from companyinfo where name like 'a___' -- aXXXX 글자수 검색

select *
from companyinfo
where IncInCtryCode is not NULL
order by IncInCtryCode, Employees DESC
