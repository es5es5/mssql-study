-- 형식 변환 함수

-- cast
-- 문자열을 숫자로 바꿈, 기본적인 형 변환 작업 수행 ex) 10 19 2020 4:41PM -> 20201019

-- convert
-- 사용자가 원하는 형태의 데이터로 변환 ex) 234번지 -> "234" + "번지"

-- 이렇게 하면 에러임
print 2020+'년'

-- 숫자 2020과 '년'을 결합하는 코드 만들기
-- 문자 앞에 N을 붙이는 이유
-- 유니코드임을 알려주기 위함
-- N 생략시 SSMS 는 문자열을 인식하지 못해 2020???를 반환
print cast(2020 as varchar) + N'년'
print convert(varchar, 2020) + N'년'

-- 날짜를 문자열로 변환하는 코드 만들기
print cast(getdate() as varchar)
print convert(varchar(8), getdate(), 112)
