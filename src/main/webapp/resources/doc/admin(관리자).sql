CREATE TABLE tb_admin
(
    ad_num    NUMBER(10)       NOT NULL, 
    ad_id     VARCHAR2(20)     NOT NULL, 
    ad_pw     VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_ADMIN_PK PRIMARY KEY (ad_num)
);
CREATE SEQUENCE tb_admin_SEQ
START WITH 1
INCREMENT BY 1;
COMMENT ON TABLE tb_admin IS '관리자';

COMMENT ON COLUMN tb_admin.ad_num IS '관리자 번호';

COMMENT ON COLUMN tb_admin.ad_id IS '아이디';

COMMENT ON COLUMN tb_admin.ad_pw IS '비밀번호';
