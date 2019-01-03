--문의 게시판
CREATE TABLE TB_QNA ( 
    QNA_NUM    NUMBER NOT NULL , 
    QNA_NAME VARCHAR2(10) NOT NULL ,
    QNA_TITLE    VARCHAR2(1000) NOT NULL , 
    QNA_CONTENT CLOB,  
    QNA_PW VARCHAR2(18) NOT NULL , 
    QNA_DATE DATE DEFAULT SYSDATE ,
    
    CONSTRAINT TB_QNA_PK PRIMARY KEY(QNA_NUM)
); 

--자주 묻는 질문
CREATE TABLE TB_QNA2 ( 
    QNA_NUM    NUMBER NOT NULL , 
    QNA_NAME VARCHAR2(10) NOT NULL ,
    QNA_TITLE    VARCHAR2(1000) NOT NULL , 
    QNA_CONTENT CLOB,
    QNA_DATE DATE DEFAULT SYSDATE ,
    
    CONSTRAINT TB_QNA2_PK PRIMARY KEY(QNA_NUM)
); 

CREATE SEQUENCE TB_QNA_SEQ 
    START WITH 1 
    INCREMENT BY 1 
    NOCYCLE;
    
CREATE SEQUENCE TB_QNA2_SEQ 
    START WITH 1 
    INCREMENT BY 1 
    NOCYCLE;

--문의게시판 댓글
CREATE TABLE tb_qnarep
(
    rep_num        NUMBER(10)        NOT NULL, 
    rep_name       VARCHAR2(10)      default '관리자',
    rep_date       DATE              default sysdate, 
    rep_content    VARCHAR2(1000)    NOT NULL, 
    qna_num        NUMBER(10)        NOT NULL, 
 
    CONSTRAINT tb_qnarep_PK PRIMARY KEY (rep_num),
    CONSTRAINT tb_qnarep_FK FOREIGN KEY(QNA_NUM) REFERENCES TB_QNA(QNA_NUM)
);

CREATE SEQUENCE tb_qnarep_SEQ
START WITH 1
INCREMENT BY 1;


--자주 묻는 질문 고정값
insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','예약은 월 단위인가요?','그렇습니다. 당사의 유동적인 월 단위 약정은 비즈니스 성장에 필요한 유연성과 함께 오피스의 안정을 선사합니다.',sysdate);

insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','우편 및 소포 처리를 추가할 수 있나요?','우편물 서비스는 전용 데스크 및 프라이빗 오피스 플랜에 포함됩니다. 대부분 빌딩에서 이러한 서비스를 주문식으로 제공됩니다. 자세한 내용은 원하는 지점의 현지 커뮤니티 팀에 문의하세요.',sysdate);

insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','키우는 개를 데리고 와도 되나요? 애완동물 정책은 어떻게 되나요?','당사의 애완동물 정책은 업체마다 다릅니다. 투어할 때 해당 업체 커뮤니티 매니저에게 가장 최신 정보를 문의하시기 바랍니다.',sysdate);

insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','빌딩 운영 시간은 어떻게 됩니까? 개장 시간은 언제입니까?','일반적으로 모든 지점의 업체 직원은 현지 시간으로 월~금, 오전 9시~오후 6시에 각 지점에서 근무합니다. 핫 데스크, 전용 데스크 또는 프라이빗 오피스 멤버의 경우 연중무휴 키 카드 액세스가 제공됩니다.',sysdate);

insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','더 많은 공간과 데스크가 필요한 경우에는 어떻게 해야 하나요?','월 단위로 유연하게 지급되는 혜택 중 하나는 멤버는 언제라도 공간을 추가할 수 있다는 점입니다. 멤버들은 공간을 추가하시려면 커뮤니티 팀으로 방문하여 사용 가능 여부를 문의하시기 바랍니다. ',sysdate);

insert into tb_qna2 (qna_num, qna_name, qna_title, qna_content, qna_date) values 
(tb_qna2_seq.nextval,'관리자','RentSpace는 멤버들에게 전화나 이메일로 개인 정보나 재무 정보를 요청하나요?','멤버들이 피싱 캠페인 및 잠재적 개인 정보 유출의 피해자가 되는 것을 막기 위해, RentSpace는 전화나 이메일을 통해 멤버의 개인 정보 또는 금융 정보를 묻지 않습니다. 피싱이란 일종의 소셜 엔지니어링 공격으로 이메일이나 전화로 신뢰할 수 있는 기관으로 속여 민감한 정보를 얻고자 시도하는 것입니다.
멤버들이 이러한 사기에 노출되는 것을 막고자 하는 일환으로, 가짜 이메일 또는 통화를 식별하는 방법을 목록으로 만들었습니다.
• 피싱 이메일은 문법적 오류, 오타 또는 구두법 오류를 포함할 수 있습니다. RentSpace의 외부 통신은 멤버들에게 전달되기 전에 엄격한 품질 확인 프로토콜을 거칩니다. 그러므로 문법적 오류, 오타 또는 구두법 오류가 있는 경우 승인된 RentSpace 이메일일 가능성이 매우 낮습니다. 
• 피싱 이메일 또는 전화 통화는 개인 정보 또는 금융 정보의 급한 요청을 포함할 수 있습니다. RentSpace는 어떠한 일이 있어도 멤버들에게 이메일이나 전화 통화로 주민등록번호, 암호 또는 신용 카드 번호 제공을 요청하지 않습니다. 
• 피싱 이메일은 멤버들에게 첨부된 링크 클릭을 요청할 수 있습니다. 사전 예방 조치의 일환으로 멤버들은 클릭하기 전 표시된 링크 위로 마우스를 가져가서 실제 웹 주소가 나타나게 해야 합니다. 

피싱 또는 사기성 이메일이나 전화 통화를 받았다고 의심되는 경우, 지원 요청을 제출하여 주십시오.',sysdate);

commit;