/*
예약테이블용
SELECT RESERVATION_TIME, COUNT(*) as RESERVATION_COUNT
FROM reservation
WHERE CLASS_NO = 'C000017' AND RESERVATION_DATE = '2023-08-02' AND RESERVATION_TIME = '14:00'
GROUP BY RESERVATION_TIME;



SELECT reservation_time, COUNT(*) as reservation_count 
FROM reservation
WHERE class_no = 'C000017' 
AND reservation_date = '2023-08-02'
GROUP BY reservation_time;



UPDATE reservation 
SET reservation_count = reservation_count + 1 
WHERE class_no = 'C000017'
AND reservation_date = '2023-08-02' 
AND reservation_time = '08:00'
AND reservation_count < reservation_maxcount;


UPDATE reservation 
SET reservation_count = CASE WHEN reservation_count > 0 THEN reservation_count - 1 ELSE 0 END 
WHERE class_no = 'C000017'
AND reservation_date = '2023-08-02' 
AND reservation_time = '08:00'
AND reservation_count > 0;

SELECT reservation_time, SUM(reservation_count) as reservation_count 
FROM reservation
WHERE class_no = 'C000017' 
AND reservation_date = '2023-08-02'
GROUP BY reservation_time;

SELECT reservation_time, SUM(reservation_count) as reservation_count FROM reservation WHERE 
class_no = 'C000017' AND reservation_date = '2023-08-02' GROUP BY reservation_time;

SELECT class_time FROM class WHERE class_no = 'C000017';

*/


/*
-- 테이블 삭제
drop table exercise;
drop table review;
drop table reservation;
drop table scrap;
drop table class;
drop table member;
drop table location;
drop table my_table;
drop table ATTACH;
drop table message;
-- 시퀀스 삭제
DROP SEQUENCE seq_member;
DROP SEQUENCE seq_EXERCISE;
DROP SEQUENCE seq_CLASS;
DROP SEQUENCE seq_reservation;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_scrap;
DROP SEQUENCE SEQ_LOCATION;
*/
  -- 시퀀스 생성
  CREATE SEQUENCE SEQ_MESSAGE;
  
  
  CREATE SEQUENCE seq_location
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
  CREATE SEQUENCE seq_member
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
   CREATE SEQUENCE seq_exercise
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
   CREATE SEQUENCE seq_class
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
  CREATE SEQUENCE seq_review
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
  CREATE SEQUENCE seq_reservation
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;
  
  CREATE SEQUENCE seq_scrap
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 99999
  NOCACHE
  NOCYCLE;

--member 테이블 생성
create table member(		
	member_no	varchar2(20) primary key
	, member_id	VARCHAR2(50)	NOT NULL		
	, member_pw	VARCHAR2(200)	NOT NULL		
    , member_name	VARCHAR2(20)	NOT NULL
	, eMail	VARCHAR2(50)	NOT NULL
	, nickName	VARCHAR2(20)	NOT NULL		
	, teacherYN	CHAR(1) DEFAULT 'N' CHECK (teacherYN IN('Y','N'))	
	, adminYN	CHAR(1) DEFAULT 'N' CHECK (adminYN IN('Y','N'))	
	, phoneNumber	VARCHAR2(20)	NOT NULL
);

CREATE TABLE message (
    MESSAGE_NO varchar2(20) PRIMARY KEY,
    MESSAGE_TITLE VARCHAR2(100),
    MESSAGE_CONTENT VARCHAR2(2000),
    SEND_NICK VARCHAR2(20) NOT NULL,
    RECV_NICK VARCHAR2(20) NOT NULL,
    SEND_TIME DATE DEFAULT SYSDATE NOT NULL,
    READYN CHAR(1) DEFAULT 'N' NOT NULL
);

--exercise 테이블 생성					
create table exercise(				
    exercise_no	 varchar2(20)  primary key
    , exercise_name	VARCHAR2(20)   not null
);

--class 테이블 생성
create table class(
	class_no	varchar2(20)	primary key	
    , member_no	 varchar2(20)	NOT NULL
    , exercise_no varchar2(20) NOT NULL
	, class_title	VARCHAR2(200)		
	, class_content	VARCHAR2(2000)		
	, class_introduce	VARCHAR2(200)		
	, class_regdate	DATE default sysdate		
	, teacher_content	VARCHAR2(2000)			
	, class_maxCount	NUMBER
	, class_price	VARCHAR2(50)
    , class_day varchar2(100)
    , class_time varchar2(100)
    , CONSTRAINT fk_class_exercise_no FOREIGN KEY (exercise_no) REFERENCES exercise(exercise_no)
    , CONSTRAINT fk_class_member_no FOREIGN KEY (member_no) REFERENCES member(member_no)
);


  
CREATE TABLE ATTACH(
    UUID VARCHAR2(100) PRIMARY KEY,
    class_no varchar2(20) not null,
    uploadpath varchar2(200) not null ,
    filename varchar2(100) not null,
    filetype char(1) DEFAULT 'I',
    CONSTRAINT fk_attach_class_no FOREIGN KEY (class_no) REFERENCES class(class_no)
    
);


