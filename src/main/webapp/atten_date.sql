CREATE TABLE "ATTEN_DATE" (	
    "CNUM" NUMBER(*,0) NOT NULL, 
    "WORKTIME" TIMESTAMP (6) DEFAULT sysdate NOT NULL, 
    "HOMETIME" TIMESTAMP (6), 
    CONSTRAINT "ATTEN_DATE_PK" PRIMARY KEY ("WORKTIME")
);


DELETE FROM atten_date;
DROP SEQUENCE atten_date_seq;
CREATE SEQUENCE atten_date_seq;

SELECT * FROM atten_date;
SELECT COUNT(*) FROM atten_date;

INSERT INTO atten_date (cnum) VALUES (110);
INSERT INTO atten_date (cnum) VALUES (111);
INSERT INTO atten_date (cnum) VALUES (112);
INSERT INTO atten_date (cnum) VALUES (113);
INSERT INTO atten_date (cnum) VALUES (114);
INSERT INTO atten_date (cnum) VALUES (115);
INSERT INTO atten_date (cnum) VALUES (116);
INSERT INTO atten_date (cnum) VALUES (117);
INSERT INTO atten_date (cnum) VALUES (118);
INSERT INTO atten_date (cnum) VALUES (220);

SELECT to_char(worktime, 'YYYY-MM-DD HH24:MI:SS') FROM atten_date 
WHERE cnum = 110 AND to_char(worktime, 'YYYY-MM-DD') = '2023-07-07';
SELECT to_char(hometime, 'YYYY-MM-DD HH24:MI:SS') FROM atten_date 
WHERE cnum = 110 AND to_char(hometime, 'YYYY-MM-DD') = '2023-07-07';

COMMIT;