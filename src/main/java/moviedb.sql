use moviedb;
create table movie(
	movieCd int primary key,				# 영화 식별번호
    movieNm varchar(100) not null,			# 영화 이름 
    genreNm varchar(50) not null,			# 영화 장르
    watchGradeNm varchar(20), 				# 관람 등급
	openDt varchar(20) not null,			# 영화 개봉일	
	director varchar(20) not null,			# 감독 이름
    actor varchar(100) not null,			# 출연진 이름
    showTm int not null,					# 상영 시간
    showTypeNm varchar(20) not null,		# 상영 형태
	grade double,							# 평점
	audiCnt int,							# 누적 관객수
    movieInfo varchar(10000) not null 		# 영화 정보
);

create table member(
	memberNo int primary key auto_increment,	# 회원 식별번호
    memberName varchar(20) not null, 			# 회원 이름
    id varchar(20) unique key not null,			# 회원 아이디
    pw varchar(20) not null,					# 비밀번호
    birthDay varchar(20) not null,				# 생년월일
    address varchar(50) not null,				# 주소
    email varchar(30) not null, 				# 이메일
    favoriteGenre varchar(20),					# 선호 장르
    gender varchar(20) not null	 				# 성별
);
insert into member(memberName, id, pw, birthDay, address, email, favoriteGenre, gender)
values
('김영희', 'kim123', 'abc123', '1995-01-01', '서울특별시 강남구', 'kim123@gmail.com', '로맨스', '여성'),
('홍길동', 'honggd', 'qwe123', '1990-05-05', '경기도 수원시', 'honggd@naver.com', '미스터리', '남성'),
('박지영', 'jypark', 'zxc123', '1999-09-09', '서울특별시 마포구', 'jypark@hotmail.com', '판타지', '여성'),
('이영수', 'leeys', 'poi123', '1988-04-10', '부산광역시 해운대구', 'leeys@daum.net', 'SF', '남성'),
('유미경', 'yumikyung', 'mnb123', '2001-07-15', '경기도 고양시', 'yumikyung@naver.com', '로맨스', '여성');
select * from member;
create table board(
	boardNo int primary key auto_increment,		# 댓글 번호
    writerId varchar(20) not null, 				# 작성자 아이디
	movieCd int not null,						# 영화 이름
    grade int not null,							# 평점
    contents varchar(5000) ,					# 내용(후기)
    foreign key (writerId) references member(id) on delete cascade,
    foreign key (movieCd) references movie(movieCd) on delete cascade
);

create table theater(
	theaterNo int primary key auto_increment,	# 영화관 식별번호
    theaterName varchar(20) not null,			# 영화관 이름
    theaterLocation varchar(100) not null,	 	# 영화관 위치정보
    seatCnt int not null						# 가용 좌석 수
    );

CREATE TABLE screening (
screeningNo INT NOT NULL primary key AUTO_INCREMENT,	# 상영 정보 식별번호
movieCd INT NOT NULL,									# 영화 식별번호
theaterNo INT NOT NULL,									# 영화관 식별번호
startTime varchar(20) not NULL,							# 상영 시작 시간
FOREIGN KEY (movieCd) REFERENCES movie(movieCd) on update cascade on delete cascade,
FOREIGN KEY (theaterNo) REFERENCES theater(theaterNo) on update cascade on delete cascade
);

create table reservation(
	reserveNo int primary key auto_increment,	# 예약 식별번호
    memberId varchar(20) not null,				# 예약자 아이디
    screeningNo int not null,					# 예약 정보(상영 정보)
    seatNumber varchar(20) not null,			# 예약 좌석
    foreign key (memberId) references member(id),
    foreign key (screeningNo) references screening(screeningNo)
);
 SELECT * FROM reservation
create table seats(
	theaterNo int primary key not null,
    seatNum varchar(10) not null,
    checkSeat boolean default true,
    foreign key (theaterNo) references theater(theaterNo) on delete cascade on update cascade
);

insert into theater(theaterName, theaterLocation, seats) values("강남관", "강남", 25);
insert into theater(theaterName, theaterLocation, seats) values("서초관", "서초", 25);
insert into theater(theaterName, theaterLocation, seats) values("송파관", "송파", 25);
insert into member(memberName, id, pw, birthDay, address, favoriteGenre, gender) values("관리자", "admin", "admin", "0000-00-00", "admin", "admin", "admin");
