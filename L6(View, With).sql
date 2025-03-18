-- view
-- 저장장치 내에 물리적으로 존재하지 않지만 사용자에게 있는 것처럼 사용

-- vw_stockpircewithname 이름의 view 생성하기
create view vw_stockpircewithname as
select C.Name
, C.ID
, S.Date_
, S.close_
from companyinfo C
join StockPrice S
on C.ID = S.ID

-- view 를 이용해 코드 만들기

-- NVIDIA라는 기업의 이름으로 주가 검색 가능
select * 
from vw_stockpircewithname
where Name = 'nvidia'
order by Date_



-- with 구문
-- 서브쿼리를 재사용하는 방법 중 view 처럼 create, drop 등으로 코드를 생성하지 않고도 쓸 수 있는 방법
-- 다른 코드에서의 반복 사용성이 낮은 경우 view 보다 with 가 더 유용

-- NVIDIA라는 기업의 이름으로 주가 검색 가능 (with 이용)
with cte_price as 
(
select C.Name
, S.Date_
, S.close_
from companyinfo C
join StockPrice S
on C.ID = S.ID
)
select * from cte_price where Name = 'NVIDIA'
