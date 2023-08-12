CREATE TABLE "ELECAPPR" (	
    "IDX" NUMBER(*,0) NOT NULL, 
    "CNUM" NUMBER(*,0) DEFAULT 0, 
    "NAME" VARCHAR2(20), 
    "SUBJECT" VARCHAR2(1000) NOT NULL, 
    "CONTENT" VARCHAR2(3000) NOT NULL, 
    "WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
    "STATUS" VARCHAR2(20), 
    "REASON" VARCHAR2(1000), 
    "PAPER" VARCHAR2(60),
     CONSTRAINT "ELECAPPR_PK" PRIMARY KEY ("IDX")
);

DELETE FROM elecappr;
DROP SEQUENCE elecappr_idx_seq;
CREATE SEQUENCE elecappr_idx_seq;

SELECT * FROM elecappr ORDER BY idx DESC;
SELECT COUNT(*) FROM elecappr;
select * from elecappr where cnum = 110 order by idx desc;

alter sequence elecappr_idx_seq increment by -1;
select elecappr_idx_seq.nextval from elecappr;
select elecappr_idx_seq.nextval from elecappr where idx = 5;
alter sequence elecappr_idx_seq increment by 1;

SELECT * FROM USER_SEQUENCES;

Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,110,'������','����� ���� ������Ǽ�','����� ���� ������Ǽ�',to_timestamp('23/06/14 16:39:38.000000000','RR/MM/DD HH24:MI:SSXFF'),'����',null,'������Ǽ�');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,111,'����ö','GWD-3120 ������ ���� ���ȼ�','GWD-3120 ������ ���� ���ȼ�',to_timestamp('23/07/03 16:41:06.000000000','RR/MM/DD HH24:MI:SSXFF'),'�ݷ�','��� �����','�ް����¼�');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,112,'���Ͽ�','�ӿ� ���� ����','�ӿ� ���� ����',to_timestamp('23/07/05 16:42:10.000000000','RR/MM/DD HH24:MI:SSXFF'),'����',null,'����');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,113,'������','07.24~07.25 �ް���û��','07.24~07.25 �ް���û��',to_timestamp('23/07/06 16:42:52.000000000','RR/MM/DD HH24:MI:SSXFF'),'����',null,'�ް����¼�');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,114,'�����','���� ��û ����','���� ��û ����',to_timestamp('23/07/08 16:43:08.000000000','RR/MM/DD HH24:MI:SSXFF'),'�ݷ�','�������� ����� ����','���ȼ�');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,115,'�ڻ��','07.24~07.29 �ް���û�մϴ�.','07.24~07.29 �ް���û�մϴ�.',to_timestamp('23/07/09 16:44:08.000000000','RR/MM/DD HH24:MI:SSXFF'),'�ݷ�',null,'�ް����¼�');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,116,'������','�系 ���� �ǰ����� ����','�系 ���� �ǰ����� ����',to_timestamp('23/07/09 16:44:31.000000000','RR/MM/DD HH24:MI:SSXFF'),'����',null,'����');
Insert into ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,WRITEDATE,STATUS,REASON,PAPER) values (elecappr_idx_seq.nextval,117,'������','������ ��� ������','�ȳ��ϼ���.�ڵ� 5�� �������Դϴ�.
���ŵ����ߴ� �츮 ������ �ڷ� �ΰ� ����ϴ� ���� ������ �ɸ��ϴ�.
''���񳫶�'' �� ��ü���� ��Ȱ�̾����ϴ�.
�������� �������� �������� ����� ���ñ� �ٶ��ϴ�.

�����մϴ�
������ ���',to_timestamp('23/07/10 16:44:47.000000000','RR/MM/DD HH24:MI:SSXFF'),'�ݷ�',null,'������');

INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','111','111','������Ǽ�');
INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','222','222','������Ǽ�');
INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','333','333','������Ǽ�');
INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','444','444','������Ǽ�');
INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','555','555','������Ǽ�');
INSERT INTO ELECAPPR (IDX,CNUM,NAME,SUBJECT,CONTENT,PAPER) 
VALUES (elecappr_idx_seq.nextval,110,'������','666','666','������Ǽ�');

select count(*) from elecappr where paper = '������Ǽ�';
SELECT * FROM elecappr where cnum = 110 and paper = '������Ǽ�' ORDER BY idx DESC;

COMMIT;