--location 지역테이블 생성
CREATE TABLE location (
    location_no varchar2(20) primary key
    , class_no varchar2(20) not null
    , province VARCHAR2(20)
    , city VARCHAR2(20)
    , district VARCHAR2(20)
    ,CONSTRAINT fk_location_class_no FOREIGN KEY (class_no) REFERENCES class(class_no)
);



COMMIT;

--review 테이블 생성
create table review(
	review_no varchar2(20) primary key
	, member_no varchar2(20) NOT NULL
	, class_no varchar2(20) NOT NULL
	, review_regdate DATE DEFAULT sysdate NOT NULL
	, review_content VARCHAR2(200)
	, review_star NUMBER
    , CONSTRAINT fk_review_member_no FOREIGN KEY (member_no) REFERENCES member(member_no)
    , CONSTRAINT fk_review_class_no FOREIGN KEY (class_no) REFERENCES class(class_no)
);


--reservation 테이블 생성					
create table reservation(
	reservation_no	varchar2(20)	primary key		
	, member_no	varchar2(20)	NOT NULL		
	, class_no	varchar2(20)	NOT NULL		
	, reservation_date	varchar2(50)
	, reservation_time	VARCHAR2(50)
    , reservation_regdate	DATE DEFAULT sysdate
    , reservation_count number DEFAULT '0'
    , reservation_maxcount number
    , CONSTRAINT fk_reservation_member_no FOREIGN KEY (member_no) REFERENCES member(member_no)
	, CONSTRAINT fk_reservation_class_no FOREIGN KEY (class_no) REFERENCES class(class_no)
);




--scrap 테이블 생성
create table scrap(
	scrap_no	varchar2(20)	primary key		
	, class_no	varchar2(20)	NOT NULL		
	, member_no	varchar2(20)	NOT NULL
    , CONSTRAINT fk_scrap_class_no FOREIGN KEY (class_no) REFERENCES class(class_no)
    , CONSTRAINT fk_scrap_member_no FOREIGN KEY (member_no) REFERENCES member(member_no)
);



--member 테이블 데이터
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member1', 'password', 'Kim', 'kim@email.com', 'kim', 'N', 'N', '010-1234-5678');
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member2', 'password', 'Lee', 'lee@email.com', 'lee', 'Y', 'N', '010-2345-6789');
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member3', 'password', 'Park', 'park@email.com', 'park', 'N', 'N', '010-3456-7890');
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member4', 'password', 'Choi', 'choi@email.com', 'choi', 'N', 'N', '010-4567-8901');
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member5', 'password', 'Jung', 'jung@email.com', 'jung', 'Y', 'N', '010-5678-9012');
INSERT INTO MEMBER VALUES ('M' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'),'member6', 'password', 'hong', 'hong@email.com', 'hong', 'Y', 'N', '010-5678-9012');


--exercise 테이블 데이터
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'요가');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'필라테스');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'명상');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'에어로빅');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'축구');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'풋살');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'당구');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'헬스');
INSERT INTO EXERCISE (EXERCISE_NO, EXERCISE_NAME) VALUES ('E' || LPAD(SEQ_EXERCISE.NEXTVAL, 6, '0'),'크로스핏');


--class 테이블 데이터
INSERT INTO CLASS VALUES ('C' || LPAD(SEQ_CLASS.NEXTVAL, 6, '0'), 'M000003','E000002', '요가 수업', '기본적인 요가 동작을 배웁니다', '초급 요가', SYSDATE, '선생님에 대한 소개', 20, '무료', '2023-08-20', '14:00');
INSERT INTO class VALUES ('C' || LPAD(SEQ_CLASS.NEXTVAL, 6, '0'), 'M000006','E000003', '필라테스 수업', '필라테스 운동을 배웁니다', '초급 필라테스', SYSDATE, '선생님에 대한 소개', 15, '1만원','2023-08-20', '15:00');
INSERT INTO class VALUES ('C' || LPAD(SEQ_CLASS.NEXTVAL, 6, '0'), 'M000004','E000004', '명상 수업', '명상하는 방법을 배웁니다', '초보자를 위한 명상', SYSDATE, '선생님에 대한 소개', 10, '1.5만원','2023-08-20', '16:00');
INSERT INTO class VALUES ('C' || LPAD(SEQ_CLASS.NEXTVAL, 6, '0'), 'M000002','E000006', '축구 수업', '월클이 가르치는 슛자세', '초보자를 위한 축구', SYSDATE, '선생님에 대한 소개', 10, '1.5만원','2023-08-20', '17:00');
INSERT INTO CLASS VALUES ('C' || LPAD(SEQ_CLASS.NEXTVAL, 6, '0'), 'M000003','E000010', '크로스핏', '즐급게 운동합시다.', '크로스핏', SYSDATE, '선생님에 대한 소개', 20, '무료', '2023-08-01', '14:00');

