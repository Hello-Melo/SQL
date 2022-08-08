
drop table board_tbl;
create table board_tbl(
bno int auto_increment primary key,
title varchar(300) not null,
contents text not null,
writer varchar(50) not null,
regDate timestamp default current_timestamp,
updateDate timestamp default current_timestamp

);
select * from board_tbl limit 0, 10;
select * from board_tbl;
insert into board_tbl(title, contents, writer) value('게시물 제목입니다', '배가 고프네', '옥승훈');
insert into board_tbl(title, contents, writer) value('게시물 제목입니다2', '배가 고프네2', '옥승훈2');
insert into board_tbl(title, contents, writer) value('게시물 제목입니다3', '배가 고프네3', '옥승훈3');
insert into board_tbl(title, contents, writer) value('게시물 제목입니다4', '배가 고프네4', '옥승훈4');

select count(*) from board_tbl;

--  검색 관련 sql문-- 
select *  from board_tbl where contents like '%자바%' or writer like '%11%'; 

-- 3번부터 398번까지 삭제 between and 로 삭제
delete from board_tbl where bno  between 420 and 426;

select *  from board_tbl where title like concat('%', '스프링', '%');

-- 조회수 관련
alter table board_tbl
add column viewCount int default 0;  ## board_tbl에 viewCount 컬럼츄가!

alter table member_tbl drop viewCount; ##테이블의 컬럼 삭제

select * from board_tbl;