-- 날짜 함수

-- 현재를 반환
print getdate()

-- 년도를 반환
print year(getdate())

-- 월를 반환
print month(getdate())

-- 날짜를 반환
print day(getdate())

-- 두 날짜 간의 차이를 반환
print datediff(day, getdate(), '2012-02-25')

-- 날짜를 더함
print dateadd(month, 3, getdate())
