CREATE TABLE TB_MEM
(
    mem_num        NUMBER(10)       NOT NULL, 
    mem_id         VARCHAR2(20)     NOT NULL unique, 
    mem_pw         VARCHAR2(100)    NOT NULL, 
    mem_name       VARCHAR2(10)     NOT NULL, 
    mem_birth      VARCHAR2(8)      NOT NULL, 
    mem_phone      VARCHAR2(20)     NOT NULL, 
    mem_email      VARCHAR2(50)     NOT NULL, 
    mem_job        VARCHAR2(100)    NOT NULL, 
    mem_date       DATE             DEFAULT sysdate NOT NULL, 
    mem_use        NUMBER(2)        DEFAULT 0 NOT NULL,          
    mem_state      NUMBER(2)        DEFAULT 0 NOT NULL, 
    CONSTRAINT TB_MEM_PK PRIMARY KEY (mem_num)
);

CREATE SEQUENCE TB_MEM_SEQ
START WITH 1
INCREMENT BY 1;