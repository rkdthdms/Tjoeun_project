    CREATE TABLE "MAIN" (	
    "CNUM" NUMBER(*,0) NOT NULL, 
    "NAME" VARCHAR2(20) NOT NULL, 
    "EMAIL" VARCHAR2(100) NOT NULL, 
    "PHONE" VARCHAR2(20) NOT NULL, 
    "BIRTHDAY" VARCHAR2(6) NOT NULL, 
    "PASSWORD" VARCHAR2(20) NOT NULL
);

DELETE FROM main;
DROP SEQUENCE main_seq;
CREATE SEQUENCE main_seq;

SELECT * FROM main ORDER BY cnum DESC;
SELECT COUNT(*) FROM main;

INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (110, '강소은', 'a@a', '010-2906-0775', '000106', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (111, '김형철', 'b@a', '010-8928-9488', '000303', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (112, '이하영', 'c@a', '010-2468-3151', '990608', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (113, '김유진', 'd@a', '010-5044-1868', '901007', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (114, '고대일', 'e@a', '010-1234-4561', '950504', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (115, '박상아', 'f@a', '010-1234-4562', '980410', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (116, '남수연', 'g@a', '010-1234-4563', '961117', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (117, '장현규', 'h@a', '010-1234-4564', '971019', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (118, '이소민', 'i@a', '010-1234-4565', '980408', '1234');
INSERT INTO main (cnum, name, email, phone, birthday, password) 
VALUES (220, '유종우', 'j@a', '010-1234-4566', '800714', '1234');

COMMIT;
    
