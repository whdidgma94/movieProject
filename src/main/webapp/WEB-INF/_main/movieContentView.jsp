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
	max-width: 100%;
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
	width: 50%;
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
	justify-content: flex-start;
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

.selected {
	border: none;
	filter: brightness(90%);
	transform: scale(1.2);
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
	justify-content: flex-start;
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
	/* 시작시 보이지 않게 처리 */
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* 오버레이를 보여 줄때 사용 */
#overlay.show {
	visibility: visible;
	opacity: 1;
}

#close {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 36px;
	margin: 0;
	padding: 0;
	cursor: pointer;
	margin: 8px auto;
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

.peopleList {
	display: flex;
	flex-wrap: nowrap;
	overflow-x: auto;
	max-width: 100%;
}

.peopleView {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 5px;
}

.btn-margin {
	margin-right: 10px
}
</style>
<body class="mainView">
	<main>
		<div style="display: flex; max-width: 100%">
			<div class="img-wrapper">
				<div class="main-img"
					style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<img
						style="width: 800px; height: 900px; margin-bottom: 20pxp; border-radius: 5px;"
						alt=""
						src="https://image.tmdb.org/t/p/original${imageList.get(0) }">
				</div>
				<div class="select-img" style="margin-top: 40px">
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
				<h2>
					<strong>${vo.movieNm }</strong>
				</h2>
				<div class="grade">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="rating-text">평점:
						${vo.grade}점</span>
				</div>


				<div class="btns">
					<c:if test="${like}">
						<button class="btn btn-primary "
							onclick="movieLike(${vo.movieCd})">좋아요</button>
					</c:if>
					<c:if test="${not like}">
						<button class="btn btn-danger btn-margin"
							onclick="movieLike(${vo.movieCd})">좋아요 취소</button>
					</c:if>
					<c:if test="${vo.subject != 'upcoming'}">
						<c:if test="${seen}">
							<button class="btn btn-primary"
								onclick="movieSeen(${vo.movieCd})">봤어요</button>
						</c:if>
						<c:if test="${not seen}">
							<button class="btn btn-danger btn-margin"
								onclick="movieSeen(${vo.movieCd})">봤어요 취소</button>
						</c:if>
					</c:if>
					<button class="btn btn-primary" onclick="preview(${vo.movieCd})">예고편
						보기</button>
				</div>
				<div>
					<span style="font-size: 20px;"><strong>${vo.genreNm }</strong></span>
					<hr>
				</div>
				<div>
					<span>${vo.overview }</span>
					<hr>
				</div>
				<span style="font-size: 30px;"><strong>감독</strong></span>
				<hr color="white" style="border: double;">
				<div class="peopleList" style="margin-bottom: 20px">
					<c:forEach var="director" items="${directorList}"
						varStatus="status">
						<div class="peopleView">
							<img width="150px" height="250px" alt=""
								src="https://image.tmdb.org/t/p/original${director.profile_path }">
							<span>${director.name }</span>
						</div>
					</c:forEach>
				</div>
				<span style="font-size: 30px;"><strong>출연</strong></span>
				<hr color="white" style="border: double;">
				<div class="peopleList" style="margin-bottom: 20px">
					<c:forEach var="actor" items="${actorList}" varStatus="status">
						<div class="peopleView">
							<img width="150px" height="250px" alt=""
								src="https://image.tmdb.org/t/p/original${actor.profile_path }">
							<span>${actor.name }</span> <span>${actor.charac } 역</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>
	<div id="overlay">
		<div class="youtube">
			<button id="close" onclick="closeVideo()"
				style="background-color: transparent; border: none; color: #999999; font-size: 24px; cursor: pointer;">&times;</button>

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
	  if (${log==null}) {
		    swal('권한 없음', '로그인 후 이용하세요', 'error').then(function() {
		      location.href = "${ctx}/memberLogin.do";
		    });
		    return;
		  } 
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
	  if (${log==null}) {
		    swal('권한 없음', '로그인 후 이용하세요', 'error').then(function() {
		      location.href = "${ctx}/memberLogin.do";
		    });
		    return;
		  } 
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
  let iframe = "";
  
  function preview(movieCd) {
	  $.ajax({
			type : "POST",
			url : "${ctx}/preview.do",
			data : {"movieCd" : movieCd},
			success : function(data) {
			 	  if (data.length > 0) {
				        let youtubeUrl = "https://www.youtube.com/embed/" + data;
				        iframe = document.createElement("iframe");
				    	iframe.width = "100%";
				    	iframe.height = "100%";
				    	iframe.src = youtubeUrl;
				    	iframe.title = "YouTube";
				    	iframe.frameborder = 0;
				    	iframe.allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture";
				    	iframe.allowfullscreen = true;
				    	iframe.classList.add("output");
				    	youtube.appendChild(iframe);
				      } else {
				        let output = document.createElement("h3");
				        output.innerHTML = "<strong>재생할 예고편이 없습니다.</strong>";
				        output.classList.add("noVideo");
				        output.classList.add("output");
				     	youtube.appendChild(output);
				      }
				      overlay.classList.add("show");
			},
			error : function() {
				alert("Error");
			}
		});	    
	  
	}
  function closeVideo() {
	  const children = youtube.childNodes;
	  for (let i = children.length - 1; i >= 0; i--) {
	    if (children[i].id !== "close") { 
	      youtube.removeChild(children[i]);
	    }
	  }
	  overlay.classList.remove("show");
	}



</script>
</html>