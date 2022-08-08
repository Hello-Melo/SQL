drop table reply_tbl;

create table reply_tbl(
 rno int primary key auto_increment,
 bno int not null,
 reply varchar(1000),
 replyer varchar(60),
 regDate timestamp default current_timestamp,
updateDate timestamp default current_timestamp
 
);
select * from board_tbl;
select * from reply_tbl;
alter table reply_tbl
 add foreign key(bno)
 references board_tbl(bno);

select * from reply_tbl;
select * from board_tbl;

insert into reply_tbl(bno, reply, replyer)
values('1', '댓글 내용++', '작성자++');

alter table board_tbl add column replyCnt int null default 0;

update board_tbl
set replyCnt = (select count(rno) from reply_tbl where board_tbl.bno = reply_tbl.bno);
 
