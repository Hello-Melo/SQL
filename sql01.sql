create database member_db;


#테이블 생성(자바랑은 반대로 변수 서넌. 변수명 + int)
create table member_tbl(
	id int primary key auto_increment,
    userName varchar(50),
    email varchar(200),
    `password` varchar(300),
    regDate timestamp default current_timestamp,
	updateDate timestamp default current_timestamp
);

#테이블 출력
show tables;

#테이블 세부 조회
desc member_tbl;

#테이블 삭제법 
drop table member_tbl;

#테이블 컬럼(열)추가
alter table member_tbl add phone varchar(100);

#테이블 컬럼(열) 수정
alter table member_tbl change phone phoneNumber varchar(50);

#테이블 컬럼(열) 삭제
alter table member_tbl drop phoneNumber;

#테이블 이름 변경
rename table member_tbl to member_Table;
rename table member_table to member_tbl;

#테이블 조회
select * from member_tbl;
select username, email from member_tbl;
select * from member_tbl where userName = "둘리둘리";
select * from member_tbl where userName = "둘리둘리" and `password`="4885" ;
select * from member_tbl where userName = "둘리둘리" or `password`="4885" ;
select * from member_tbl where email = "killtolove31@nate.com";

#table safe 모드 제거
set sql_safe_updates=0;

#데이터 삽입
insert into member_tbl values(1, "둘리둘리", "ock87@nate.com", "1234");
insert into member_tbl values(2, "또치또치", "DDoch@nate.com", "4885");
insert into member_tbl values(3, "도우나", "douna@nate.com", "1234");
insert into member_tbl values(4, "희동이", "geedong@nate.com", "1234");
insert into member_tbl values(5, "둘리둘리", "doolee@naver.com", "4885");

insert into member_tbl(username, email, `password`) value("둘리둘리", "ock87@nate.com", "1234"),
																			("또치또치", "DDoch@nate.com", "4885"),
																			("도우나", "douna@nate.com", "4312"),
																			("희동이", "geedong@nate.com", "4312"),
																			("길동Go", "GildongGo@nate.com", "4885"),
																			("둘리둘리", "killtolove31@nate.com", "4312");


#데이터 삭제 
delete from member_tbl where id=7;
delete from member_tbl where userName="도우나";
#insert into member_tbl(username, email) values("또치또치", "kkanttabbiya@nate.com");

#데이터 수정
update member_tbl set email='hong@hatmail.net' where id = 4;

select 'fff' from board_tbl;

