use moviedb;
create table movie(
	movieCd int primary key,				# 영화 식별번호
    movieNm varchar(100) not null,			# 영화 이름 
    genreNm varchar(50) not null,			# 영화 장르
    watchGradeNm varchar(20), 				# 관람 등급
	openDt varchar(20) not null,			# 영화 개봉일	
	director varchar(20) not null,			# 감독 이름
    actor varchar(500),						# 출연진 이름
    showTm int not null,					# 상영 시간
    showTypeNm varchar(20) not null,		# 상영 형태
	grade double,							# 평점
	audiCnt int,							# 누적 관객수
	ranking int								# 순위
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
    gender varchar(100) not null	 			# 성별
);
insert into member(memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
values
('관리자', 'admin', 'admin', '1995-01-01', '서울특별시 강남구', 'admin@gmail.com', '로맨스', '남성');
insert into member(memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
values
('123', '123', '123', '1995-01-01', '서울특별시 강남구', '123@gmail.com', '로맨스', '남성');
SELECT * FROM member;

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
create table theater(
	theaterNo int primary key auto_increment,	# 영화관 식별번호
    theaterName varchar(20) not null,			# 영화관 이름
    theaterLocation varchar(100) not null,	 	# 영화관 위치정보
    seatCnt int not null						# 가용 좌석 수
    );

create table notice(
	noticeNo int primary key auto_increment,
	title varchar(50) not null,
	content varchar(500) not null,
	day varchar(20) not null
);
INSERT INTO board (writerId, movieCd, grade, contents) VALUES
    ('123', 20197654, 4, '재미있었습니다.'),
    ('123', 20197654, 3, '기대했던 것보단 별로였네요.'),
    ('123', 20197654, 5, '진짜 대박영화입니다.'),
    ('123', 20197654, 4, '보는 내내 긴장감이 유지되는 영화였습니다.'),
    ('123', 20197654, 2, '이게 뭐냐 싶은 영화였습니다.');
    select*from board;
SELECT movie.movieCd, COUNT(board.movieCd) AS board_cnt
FROM movie
LEFT JOIN board ON movie.movieCd = board.movieCd
GROUP BY movie.movieCd;
