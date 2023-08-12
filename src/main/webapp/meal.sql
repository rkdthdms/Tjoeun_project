 CREATE TABLE "MEAL" 
   (	"IDX" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate NOT NULL ENABLE
   );
   
create sequence meal_idx_seq;

select * from meal;

insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '����ö', '����1', '����1');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '������', '����2', '����2');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '������', '����3', '����3');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '���Ͽ�', '����4', '����4');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '����ȿ', '����5', '����5');

commit;

delete from meal where idx = '73';
