<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	font-family: sans-serif;
	margin: 0;
	padding: 0;
	height: 100vh;
	background-color: #f5f5f5;
}

main {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #fff;
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

/* 제목 */
h2 {
	margin: 0;
	margin-bottom: 20px;
}

/* 선택 이미지 리스트 */
.select-img {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-left: 20px;
}

/* 선택 이미지 리스트 내부 */
.select-img img {
	height: 100px;
	width: 100px;
	margin-bottom: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

/* 선택 이미지 리스트 내부 :hover 상태 */
.select-img img:hover {
	opacity: 0.7;
}

/* 페이지 이동 버튼 */
.pagination {
	margin-top: 0;
	margin-bottom: 0;
}

/* 페이지 이동 버튼 활성화 */
.pagination .active a {
	background-color: #007bff;
	border-color: #007bff;
}

/* 찜하기/봤어요 버튼 */
.btns {
	margin-top: 20px;
	margin-bottom: 20px;
}

.btn-primary {
	margin-right: 10px;
}

/* 테이블 레이아웃 */
.table-wrapper {
	width: 100%;
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
</style>
<body>
	<main>
		<h2>${vo.movieNm }</h2>

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
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only preBtn">Previous</span>

					</a></li>

					<c:forEach var="image" items="${imageList }" varStatus="status"
						begin="0" end="9">
						<li class="page-item" style="margin-top: 10px"><img
							class="page-link" alt=""
							src="https://image.tmdb.org/t/p/original${image }"
							style="height: 100px; width: 100px"></li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only nextBtn">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
		<c:if test="${log ne null}">
		<div class="btns">
			<c:if test="${like}">
			<button class="btn btn-primary" onclick="movieLike(${vo.movieCd})">좋아요</button>
			</c:if>
			<c:if test="${not like}">
			<button class="btn btn-danger" onclick="movieLike(${vo.movieCd})">좋아요 취소</button>
			</c:if>	
			<c:if test="${seen}">
			<button class="btn btn-primary" onclick="movieSeen(${vo.movieCd})">봤어요</button>
			</c:if>
			<c:if test="${not seen}">
			<button class="btn btn-danger" onclick="movieSeen(${vo.movieCd})">봤어요 취소</button>
			</c:if>			
		</div>		
		</c:if>
		<div class="table-wrapper">
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
			</table>
		</div>
	</main>
</body>

<script>
  const selectImgs = document.querySelectorAll('.select-img img');
  const mainImg = document.querySelector('.main-img img');
  const preBtn = document.querySelector('.preBtn');
  const nextBtn = document.querySelector('.nextBtn');
  let index = 0;
  selectImgs.forEach(img => {
    img.addEventListener('click', () => {
      mainImg.src = img.src;
    });
  });
  const lastIndex = selectImgs.length - 1;

  preBtn.addEventListener('click', () => {
    index = index === 0 ? lastIndex : index - 1;
    mainImg.src = selectImgs[index].src;
  });

  nextBtn.addEventListener('click', () => {
    index = index === lastIndex ? 0 : index + 1;
    mainImg.src = selectImgs[index].src;
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
</script>
</html>