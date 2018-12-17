create table tb_login_history(
idx number primary key,
mem_id varchar2(20) not null,
lastsuccessedlogin date not null
);

create sequence login_history_seq
start with 1
increment by 1;

create table tb_security(
mem_id varchar2(20) primary key,
salt varchar2(70) null);
alter table tb_login_history modify(mem_id varchar2(20));
delete from tb_login_history;