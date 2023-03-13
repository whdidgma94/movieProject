use moviedb;
create table movie(
	movieNo int primary key auto_increment, # 영화 식별번호
    movieName varchar(100) not null,		# 영화 이름 
    genre varchar(50) not null,				# 영화 장르
    ageLimit int, 							# 관람 등급
	releaseDay varchar(20) not null,		# 영화 개봉일
	director varchar(20) not null,			# 감독 이름
    actor varchar(100) not null,			# 출연진 이름
    duration int not null,					# 상영 시간
	grade int not null,						# 평점
	audience int not null,					# 누적 관객수
    movieInfo varchar(10000) not null 		# 영화 정보
);

create table member(
	memberNo int primary key auto_increment,	# 회원 식별번호
    memberName varchar(20) not null, 			# 회원 이름
    id varchar(20) unique key not null,			# 회원 아이디
    pw varchar(20) not null,					# 비밀번호
    birthDay varchar(20) not null,				# 생년월일
    address varchar(50) not null,				# 주소
    favoriteGenre varchar(20),					# 선호 장르
    gender varchar(20) not null	 				# 성별
);

create table board(
	boardNo int primary key auto_increment,		# 댓글 번호
    writerId varchar(20) not null, 				# 작성자 아이디
	movieNo int not null,						# 영화 이름
    grade int not null,							# 평점
    contents varchar(5000) ,					# 내용(후기)
    foreign key (writerId) references member(id) on delete cascade,
    foreign key (movieNo) references movie(movieNo) on delete cascade
);

create table theater(
	theaterNo int primary key auto_increment,	# 영화관 식별번호
    theaterName varchar(20) not null,			# 영화관 이름
    theaterLocation varchar(100) not null,	 	# 영화관 위치정보
    seats int not null							# 예매 가능한 좌석 수
);

CREATE TABLE screening (
screeningNo INT NOT NULL primary key AUTO_INCREMENT,	# 상영 정보 식별번호
movieNo INT NOT NULL,									# 영화 식별번호
theaterNo INT NOT NULL,									# 영화관 식별번호
startTime timestamp not NULL,							# 상영 시작 시간
FOREIGN KEY (movieNo) REFERENCES movie(movieNo) on update cascade on delete cascade,
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