drop table attach_tbl;

create table attach_tbl(
uuid varchar(100) primary key,
uploadpath varchar(200),
fileName varchar(200),
fileType char,
bno int

);




alter table attach_tbl
add constraint fk_attach_board foreign key (bno)
references board_tbl(bno);

select *from attach_tbl;

select * from board_tbl;

select * from attach_tbl where uploadpath = date_format(date_add(now(), interval +0 day), '%Y\\%m\\%d') ;


select date_format(date_add(now(), interval-0 day), '%y-%m-%d') as 형식화;

delete from attach_tbl where bno = 426;