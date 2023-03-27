use moviedb;
create table movie(
	movieCd int primary key,				# 영화 식별번호
    movieNm varchar(100) not null,			# 영화 이름 
    genreNm varchar(50) not null,			# 영화 장르
	openDt varchar(20) not null,			# 영화 개봉일	
	subject varchar(20),					# 구분
	grade double default 0,					# 평점
	adult boolean default false,			
	poster_path varchar(50) not null,
	backdrop_path varchar(50) not null,
	overview varchar(10000) not null
);

create table genres(
	genreId int,
	genreName varchar(20)
);

create table credits(
	id int,
	name varchar(100),
	profile_path varchar(100),
	charac varchar(100),
	job varchar(100)
);

select * from movie;
create table member(
	memberNo int primary key auto_increment,	# 회원 식별번호
    memberName varchar(20) not null, 			# 회원 이름
    id varchar(20) unique key not null,			# 회원 아이디
    pw varchar(20) not null,					# 비밀번호
    birthDay varchar(20) not null,				# 생년월일
    address varchar(50) not null,				# 주소
    email varchar(30) not null, 				# 이메일
    favoriteGenre varchar(20),					# 선호 장르
    gender varchar(100) not null,				# 성별
   	movieCheck json								# 영화 좋아요
);
CREATE TABLE memberPick(
	memberId varchar(20) primary key,
	movieLike varchar(500),
	movieSeen varchar(500),
	foreign key (memberId) references member(id) on delete cascade
);

insert into member(memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
values
('관리자', 'admin', 'admin', '1995-01-01', '서울특별시 강남구', 'admin@gmail.com', '로맨스', '남성');
insert into member(memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
values
('123', '123', '123', '1995-01-01', '서울특별시 강남구', '123@gmail.com', '로맨스', '남성');
INSERT INTO member (memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
VALUES
    ('김철수', 'kim123', 'password123', '1995-05-12', '서울특별시 강남구', 'kim123@gmail.com', '액션', '남성'),
    ('이영희', 'lee_yh', '12345678', '1998-02-28', '경기도 고양시 일산동구', 'yeonghee@gmail.com', '로맨스', '여성'),
    ('박민준', 'parkminjun', 'pw1234', '2001-11-07', '서울특별시 송파구', 'parkmj@gmail.com', '코미디', '남성'),
    ('홍길동', 'honggd', '1234', '1990-06-30', '서울특별시 마포구', 'honggd@naver.com', '드라마', '남성'),
    ('김민지', 'minji_kim', 'password!@#', '1992-12-15', '경기도 부천시', 'kimminji92@gmail.com', '판타지', '여성'),
    ('이지원', 'jwonlee', 'leejwon11', '1997-08-20', '서울특별시 강서구', 'jwonlee@daum.net', '스릴러', '여성'),
    ('최승우', 'seungwoo', 'abc123', '2000-03-22', '경기도 용인시', 'seungwoo00@naver.com', '애니메이션', '남성'),
    ('정지수', 'jsjung', 'qweasd123', '1994-09-17', '서울특별시 종로구', 'jsjung94@naver.com', 'SF', '여성'),
    ('윤지현', 'ji_hyun', 'abcd1234', '1999-12-31', '서울특별시 서초구', 'yoonjihyun@gmail.com', '코미디', '여성'),
    ('박준혁', 'jh_park', 'pjh9876', '1993-07-06', '경기도 광명시', 'junhyuk_park@daum.net', '액션', '남성');

create table board(
	boardNo int primary key auto_increment,		# 댓글 번호
    writerId varchar(20) not null, 				# 작성자 아이디
	movieCd int not null,						# 영화 이름
    grade int not null,							# 평점
    contents varchar(5000) ,					# 내용(후기)
    foreign key (writerId) references member(id) on delete cascade,
    foreign key (movieCd) references movie(movieCd) on delete cascade
);
SELECT * FROM board;

create table notice(
	noticeNo int primary key auto_increment,
	title varchar(50) not null,
	content varchar(500) not null,
	day varchar(20) not null
);
INSERT INTO notice (title, content, day)
VALUES
    ('[공지] 서비스 이용약관 변경 안내', '안녕하세요. 저희 서비스 이용약관이 변경되었습니다. 변경된 내용은 아래와 같습니다. 1. 이용약관 동의 방법 변경 2. 회원 탈퇴 절차 변경 3. 기타 약관 변경 사항 자세한 내용은 홈페이지 공지사항을 참고해주세요.', '2022-08-15'),
    ('[이벤트] 추석 연휴 이벤트!', '추석 연휴 기간 동안 회원 가입 시 3개월 무료 이용 쿠폰을 제공합니다. 기간: 2022.09.19 ~ 2022.09.21', '2022-09-15'),
    ('[안내] 새로운 서비스 오픈!', '저희 서비스에 새로운 기능이 추가되었습니다. 이제부터 회원님들은 영화 추천 서비스를 받으실 수 있습니다. 자세한 내용은 홈페이지 내 공지사항을 참고해주세요.', '2022-10-01'),
    ('[공지] 개인정보 처리방침 변경 안내', '안녕하세요. 저희 서비스 개인정보 처리방침이 변경되었습니다. 변경된 내용은 아래와 같습니다. 1. 개인정보 수집 항목 추가 2. 개인정보 처리 및 보유 기간 변경 3. 기타 개인정보 처리방침 변경 사항 자세한 내용은 홈페이지 공지사항을 참고해주세요.', '2022-11-10'),
    ('[이벤트] 겨울방학 이벤트!', '겨울방학 기간 동안 회원 가입 시 1개월 무료 이용 쿠폰을 제공합니다. 기간: 2022.12.24 ~ 2022.12.31', '2022-12-15'),
    ('[안내] 새로운 영화 추가!', '최신 영화 \'스파이더맨: 노 웨이 홈\'이 추가되었습니다. 회원님들은 이제부터 이 영화를 시청하실 수 있습니다.', '2023-01-05');
INSERT INTO board (writerId, movieCd, grade, contents) VALUES
    ('123', 493529, 4, '재미있었습니다.'),
    ('kim123', 594767, 3, '기대했던 것보단 별로였네요.'),
    ('lee_yh', 603692, 5, '진짜 대박영화입니다.'),
    ('parkminjun', 631842, 4, '보는 내내 긴장감이 유지되는 영화였습니다.'),
    ('honggd', 937278, 2, '이게 뭐냐 싶은 영화였습니다.');
    ('minji_kim', 493529, 4, '킬링타임 강추.'),
    ('jwonlee', 594767, 3, '무난무난 합니다.'),
    ('seungwoo', 603692, 5, '인생작 입니다.'),
    ('ji_hyun', 631842, 4, '한번 더 보고싶어요.'),
    ('jh_park', 937278, 2, '볼 가치가 없습니다.');
    select*from board;
SELECT movie.movieCd, COUNT(board.movieCd) AS board_cnt
FROM movie
LEFT JOIN board ON movie.movieCd = board.movieCd
GROUP BY movie.movieCd;
select * from credits
select * from movie;
