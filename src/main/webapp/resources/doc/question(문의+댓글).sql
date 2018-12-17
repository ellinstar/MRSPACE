CREATE TABLE tb_question
(
    que_num        NUMBER(10)       NOT NULL, 
    que_title      VARCHAR2(20)     NOT NULL, 
    que_pw         VARCHAR2(100)    NOT NULL, 
    que_content    VARCHAR(1000)    NOT NULL, 
    que_views      NUMBER(10)       NULL, 
    que_date       DATE             NOT NULL, 
    mem_num        NUMBER(10)       NULL, 
    CONSTRAINT TB_QUESTION_PK PRIMARY KEY (que_num)
);
CREATE SEQUENCE tb_question_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE tb_question_reply
(
    que_rep_num        NUMBER(10)        NOT NULL, 
    que_rep_date       DATE              NOT NULL, 
    que_rep_content    VARCHAR2(1000)    NOT NULL, 
    que_num            NUMBER(10)        NOT NULL, 
    ad_num             NUMBER(10)        NOT NULL, 
    CONSTRAINT TB_QUESTION_REPLY_PK PRIMARY KEY (que_rep_num)
)
CREATE SEQUENCE tb_question_reply_SEQ
START WITH 1
INCREMENT BY 1;

COMMENT ON TABLE tb_question_reply IS '문의게시판 댓글'

COMMENT ON COLUMN tb_question_reply.que_rep_num IS '문의 댓글 번호'

COMMENT ON COLUMN tb_question_reply.que_rep_date IS '문의 댓글 작성일'

COMMENT ON COLUMN tb_question_reply.que_rep_content IS '댓글 내용'

COMMENT ON COLUMN tb_question_reply.que_num IS '문의 게시판 번호'

COMMENT ON COLUMN tb_question_reply.ad_num IS '관리자 번호'