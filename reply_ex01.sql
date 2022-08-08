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
# 댓글 테이블을 게시글 테이블의 번호와 연결!
alter table reply_tbl
 add foreign key(bno)
 references board_tbl(bno);
 
 -- 1번 글에 댓글 추가
 insert into reply_tbl(bno, reply, replyer)
values('1', '댓글 내용++', '작성자++');

# 테이블에 댓글 개수 컬럼 추가
alter table board_tbl add column replyCnt int null default 0;

-- 만약 이미 댓글이 달린 글이 있따면 추가해주는 코드
update board_tbl
set replyCnt = (select count(rno) from reply_tbl where board_tbl.bno = reply_tbl.bno);