CREATE DATABASE teaspoon;

USE teaspoon;

-- 샘플 테이블
CREATE TABLE sample(
	NO INTEGER AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(100)
);

INSERT INTO sample VALUES (DEFAULT, '김이름');
INSERT INTO sample VALUES (DEFAULT, '이이름');
INSERT INTO sample VALUES (DEFAULT, '박이름');
INSERT INTO sample VALUES (DEFAULT, '최이름');

SELECT * FROM sample;

-- 공지사항 테이블
CREATE TABLE board(
	seq INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	nickname VARCHAR(20),
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	visited INT DEFAULT 0
);

INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목1입니다.', '샘플 글 내용1입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목2입니다.', '샘플 글 내용2입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목3입니다.', '샘플 글 내용3입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목4입니다.', '샘플 글 내용4입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목5입니다.', '샘플 글 내용5입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목6입니다.', '샘플 글 내용6입니다.', '닉네임');

-- 회원 테이블
CREATE TABLE MEMBER(
	id VARCHAR(20) PRIMARY KEY NOT NULL,
	pw VARCHAR(300) NOT NULL,
	NAME VARCHAR(50),
	email VARCHAR(100) NOT NULL,
	tel VARCHAR(20) NOT NULL,
	addr1 VARCHAR(200),
	addr2 VARCHAR(100),
	postcode VARCHAR(10),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	birth DATE,
	pt INT(11) DEFAULT 0,
	visited INT(11) DEFAULT 0
);

SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES('admin','1234','관리자','admin@edu.com','01012345678',NULL,NULL,NULL,DEFAULT,'1990-03-02', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('kim','1234','김이름','kim@edu.com','01098765432',NULL,NULL,NULL,DEFAULT,'1995-08-08', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('lee','1234','이이름','lee@edu.com','01011112222',NULL,NULL,NULL,DEFAULT,'2000-04-05', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES('park','1234','박이름','park@edu.com','01099991111',NULL,NULL,NULL,DEFAULT,'1999-10-13', DEFAULT, DEFAULT);