--review 테이블 데이터
INSERT INTO REVIEW VALUES ('r' || LPAD(SEQ_review.NEXTVAL, 6, '0'), 'M000002', 'C000002', SYSDATE, '수업이 아주 좋았습니다!', 5);
INSERT INTO REVIEW VALUES ('r' || LPAD(SEQ_review.NEXTVAL, 6, '0'), 'M000002', 'C000003', SYSDATE, '수업이 아주 좋았습니다!', 5);
INSERT INTO REVIEW VALUES ('r' || LPAD(SEQ_review.NEXTVAL, 6, '0'), 'M000003', 'C000004', SYSDATE, '수업이 아주 좋았습니다!', 5);
INSERT INTO REVIEW VALUES ('r' || LPAD(SEQ_review.NEXTVAL, 6, '0'), 'M000004', 'C000005', SYSDATE, '수업이 아주 좋았습니다!', 5);


--reservation 테이블 데이터
INSERT INTO RESERVATION VALUES ('R' || LPAD(SEQ_RESERVATION.NEXTVAL, 6, '0'), 'M000002', 'C000002', '2023-08-20', '14:00', sysdate, 0, 3);
INSERT INTO RESERVATION VALUES ('R' || LPAD(SEQ_RESERVATION.NEXTVAL, 6, '0'), 'M000003', 'C000002','2023-08-20', '14:00', sysdate, 0, 3);
INSERT INTO RESERVATION VALUES ('R' || LPAD(SEQ_RESERVATION.NEXTVAL, 6, '0'), 'M000004', 'C000003', '2023-08-20', '15:00', sysdate, 0, 5);
INSERT INTO RESERVATION VALUES ('R' || LPAD(SEQ_RESERVATION.NEXTVAL, 6, '0'), 'M000005', 'C000004','2023-08-20', '16:00', sysdate, 0, 4);
INSERT INTO RESERVATION VALUES ('R' || LPAD(SEQ_RESERVATION.NEXTVAL, 6, '0'), 'M000006', 'C000005','2023-08-20', '17:00', sysdate, 0, 1);

--scrap 테이블 데이터
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000002', 'M000002');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000003', 'M000002');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000004', 'M000003');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000005', 'M000003');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000005', 'M000004');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000002', 'M000004');
INSERT INTO SCRAP VALUES ('S' || LPAD(SEQ_SCRAP.NEXTVAL, 6, '0'), 'C000003', 'M000004');

COMMIT;

-- location 테이블 데이터
INSERT INTO location VALUES ('L' || LPAD(SEQ_LOCATION.NEXTVAL, 6, '0'), 'C000002', '경기도', '고양시 덕양구', '행신동');
INSERT INTO location VALUES ('L' || LPAD(SEQ_LOCATION.NEXTVAL, 6, '0'), 'C000003', '경기도', '고양시 일산동구', '마두동');
INSERT INTO location VALUES ('L' || LPAD(SEQ_LOCATION.NEXTVAL, 6, '0'), 'C000004', '서울', '마포구', '대흥동');

-- ATTACH 테이블 데이터
INSERT INTO ATTACH VALUES ('UUID', 'C000002', 'PATH', 'image', 'I');

-- MASSAGE 테이블 데이터
INSERT INTO message (MESSAGE_NO, MESSAGE_TITLE, MESSAGE_CONTENT, SEND_NICK, RECV_NICK) 
    VALUES ('MSG' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'), 'kim to lee 쪽지 테스트', 'kim to lee 쪽지 테스트', 'kim', 'lee');
    
INSERT INTO message (MESSAGE_NO, MESSAGE_TITLE, MESSAGE_CONTENT, SEND_NICK, RECV_NICK) 
    VALUES ('MSG' || LPAD(SEQ_MEMBER.NEXTVAL, 6, '0'), 'lee to kim 쪽지 테스트', 'lee to kim 쪽지 테스트', 'lee', 'kim');


commit;