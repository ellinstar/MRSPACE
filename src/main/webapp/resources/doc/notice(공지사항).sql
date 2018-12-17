CREATE TABLE tb_notice
(
    nt_num        NUMBER(10)        NOT NULL, 
    ad_num        NUMBER(10)        NOT NULL, 
    nt_title      VARCHAR2(100)      NOT NULL, 
    nt_content    VARCHAR2(1000)    NOT NULL, 
    nt_file       VARCHAR2(50) NULL, 
    nt_views      NUMBER(20)   NULL, 
    nt_date       DATE   default sysdate  NOT NULL, 
    CONSTRAINT TB_NOTICE_PK PRIMARY KEY (nt_num)
);

CREATE SEQUENCE tb_notice_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE tb_notice IS '공지사항 게시판'

COMMENT ON COLUMN tb_notice.nt_num IS '공지사항 번호'

COMMENT ON COLUMN tb_notice.ad_num IS '관리자 번호'

COMMENT ON COLUMN tb_notice.nt_title IS '공지사항 제목'

COMMENT ON COLUMN tb_notice.nt_content IS '공지사항 내용'

COMMENT ON COLUMN tb_notice.nt_file IS '공지사항 첨부파일'

COMMENT ON COLUMN tb_notice.nt_views IS '공지사항 조회수'

COMMENT ON COLUMN tb_notice.nt_date IS '공지사항 작성일'