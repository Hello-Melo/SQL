
-- 테이블 생성 명령어 --
create table users(
	username varchar(50) not null primary key,
    password varchar(200) not null,
    enable char(1) default '1'

);

insert into users(username, password) values('okseungHoon', '1234');
insert into users(username, password) values('Hoon', '1234');
insert into users(username, password) values('admin', '1234');

-- 권한 주는 설정 --
create table authorities(
	username varchar(50) not null,
    authority varchar(20) not null,
    constraint fk_authorities_user
    foreign key(username) references users(username)

);

insert into authorities values('okseungHoon', 'ROLE_USER');
insert into authorities values('Hoon', 'ROLE_MANAGER');
insert into authorities values('admin', 'ROLE_ADMIN');


select * from users;
select * from authorities;

 -- 테이블 합치는 연습. 컬럼 선택해서 연결 가능하고 필터도 가능 
select u.username, u.enabled, a.authority from users as  u 
inner join authorities as a
on u.username = a.username;

# 컬림이름 변경
# alter table 테이블 명 change 기존 컬럼명 변경컬럼  컬럼타입
alter table users change enbaled enabled char(1) default '1';

create table persistent_logins(
	series varchar(64) not null primary key,
    username varchar (64) not null,
    token varchar(64) not null,
    last_used timestamp default current_timestamp
     );
     
select * from persistent_logins;

drop table persistent_logins;