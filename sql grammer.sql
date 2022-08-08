# 주석 되남?
-- 주석주석

select * from usertbl;

-- 1970년 이후 출생 + 신장이 182이상

select userId, name from usertbl
where birthYwar >= 1970
and height >= 182;

-- 1970년 이후 출생이거나 신장이 182이상 아이디 이름 조회
select userId, name from usertbl
where birthYwar >= 1970
or height >= 182;

-- 키 180이상, 183이하 사람 이름, 키 조회
select name, height from usertbl
where height > 180 and height <=183;

select name, height from usertbl
where height between 180 and 183;

-- 지역이 전남, 경남, 전북인 사람의 이름과 주소
select name, addr from usertbl
where addr = '경남' or addr = '전북' or addr= '전남';

select name, addr from usertbl
where addr in('경남', '전남', '전북');

-- 성이 김씨인 사람의 이름 조회
select name from usertbl
where name like '김%';

-- 이름이 종신인 사람의 이름 조회
select name from usertbl
where name like '_종신';

-- 키가 177초과 인 사람의 이름 과 키 조회
select name, height from usertbl
where height > 177;

-- 김경호보다 키가 큰 사람의 이름과 키 조회
select height from usertbl where name ='김경호';

select name, height from usertbl
 where 
 height > (select hetight from usertbl where name='김경호');
 
 -- 지역이 '경남' 사람의 키보다 크거나 같음
 select height from usertbl where addr='경남';
 
 select name, height from usertbl
 where
 height >= any (select height from usertbl where addr='경남');
 # 170 그리고 173 모두를 만족 any = some
 
 -- 가입날짜로 내림차순 정렬 후 조회
 select * from usertbl order by mDate desc;
 
 -- 키가 큰 순서로 내림차순하되 키가 작다면 오름차순 이름순 정렬
  select * from usertbl order by height desc, name asc;
  
  
  -- 회원들의 거주 지역 중복없이 조회
  select distinct addr from usertbl;
  
 
 --  테이블 복사 
create table buytbl2(
		select * from buytbl
);
 
 -- buytbl에서 userId, prodName 열을 가지는 테이블 복사
 create table buytbl3(
		select userId, prodname from buytbl
 
 );
 select  * from buytbl2;
 
 
 --
 select userId, sum(amount) from buytbl
 group by userId;
 
 -- 판매된 제품의 수량
  select prodName, sum(amount) from buytbl
 group by prodName;
 
 -- 평균 계산하기 + 항목 명 작성(as)
 select avg(amount) as '평균 구매 갯수' from buytbl;
 
 -- 최소 최대값
 select min(height) from usertbl;
 select max(height) from usertbl;
 
 -- 키가 가장 큰 사람 or 작은 사람의 이름과 키 출력
 select name, height from usertbl
 where height = (select max(height) from usertbl)
 or height = (select min(height) from usertbl);
 
 
 select name, height from usertbl
 where height in((select min(height) from usertbl),
  (select max(height) from usertbl));
  
  
  
  -- 각 인원별 구매 총액 계산
  select userId, sum(price *amount) from buytbl
group by userId 
having sum(price*amount) > 1000;
 
 
 