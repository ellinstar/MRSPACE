--찜 목록
create table tb_like(
like_num number(10) , 
like_date date default sysdate, 
like_amount number(10) null,
mem_id varchar2(20) null , 
sp_num number(10) null ,
sp_name varchar2(20) null,
CONSTRAINT tb_like_pk PRIMARY KEY (like_num)
);

--찜 목록 시퀀스
CREATE SEQUENCE tb_like_SEQ 
START WITH 1
INCREMENT BY 1;