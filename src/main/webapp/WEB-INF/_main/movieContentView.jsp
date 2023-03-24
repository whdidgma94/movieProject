<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>


<style>
main {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #fff;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

h2 {
	margin: 0;
	margin-bottom: 20px;
}

.img-wrapper {
	width: 60%;
	margin: 20px;
}

.btns {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
	font-size: 16px;
}

.grade {
	display: flex;
	justify-content: center;
	align-items: center;
}

.select-img {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-left: 20px;
}

.select-img img {
	height: 100px;
	width: 100px;
	margin-bottom: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.select-img img:hover {
	opacity: 0.7;
}

.pagination {
	margin-top: 0;
	margin-bottom: 0;
}

.pagination .active a {
	background-color: #007bff;
	border-color: #007bff;
}

.btns {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
	margin-top: 20px;
}

.btn-primary {
	margin-right: 10px;
}

.content-wrapper {
	width: 40%;
	margin-left: 10px;
}

table {
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
	border-collapse: collapse;
}

table th {
	font-weight: bold;
	padding: 10px;
	text-align: left;
	border: 1px solid #dee2e6;
}

table td {
	padding: 10px;
	text-align: left;
	border: 1px solid #dee2e6;
}

.selected {
	border: none;
	filter: brightness(90%);
	transform: scale(1.05);
}

.checked {
	color: #f7d400;
	font-size: 24px;
	font-family: 'Font Awesome 5 Free';
}

.fa-star.half, .fa-star.checked.half {
	color: #f7d400;
	font-size: 24px;
}

.grade {
	display: flex;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	color: #777;
}

.rating-text {
	margin-left: 10px;
}

#overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: 999;
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#overlay.show {
	visibility: visible;
	opacity: 1;
}

.stop-scrolling {
	/* height: 100%; */
	overflow: hidden;
}

.youtube {
	width: 60%;
	height: 60%;
}

iframe {
	display: block;
	width: 100%;
}

.noVideo {
	color: white;
}
</style>
<body class="mainView">
	<main>
		<h2>${vo.movieNm }</h2>
		<div style="display: flex">
			<div class="img-wrapper">
				<div class="main-img"
					style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<img
						style="width: 600px; height: 700px; margin-bottom: 20pxp; border-radius: 5px;"
						alt=""
						src="https://image.tmdb.org/t/p/original${imageList.get(0) }">
				</div>
				<div class="select-img">
					<ul class="pagination"
						style="width: 100%; display: flex; justify-content: center; align-items: center">
						<li class="page-item"><a class="page-link preBtn" href="#"
							aria-label="Previous"> <span aria-hidden="true">«</span> <span
								class="sr-only preBtn">Previous</span>

						</a></li>

						<c:forEach var="image" items="${imageList }" varStatus="status"
							begin="0" end="7">
							<li class="page-item" style="margin-top: 10px"><img
								class="page-link" alt=""
								src="https://image.tmdb.org/t/p/original${image }"
								style="height: 100px; width: 100px"></li>
						</c:forEach>
						<li class="page-item"><a class="page-link nextBtn" href="#"
							aria-label="Next"> <span aria-hidden="true">»</span> <span
								class="sr-only nextBtn">Next</span>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="content-wrapper">
				<div class="grade">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="rating-text">평점:
						${vo.grade}점</span>
				</div>


				<c:if test="${log ne null}">
					<div class="btns">
						<c:if test="${like}">
							<button class="btn btn-primary"
								onclick="movieLike(${vo.movieCd})">좋아요</button>
						</c:if>
						<c:if test="${not like}">
							<button class="btn btn-danger" onclick="movieLike(${vo.movieCd})">좋아요
								취소</button>
						</c:if>
						<c:if test="${seen}">
							<button class="btn btn-primary"
								onclick="movieSeen(${vo.movieCd})">봤어요</button>
						</c:if>
						<c:if test="${not seen}">
							<button class="btn btn-danger" onclick="movieSeen(${vo.movieCd})">봤어요
								취소</button>
						</c:if>
						<button class="btn btn-danger" onclick="preview(${vo.movieCd})">예고편
							보기</button>
					</div>
				</c:if>
				<table>
					<tr>
						<th>장르</th>
						<td>${vo.genreNm }</td>
					</tr>
					<tr>
						<th>감독</th>
						<td>감독명</td>
					</tr>
					<tr>
						<th>출연</th>
						<td>출연진</td>
					</tr>
					<tr>
						<th>줄거리</th>
						<td>${vo.overview }</td>
					</tr>
				</table>
			</div>
		</div>
	</main>
	<div id="overlay">
		<div class="youtube">
			<img class="close" src="#">
		</div>
	</div>
</body>

<script>
const selectImgs = document.querySelectorAll('.select-img img');
const mainImg = document.querySelector('.main-img img');
const preBtn = document.querySelector('.preBtn');
const nextBtn = document.querySelector('.nextBtn');
const youtube = document.querySelector(".youtube");
const overlay = document.querySelector("#overlay");
const closeButton = document.querySelector(".close");
let currentScrollY = "";
let selectedImg = selectImgs[0];
selectedImg.classList.add('selected');

function setRatingStars(rating) {
    let starIcons = document.querySelectorAll(".grade .fa-star");

    rating = Math.round(parseFloat(rating) * 2) / 2;
    let fullStars = Math.floor(rating);
    let halfStars = Math.ceil(rating - fullStars);
    let emptyStars = 5 - fullStars - halfStars;

    for (let i = 0; i < fullStars; i++) {
        starIcons[i].classList.add("checked");
    }

    if (halfStars > 0.5) {
        starIcons[fullStars].classList.add("checked", "half");
    }

    for (let i = 0; i < emptyStars; i++) {
        starIcons[fullStars + halfStars + i].classList.remove("checked");
    }
}

let rating = parseFloat("${vo.grade}");
setRatingStars(rating);


selectImgs.forEach((img) => {
  img.addEventListener('click', () => {
    mainImg.src = img.src;
    selectedImg.classList.remove('selected');
    img.classList.add('selected');
    selectedImg = img;
  });
});

preBtn.addEventListener('click', () => {
  const currentIndex = [...selectImgs].indexOf(selectedImg);
  selectedImg.classList.remove('selected');
  selectedImg =
    currentIndex === 0
      ? selectImgs[selectImgs.length - 1]
      : selectImgs[currentIndex - 1];
  mainImg.src = selectedImg.src;
  selectedImg.classList.add('selected');
});

nextBtn.addEventListener('click', () => {
  const currentIndex = [...selectImgs].indexOf(selectedImg);
  selectedImg.classList.remove('selected');
  selectedImg =
    currentIndex === selectImgs.length - 1
      ? selectImgs[0]
      : selectImgs[currentIndex + 1];
  mainImg.src = selectedImg.src;
  selectedImg.classList.add('selected');
});
const links = document.querySelectorAll("a[href='#']");
links.forEach(link => {
  link.addEventListener('click', e => {
    e.preventDefault();
  });
});

  function movieLike(movieCd){  
	let query = {
		movieCd : movieCd
	};
	$.ajax({
		type : "post",
		url : "memberMovieLike.do",
		data : query,
		success : function(data) {
			if(${like}){
				swal("좋아요!","해당 영화를 좋아요 했습니다.","success")
				.then(function(){               
					location.href = "${ctx}/movieContentView.do?movieCd=${vo.movieCd}"
				});				
			}else{
				swal("좋아요 취소!","해당 영화의 좋아요를 취소 했습니다.","success")
				.then(function(){               
					location.href = "${ctx}/movieContentView.do?movieCd=${vo.movieCd}"
				});		
			}
		}
	})	

}
  function movieSeen(movieCd){  
		let query = {
			movieCd : movieCd
		};
		$.ajax({
			type : "post",
			url : "memberMovieSeen.do",
			data : query,
			success : function(data) {
				if(${seen}){
					swal("봤어요!","해당 영화를 봤어요 했습니다.","success")
					.then(function(){               
						location.href = "${ctx}/movieContentView.do?movieCd=${vo.movieCd}"
					});					
				}else{
					swal("봤어요 취소!","해당 영화의 봤어요를 취소 했습니다.","success")
					.then(function(){               
						location.href = "${ctx}/movieContentView.do?movieCd=${vo.movieCd}"
					});	
				}
			}
		})	

	}
  
  function preview(movieCd){
	  console.log(movieCd);
	  const movieUrl = "https://api.themoviedb.org/3/movie/"+movieCd+"/videos?api_key=a699dda4efd374eb3d9a01da4dacc267";
      fetch(movieUrl)
          .then(res => res.json())
          .then(function(res){
              let output = "";
              
              if(res.results.length > 0){
                  const youtubeId = res.results[0].key;//첫번재 영상만 사용하기 하자. 값이 없을 경우도 있음.
                  output = `<iframe width="100%" height="100%" src="https://www.youtube.com/embed/${youtubeId}?autoplay=1"></iframe>`; 
              } else {
                  output = `<h3 class="noVideo">재생할 예고편이 없습니다.</h3>`;
                  console.log(output);
              }
              
              youtube.innerHTML = output;
              overlay.classList.add("show");
              
              overlay.setAttribute("style", `background-image: url(${posterImage}); background-size: auto; background-repeat: no-repeat;`)
              //배경 body 스크롤 중지
              document.body.classList.add("stop-scrolling");
          })
  } 

</script>
</html>