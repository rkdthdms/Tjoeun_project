CREATE TABLE "MEETINGROOM" (	
    "ROOM_ID" NUMBER,
    "USER_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
    "STATUS" VARCHAR2(20 BYTE), 
    "MEETINGDATE" VARCHAR2(100 BYTE), 
    "MEETINGTIME" VARCHAR2(100 BYTE) 
);

DELETE FROM meetingroom;
DROP SEQUENCE meetingroom_seq;
CREATE SEQUENCE meetingroom_seq;

SELECT * FROM meetingroom;
SELECT COUNT(*) FROM meetingroom;
SELECT * FROM meetingroom ORDER BY room_id DESC;
SELECT * FROM meetingroom ORDER BY MEETINGDATE DESC;

INSERT INTO MeetingRoom (room_id, user_name, meetingDate, meetingTime)
VALUES (111, '111', '111', '111');

COMMIT;