drop table member_auth;
drop table member_tbl;

-- 맴버 테이블 생성 --
create table member_tbl(
uno int primary key auto_increment,
userEmail varchar(50) not null,
userName varchar(50)not null,
userPw varchar(200) not null,
userPhone varchar(50) not null,
userAddr varchar(200) not null,
userAddrD varchar(200),
userBirth varchar(50) not null,
userGender enum('M', 'F') not null default 'M',
userStatus int not null default '0',
userPass int not null default '0',
regDate timestamp default current_timestamp,
updateDate timestamp default current_timestamp
);

select * from member_tbl;

select * from member_auth;

-- 자식 테이블에 권한 혹은 다른 데이터가 연동되어있으면 삭제 안됨
-- 수정은 상과없다.
delete from member_auth where userId = 'hong';
delete from member_tbl where userId = 'hong';


-- 멤바 권한 테이블 생성 --
create table member_auth(
	uno int not null,
    auth varchar(50) not null,
    constraint fk_member_auth
    foreign key(uno)
    references member_tbl(uno)
);

-- 프라이머리 키에 해당하는 컬럼에 권한을 주는것! 여기서는 uno에 줬고, 이를 베이스로 권한을 설정하면 된다!

select * from member_auth;
select * from member_tbl;

delete from member_tbl where uno = 4;


insert into member_tbl(userEmail, userName, userPw, userPhone, userAddr, userAddrD, userBirth, userGender)
values('test@dream.com', '테스타', '1234', '010-1111-1111', '봉곡동', '현대아파트', '1999-01-02', 'M' );

insert into member_tbl(userEmail, userName, userPw, userPhone, userAddr, userAddrD, userBirth, userGender)
values('hoon@dream.com', '옥승훈', '1234', '010-1111-1111', '봉곡동', '현대아파트', '1987-04-21', 'M' );

insert into member_tbl(userEmail, userName, userPw)
values('gil@dream.com', '길동이', '1234' );

insert into member_tbl(userEmail, userName, userPw, userPhone, userAddr, userAddrD, userBirth, userGender)
values('admin@dream.com', '관리자', '1234', '010-1111-1111', '봉곡동', '현대아파트', '1987-04-21', 'M' );

-- 맴버들별 권한 설정 --
insert into member_auth
values(3, 'ROLE_MEMBER');
insert into member_auth
values(1, 'ROLE_ADMIN');
insert into member_auth
values(1, 'ROLE_MANAGER');
insert into member_auth
values(2, 'ROLE_MEMBER');
insert into member_auth
values(2, 'ROLE_MANAGER');


-- 맴버테이블과 권한테이블 연결 설정(서로 테이블끼리 붙이는 것)--
select * from member_tbl M 
inner join member_auth A 
on M.userId = A.userId;

select * from member_tbl M 
inner join member_auth A 
on M.uno = A.uno;

select M.userName, A.auth from member_tbl M
inner join member_auth A
on M.userId = A.userId;

select M.userEmail, A.auth from member_tbl M
inner join member_auth A
on M.uno = A.uno;

-- 이것도 붙이는 거지만, 권한이 없는 항목의 권한테이블은 null 이 뜬다--
select * from member_tbl M 
left join member_auth A 
on M.userId = A.userId;

-- 다중 조인문
select * from member_tbl M
inner join board_tbl B
on M.userName = B.writer
inner join reply_tbl R
on M.userName = R.replyer;

-- 회원 승인
update member_tbl set userPass=1 , userStatus = 1 where uno = 3;

update member_auth set auth='ROLE_MEMBER' where uno = 3;