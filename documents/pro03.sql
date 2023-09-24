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

SELECT * FROM comment;

/* 공지사항 테이블 생성 */
CREATE TABLE notice (
   seq INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   nickname VARCHAR(20),
   regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   visited INT DEFAULT 0
);

/* 공지사항 더미데이터 */
INSERT INTO notice VALUES (DEFAULT,'신규 회원 가입 안내','저희 학부모 커뮤니티에 가입하신 것을 진심으로 환영합니다. 회원 가입을 통해 여러분의 소중한 의견과 경험을 공유해주세요. 커뮤니티가 더욱 풍요롭고 활기찬 공간이 되도록 함께 노력하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 이용 규칙 안내','티스푼은 아름다운 소통과 공유의 장을 만들기 위해 규칙을 마련하였습니다. 모든 회원들이 존중받고 행복한 커뮤니티를 유지할 수 있도록 함께 노력해주실 것을 부탁드립니다','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 업데이트 안내','티스푼은 항상 더 나은 서비스를 제공하기 위해 노력하고 있습니다. 최근에 이루어진 업데이트 내용에 대해 안내드립니다. 회원 여러분의 소중한 의견을 항상 환영하며, 더 나은 커뮤니티를 만들기 위해 노력하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'자주 묻는 질문 (FAQ) 업데이트 안내','티스푼에서 자주 묻는 질문들에 대한 업데이트가 이루어졌습니다. 더 나은 서비스를 위한 자주 묻는 질문을 확인하시어 필요한 정보를 얻어가시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'안전한 커뮤니티 이용을 위한 안내','안전하게 커뮤니티를 이용하기 위해 몇 가지 유용한 안내를 드립니다. 어떻게 커뮤니티 내에서 안전하게 활동할 수 있는지에 대한 방법을 참고하여, 즐거운 커뮤니티 활동을 즐겨보시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'사용자 경험 개선을 위한 소중한 의견 수렴 안내','티스푼은 회원 여러분들의 소중한 의견을 항상 기다리고 있습니다. 사용자들의 의견을 토대로 커뮤니티를 보다 나은 곳으로 만들기 위해 최선을 다하겠습니다. 의견이나 제안 사항은 언제든지 환영합니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티 참여와 활동 방법 안내','티스푼에서 어떻게 참여하고 활동할 수 있는지에 대한 자세한 방법을 안내해 드립니다. 다양한 기능을 활용하여 보다 활발한 커뮤니티 활동에 참여해주시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 예의와 배려 안내','티스푼은 모두가 존중받고 행복한 환경을 만들기 위해 예의와 배려가 중요합니다. 다른 회원들을 존중하고 따뜻한 마음으로 소통하실 것을 부탁드립니다. 함께하는 커뮤니티를 만들어 나가는 데 도움을 주신다면 감사하겠습니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 긍정적인 기여에 대한 감사','티스푼은 모든 회원 여러분의 긍정적인 기여에 큰 감사를 드립니다. 각자의 의견과 경험이 모여 더 풍성한 커뮤니티를 만들 수 있습니다. 앞으로도 함께 나눔과 협력을 통해 더욱 발전된 커뮤니티를 만들어 나가시길 바랍니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'커뮤니티에서의 소중한 순간들을 기록하는 방법 안내','티스푼에서의 소중한 순간들을 기록하고 나누는 방법에 대한 안내입니다. 회원들 각자의 소중한 순간들을 공유하여 함께 기뻐하고 나누어주세요.','admin',DEFAULT, DEFAULT);

INSERT INTO notice VALUES (DEFAULT,'커뮤니티 내에서의 정보 무단 유출에 대한 주의 안내','티스푼에서의 정보 무단 유출에 대한 주의사항을 안내해 드립니다. 모두가 안전하게 정보를 공유하고 사용할 수 있도록 주의해주시길 부탁드립니다.','admin',DEFAULT, DEFAULT);

-- faq 테이블 생성
CREATE TABLE faq (
   fno INT  PRIMARY KEY AUTO_INCREMENT ,
   question VARCHAR(1000) NOT NULL,
   answer VARCHAR(1000) NOT NULL,
   cnt INT DEFAULT 0 NOT NULL
);

