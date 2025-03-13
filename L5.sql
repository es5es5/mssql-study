-- JOIN
-- 연결할 모든 테이블을 지정하고 서로 연결될 방식을 명시

use study
go

-- 주식가격과 기업의 정보 연결하기
select companyinfo.name
, StockPrice.Date_
, StockPrice.close_
from companyinfo
join StockPrice
on companyinfo.ID = StockPrice.ID

-- ALIAS 를 이용해 코드 간소화 하기
select c.Name
, S.Date_
, S.close_
from companyinfo C
join StockPrice S
on C.ID = S.ID


-- INNER JOIN
-- 일반적인 JOIN
-- 두 테이블에 모두 존재하는 행을 기준으로 결합

-- LEFT JOIN
-- 왼쪽 테이블의 모든 레코드를 일단 가져오고, 일치하는 오른쪽 레코드를 붙여줌
-- 오른쪽 테이블에 데이터가 없으면 null 로 채움

-- RIGHT JOIN
-- LEFT JOIN 과 같지만 오른쪽 테이블 기준

-- FULL OUTER JOIN
-- 양 쪽의 모든 레코드를 가져오고
-- 일치하지 않는 부분은 null 로 채움



-- 두 테이블을 left join 문에 IND_ID 열 기준으로 연결하기
-- 기업 테이블에 있는 산업 코드를 산업 테이블과 연결함
-- 산업 정보가 있으면 정보가 표시되지만 없으면 NULL
-- 어쨋든 있는 기업은 다 나열하고 싶으니 이 경우는 LEFT JOIN 적합

select C.Name
, C.IND_ID
, I.IND_Name
from companyinfo C
LEFT JOIN IndustryInfo I
ON C.IND_ID = I.IND_ID


-- FULL OUTER JOIN
-- 모든 조합을 일단 다 감안하는 방법
-- 두 테이블로 나올 수 있는 모든 경우의 수로 연결한 다음 조건을 찾아 나가는 형식
-- JOIN, LEFT JOIN,  RIGHT JOIN 의 결과를 모두 합친 결과
-- 아래 예제 경우는 기업 테이블이 산업 테이블을 모두 포함하기 때문에 LEFT JOIN 결과와 같음.
select C.Name
, C.IND_ID
, I.IND_Name
from companyinfo C
FULL OUTER JOIN IndustryInfo I
ON C.IND_ID = I.IND_ID


-- JOIN 을 중첩해서 사용할 수 있음
-- 특별히 달라지는게 없고 JOIN 을 연속해서 계속 사용하면 됨.

-- 기업 테이블과 기업설명 테이블(Descriptions)을 연결하기 위해 맵핑테이블(IDMap)과 JOIN 으로 중첩해서 연결하기
select C.Name
, C.IND_ID
, D.FIN_ID
, D.Description
from companyinfo C
JOIN IDMap I
ON C.ID = I.ID
JOIN Descriptions D
ON I.FIN_ID = D.FIN_ID
