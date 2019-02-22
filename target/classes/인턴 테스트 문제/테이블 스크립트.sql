CREATE TABLE code_skill (
   skill_code NUMBER(3),
   skill_name VARCHAR2(20) not NULL unique,
   PRIMARY KEY(skill_code)
);

CREATE SEQUENCE code_skill_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE code_religion (
    religion_code NUMBER(3),
    religion_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(religion_code)
);

CREATE SEQUENCE code_religion_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE code_school (
    school_code NUMBER(3),
    school_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(school_code)
);

CREATE SEQUENCE code_school_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE staff (
    staff_no NUMBER(3),
    staff_name VARCHAR2(14) NOT NULL,
    jumin_no CHAR(14) NOT NULL UNIQUE,
    school_code number(3) NOT NULL,
    religion_code NUMBER(3) NOT NULL,
    graduate_day char(10) NOT NULL,
    FOREIGN KEY(religion_code) REFERENCES code_religion(religion_code),
    FOREIGN KEY(school_code) REFERENCES code_school(school_code),
    PRIMARY KEY(staff_no)
);

CREATE SEQUENCE staff_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE staff_skill (
    staff_skill_no number(3),
    staff_no number(3) NOT NULL,
    skill_code NUMBER(3) NOT NULL,
    PRIMARY KEY(staff_skill_no),
    FOREIGN KEY(staff_no) REFERENCES staff(staff_no),
    FOREIGN KEY(skill_code) REFERENCES code_skill(skill_code)
);

CREATE SEQUENCE staff_skill_seq START WITH 1 INCREMENT BY 1;


INSERT INTO code_skill(skill_code, skill_name) VALUES(CODE_SKILL_SEQ.nextval, 'Java');
INSERT INTO code_skill(skill_code, skill_name) VALUES(CODE_SKILL_SEQ.NEXTVAL, 'JSP');
INSERT INTO code_skill(skill_code, skill_name) VALUES(CODE_SKILL_SEQ.NEXTVAL, 'ASP');
INSERT INTO code_skill(skill_code, skill_name) VALUES(CODE_SKILL_SEQ.NEXTVAL, 'PHP');
INSERT INTO code_skill(skill_code, skill_name) VALUES(CODE_SKILL_SEQ.NEXTVAL, 'Delphi');

INSERT INTO code_religion(religion_code, religion_name) VALUES(CODE_RELIGION_SEQ.NEXTVAL, '기독교');
INSERT INTO code_religion(religion_code, religion_name) VALUES(CODE_RELIGION_SEQ.NEXTVAL, '천주교');
INSERT INTO code_religion(religion_code, religion_name) VALUES(CODE_RELIGION_SEQ.NEXTVAL, '불교');
INSERT INTO code_religion(religion_code, religion_name) VALUES(CODE_RELIGION_SEQ.NEXTVAL, '이슬람');
INSERT INTO code_religion(religion_code, religion_name) VALUES(CODE_RELIGION_SEQ.NEXTVAL, '무교');

INSERT INTO code_school(school_code, school_name) VALUES(CODE_SCHOOL_SEQ.NEXTVAL, '고졸');
INSERT INTO code_school(school_code, school_name) VALUES(CODE_SCHOOL_SEQ.NEXTVAL, '전문대졸');
INSERT INTO code_school(school_code, school_name) VALUES(CODE_SCHOOL_SEQ.NEXTVAL, '일반대졸');


INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '저팔계', '850408-1111111', 3, 2, '2007-02-11');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '사오정', '830509-1111111', 1, 1, '2008-03-12');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '손오공', '820610-1111111', 2, 2, '2009-04-13');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '삼장', '810511-1111111', 3, 3, '2010-05-15');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '세일러문', '800512-2111111', 1, 4, '2011-06-16');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '머큐리', '790613-2111111', 2, 5, '2012-07-17');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '마스', '680714-2111111', 3, 1, '2013-08-08');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '쥬피터', '990815-2111111', 1, 2, '2014-09-09');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '비너스', '870916-2111111', 2, 3, '2015-10-10');
INSERT INTO STAFF (staff_no, staff_name, jumin_no, school_code, religion_code, graduate_day)
VALUES(STAFF_SEQ.NEXTVAL, '넵튠', '861017-2111111', 3, 4, '2016-11-11');


INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 1, 1);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 2, 2);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 3, 3);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 4, 4);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 5, 5);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 6, 1);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 7, 2);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 8, 3);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 9, 4);
INSERT INTO STAFF_SKILL ( STAFF_SKILL_no, staff_no, skill_code ) VALUES (STAFF_SKILL_SEQ.NEXTVAL, 10, 5);




