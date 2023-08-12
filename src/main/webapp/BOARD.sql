CREATE TABLE "BOARD" (
    "IDX" NUMBER(*,0) NOT NULL, 
    "CNUM" NUMBER(*,0), 
    "NAME" VARCHAR2(20), 
    "SUBJECT" VARCHAR2(60) NOT NULL, 
    "CONTENT" VARCHAR2(3000) NOT NULL, 
    "WRITEDATE" TIMESTAMP (6) DEFAULT sysdate
);

DELETE FROM BOARD;
DROP SEQUENCE BOARD_idx_seq;
CREATE SEQUENCE BOARD_idx_seq;

SELECT * FROM BOARD ORDER BY idx DESC;
SELECT COUNT(*) FROM BOARD;

INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '작업1', '치킨1');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '작업2', '치킨2');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '작업3', '치킨3');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '작업4', '치킨4');

INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '장현규 사원 퇴사 기념 송별회', '안녕ㅇ은 영원한,,, 헤어짐은 아니갯지요 ,,,');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '외부 초청 강의 관련 공지', '하버드대학교에서 강연하러 우리 회사에 오신답니다~!');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '여름휴가 안내', '알아서들 쉬세요 ~ ');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '더조은 그룹 2023 하반기 인사발령', '안녕은 영원한 ,, ,헤어짐은 아니겠지요 ,,,');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '영어 교육비 지원제도 안내', '영어 공부 좀 하세요.');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '한시적 업무시간 조정 안내', '9시 출근 6시 퇴근에서 8시 출근 5시 퇴근으로 업무시간 조정 합니다.');
INSERT INTO BOARD (idx, subject, content) 
VALUES (BOARD_idx_seq.nextval, '7월 15일 토요일 사내 전체 등산', '한명도 빠짐 없이 모이기 바랍니다.');

COMMIT;