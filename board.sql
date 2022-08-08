create database board;

drop table board_tbl;
create table board_tbl(
bno int auto_increment primary key,
title varchar(300) not null,
contents text not null,
writer varchar(50) not null,
regDate timestamp default current_timestamp,
updateDate timestamp default current_timestamp,
category varchar(50) not null

);


select * from board_tbl;

insert into board_tbl(title, contents, writer) value('게시물 제목입니다', '배가 고프네', '옥승훈');
insert into board_tbl(title, contents, writer ) value('게시물 제목입니다2', '배가 고프네2', '옥승훈2');
insert into board_tbl(title, contents, writer) value('게시물 제목입니다3', '배가 고프네3', '옥승훈3');
insert into board_tbl(title, contents, writer) value('게시물 제목입니다4', '배가 고프네4', '옥승훈4');


insert into board_tbl(title, contents, writer, category) value('게시물 제목입니다', '배가 고프네', '옥승훈' , 'free');
insert into board_tbl(title, contents, writer, category) value('게시물 제목입니다2', '배가 고프네2', '옥승훈2', 'notice');
insert into board_tbl(title, contents, writer, category) value('게시물 제목입니다3', '배가 고프네3', '옥승훈3', 'baba');
insert into board_tbl(title, contents, writer, category) value('게시물 제목입니다4', '배가 고프네4', '옥승훈4', 'baba');

select count(*) from board_tbl;

select count(*) from board_tbl where category = 'free';

set sql_safe_updates=0;

update board_tbl set title='수정했따' where bno = 412;

delete from board_tbl where bno = 4;
