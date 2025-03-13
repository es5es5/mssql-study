-- 1. 순위함수
-- ROW_NUMBER()
-- 중복 순위를 무시함
-- 동일한 값이 있어도 일단 순위를 매김
-- RANK()
-- 중복 순위 적용함
-- 동일한 값이 있는 경우 동일한 순위 부여 (공동 2등 있으면, 다음 등수는 4등 됨)
-- DENSE_RANK()
-- (공동 2등 있으면, 다음 등수는 3등 됨)

use study
go

select * from companyinfo


-- employee 기준으로 순위매기기
select name
, employees
, DENSE_RANK() over (order by employees DESC) as 순위
from companyInfo
order by 순위



-- 2. 이동함수
-- lag
-- 이전 행의 값을 가져올 때
-- lead
-- 다음 행의 값을 가져올 때


-- ID 40853인 삼성전자의 종가, 어제종가, 내일종가를 한꺼번에 보여주기
select date_
, close_ as 종가
, lag(close_, 1) over (order by date_) as 어제종가
, lead(close_, 1) over (order by date_) as 내일종가
from StockPrice
where ID = 40853
order by Date_


-- lag, lead 함수를 이용해 ID 40853인 삼성전자의 오늘 수익률과 내일 수익률 구하기
select date_
, close_ as 종가
, close_/lag(close_, 1) over (order by date_) -1 as 오늘수익률
, lead(close_, 1) over (order by date_) / close_ -1 as 내일수익률
from StockPrice
where ID = 40853
order by Date_


-- partition by
-- group by 와 동일하게 어떤 그룹에 적용하는 함수
-- 그룹을 나누어서 해당 레코드의 순위를 살펴보거나 이동함수 등을 적용할 때 사용


-- 국가별로 고용인의 순위가 높은 순서에서 낮은 순서로 기업에 순위를 매긴다.
SELECT name
, IncInCtryCode
, RANK() over (partition by IncInCtryCode ORDER BY Employees DESC) as 순위
from companyinfo
where IncInCtryCode is not NULL
order by 순위

-- 오늘 수익률을 각 기업별로 적용해 계산한다.
select date_
, ID
, close_/LAG(close_, 1) over (partition by ID order by date_) -1.0 as 수익률
from StockPrice

-- 주식 가격의 이동평균을 구한다.
select date_
, ID
, close_
, AVG(close_)
over (partition by ID
order by date_ ROWS BETWEEN 2 PRECEDING and 0 PRECEDING) as SMA3
from StockPrice
