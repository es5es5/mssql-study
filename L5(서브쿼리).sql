use study
go

select * from companyinfo;

-- 서울소재 기업의 2020년 10월 12일자 주식가격을 반환하라
-- 반환된 쿼리에 SEOUL 이라는 이름을 붙이고 메인 쿼리에서 그 주식가격이 50만원 이상인 내용을 반환하라
select seoul.Name, seoul.close_
from
(select C.Name, S.Date_, S.close_
from companyinfo C
Join StockPrice S
on C.ID = S.ID
where City = 'Seoul' and S.Date_ = '20201012'
) seoul
where close_ >= 500000



-- 단일 값 형태의 서브쿼리

-- ID 40853 의 주식가격 최고가를 반환
-- StockPrice 그 가격이었을 때의 정보를 반환
select *
from StockPrice 
where ID = 40853
and close_ =
(
select MAX(close_) from StockPrice where ID = 40853
)

-- 단일 열 테이블 형태의 서브쿼리

-- 주식가격 최고가가 50만원 이상인 기업의 ID를 반환하라
-- 그 기업의 이름(name)만 Select
select name
from companyinfo C
where ID IN
(
select ID
from StockPrice S
Group by ID
having MAX(close_) >= 500000
)

