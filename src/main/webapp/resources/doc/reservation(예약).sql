--예약 테이블
create table tb_reserv(
res_num number(10) , -- 예약 번호
res_date date default sysdate, -- 예약한 날자
res_usedate date not null, -- 예약달
res_amount number(10) not null, --예약 금액
res_state number(2), --예약 상태 (0 기본 , 1 예약신청 , 2예약 취소 ,3예약통과)
mem_id varchar2(20) not null , --멤버 아이디 
sp_num number(10) not null , --공간 번호
CONSTRAINT bt_reserv_pk PRIMARY KEY (res_num)
);
--예약 시퀀스
CREATE SEQUENCE tb_reserv_SEQ 
START WITH 1
INCREMENT BY 1;