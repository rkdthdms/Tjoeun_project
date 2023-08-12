 CREATE TABLE "MEAL" 
   (	"IDX" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate NOT NULL ENABLE
   );
   
create sequence meal_idx_seq;

select * from meal;

insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '김형철', '제목1', '내용1');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '강소은', '제목2', '내용2');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '김유진', '제목3', '내용3');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '이하영', '제목4', '내용4');
insert into meal ( idx, name, subject, content ) values (meal_idx_seq.nextval, '박지효', '제목5', '내용5');

commit;

delete from meal where idx = '73';
