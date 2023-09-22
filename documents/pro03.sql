CREATE DATABASE teaspoon;

USE teaspoon;

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
SELECT * FROM member;

INSERT INTO MEMBER VALUES('admin','1234','관리자','admin@edu.com','01012345678',NULL,NULL,NULL,DEFAULT,'1990-03-02', DEFAULT, DEFAULT);
UPDATE MEMBER SET pw='$2a$10$piyWPHz4GuwW0GxHZZfy1ORWtzKu7KPr9M0mFpw90hQJRQditQqJO' WHERE id = 'admin';

-- 커뮤니티 카테고리 테이블 생성
CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);

-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '교육정보');
INSERT INTO category VALUES('C', '교재/학원 추천');
INSERT INTO category VALUES('D', '진로상담');

-- 커뮤니티 테이블
CREATE TABLE board(
	seq INT PRIMARY KEY AUTO_INCREMENT,
	cate VARCHAR(5) NOT NULL,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	nickname VARCHAR(20),
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	visited INT DEFAULT 0,
	FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
  	FOREIGN KEY(nickname) REFERENCES member(id) ON DELETE CASCADE
);

INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목1입니다.', '샘플 글 내용1입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목2입니다.', '샘플 글 내용2입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목3입니다.', '샘플 글 내용3입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목4입니다.', '샘플 글 내용4입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목5입니다.', '샘플 글 내용5입니다.', '닉네임');
INSERT INTO board(title, content, nickname) VALUES('샘플 글 제목6입니다.', '샘플 글 내용6입니다.', '닉네임');

-- 커뮤니티 댓글 테이블 생성
CREATE TABLE COMMENT(
   comNo INT PRIMARY KEY AUTO_INCREMENT,
   seq INT NOT NULL,
   nickname VARCHAR(20) NOT NULL,
   resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(1000) NOT NULL,
   FOREIGN KEY(seq) REFERENCES board(seq) ON DELETE CASCADE,
   FOREIGN KEY(nickname) REFERENCES member(id) ON DELETE CASCADE
);

SELECT * FROM COMMENT;

-- 업로드 된 파일 정보 테이블 생성
CREATE TABLE fileInfo(
  no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  articleNo INT,
  saveFolder VARCHAR(300) NOT NULL,
  originFile VARCHAR(300) NOT NULL,
  saveFile VARCHAR(300) NOT NULL
);

-- 자료실 테이블 생성
CREATE TABLE dataRoom (
  articleNo int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id VARCHAR(20) NOT NULL,
  title varchar(100) NOT NULL,
  content varchar(2000) NOT NULL,
  regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM fileInfo;
SELECT * FROM dataroom;

DELETE FROM fileinfo;
DELETE FROM dataroom;