-- faq 더미 데이터 추가
INSERT INTO faq(question, answer) VALUES('웹사이트에 어떻게 가입하나요?', '회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('게시물을 어떻게 작성하나요?', '커뮤니티 페이지의 "글 작성" 버튼을 클릭하여 게시물을 작성할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('다른 회원들의 게시물에 댓글을 달고 싶어요. 어떻게 해야 하나요?','게시물의 하단에 있는 "댓글 작성" 영역에 댓글을 입력하여 등록할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('제가 작성한 글이 갑자기 사라졌어요', '부적절한 내용은 관리자가 예고 없이 삭제할 수 있습니다. 커뮤니티 규칙을 지켜주세요:)');
INSERT INTO faq(question, answer) VALUES('개인 정보 보호 정책은 무엇인가요?', '웹사이트의 개인 정보 보호 정책은 "회원가입의 회원약관동의" 페이지에서 확인할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('문의사항이 있을 때 어떻게 연락할 수 있나요?', '고객지원의 "QnA" 페이지에서 문의글을 작성하여 문의할 수 있습니다.');
INSERT INTO faq(question, answer) VALUES('어떤 유형의 교육자료를 제공하나요?', '초등학교, 중학교 및 고등학교 학생들을 위한 교과서, 참고서 및 워크북을 포함한 다양한 교육자료를 제공합니다.');
INSERT INTO faq(question, answer) VALUES('책은 실물 및 디지털 형식으로 모두 제공되나요?', '네, 대부분의 책은 실물 및 디지털 형식으로 제공되며 다양한 학습 선호도를 고려합니다.');
INSERT INTO faq(question, answer) VALUES('책이나 주제에 대한 제안을 할 수 있나요?', '물론입니다! 저희는 모든 제안을 소중히 생각합니다. 고객 지원팀에 의견을 보내주시면 됩니다.');
INSERT INTO faq(question, answer) VALUES('책은 정기적으로 업데이트되나요?', '네, 정확성과 관련성을 보장하기 위해 최신 교과서 및 참고 자료의 최신 판을 제공하기 위해 노력하고 있습니다.');

-- QNA
CREATE TABLE qna(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용`
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE);
SELECT * FROM qna;
-- QNA 테이블 더미데이터 생성
INSERT INTO	qna VALUES(DEFAULT, '가입하고 싶어요','웹사이트에 어떻게 가입하나요?','kimname1',DEFAULT, DEFAULT, 1);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 가입하고 싶어요',' 회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.','admin',DEFAULT, 1, 1);
INSERT INTO	qna VALUES(DEFAULT, '개인 정보 업데이트하고 싶어요','회원 정보를 어떻게 수정하거나 업데이트하나요?','kimname1',DEFAULT, DEFAULT, 2);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 개인 정보 업데이트하고 싶어요',' 로그인 후, 마이페이지에서 회원 정보를 수정하고 업데이트할 수 있습니다.','admin',DEFAULT, 1, 2);
INSERT INTO	qna VALUES(DEFAULT, '커뮤니티 어떻게 사용해요?','게시물을 작성하는 방법을 알려주세요.','kimname1',DEFAULT, DEFAULT, 3);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 커뮤니티 어떻게 사용해요?',' 커뮤니티 페이지에서 카테고리를 설정한 후 글을 작성해주세요. 글의 하단에는 댓글을 추가할 수 있는 공간도 있습니다. 글과 댓글을 작성하면서 정보를 공유하세요','admin',DEFAULT, 1, 3);

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

-- 출석체크 테이블 생성
CREATE TABLE attendance (
   ano INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   id VARCHAR(20),
   attend DATE DEFAULT current_date);

/* 이벤트 글 테이블 */
CREATE TABLE event (
	eno int  PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(100) NOT NULL,
   content VARCHAR(1000) NOT NULL,
   STATUS VARCHAR(5) CHECK(status IN(0, 1)),
   sdate DATE,
   edate DATE,
   author VARCHAR(16),
   regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   cnt INT DEFAULT 0 NOT NULL
);

-- 이벤트 더미데이터 생성
INSERT INTO event 
VALUES(DEFAULT, '육아에 지친 당신에게 치맥을 드립니다','<p><img alt="" src="/tspoon_war/event/ckImgSubmit.do?uid=5bf93a98-739e-48a1-88e3-734558e69c37&amp;fileName=제목을-입력해주세요_-001.png" style="height:800px; width:800px" /></p>', 1, 20230920,20230930,'admin', '2023-09-20', DEFAULT);
INSERT INTO EVENT 
VALUES(DEFAULT, '풍성한 가을 이벤트','<p><img alt="" src="/tspoon_war/event/ckImgSubmit.do?uid=3b137af7-771f-4674-8c0e-d194bff4bae7&amp;fileName=제목을 입력해주세요_-001.png" style="height:1587px; width:1123px"/></p>', 1, 20230921,20231021,'admin', '2023-09-20', DEFAULT);


-- 회원의 이벤트 접수
create table apply(
   appno int AUTO_INCREMENT PRIMARY KEY,		/* 접수 번호 */
   eno int not NULL,									/* 이벤트글 번호 */
   id varchar(100) not NULL,						/* 당첨자 아이디 */
   name varchar(100) not NULL,					/* 당첨자 이름 */
   tel varchar(13),									/* 전화번호 */
   foreign key(eno) references event(eno) on delete cascade,
   FOREIGN KEY(id) references member(id) on delete CASCADE);

-- 당첨자 리스트
create table winnerList(
   appno int auto_increment primary key not null,			
   eno int not NULL,										
   id varchar(100) not NULL,										
   name varchar(100) not NULL,						
   tel varchar(13),													
   foreign key(eno) references event(eno) on delete cascade,
   FOREIGN key(id) references member(id) on delete cascade);

SELECT * FROM winnerList;


--당첨자 발표 글
create table winner(
	wno int primary key AUTO_INCREMENT,			/* 당첨글 번호 */
   eno int not NULL,									/* 이벤트 글 번호 */
   title varchar(100),								/* 글 제목 */
   content varchar(1000),							/* 글 내용 */
   author varchar(100),								/* 작성자 */
   resdate datetime default CURRENT_TIMESTAMP,	/* 작성일 */
   FOREIGN key(eno) references event(eno));