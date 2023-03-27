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


create table board(
	boardNo int primary key auto_increment,		# 댓글 번호
    writerId varchar(20) not null, 				# 작성자 아이디
	movieCd int not null,						# 영화 이름
    grade int not null,							# 평점
    contents varchar(5000) ,					# 내용(후기)
    foreign key (writerId) references member(id) on delete cascade,
    foreign key (movieCd) references movie(movieCd) on delete cascade
);

create table notice(
	noticeNo int primary key auto_increment,
	title varchar(50) not null,
	content varchar(500) not null,
	day varchar(20) not null
);

