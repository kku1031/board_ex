drop table if exists board_tbl;

create table board_tbl(
	bno int auto_increment primary key,
    title varchar(300) not null,
    contents text not null, 
    writer varchar(50) not null,
    regDate timestamp default current_timestamp,
	updateDate timestamp default current_timestamp
);

select*from board_tbl;

insert into board_tbl(title, contents, writer)
values ('게시물 제목입니다.1','배가 고픕니다.1','강경구1');
insert into board_tbl(title, contents, writer)
values ('게시물 제목입니다.2','배가 고픕니다.2','강경구2');
insert into board_tbl(title, contents, writer)
values ('게시물 제목입니다.3','배가 고픕니다.3','강경구3');
insert into board_tbl(title, contents, writer)
values ('게시물 제목입니다.4','배가 고픕니다.4','강경구4');