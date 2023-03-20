<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link href="${ctx}/css/movieContentStyle.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<c:if test="${genreMap eq null}">
		<h1>영화 목록</h1>
	</c:if>
	<c:if test="${genreMap ne null}">
		<h1>${log }님의선호영화</h1>
	</c:if>
	<br>
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="movieInfo"></p>
		</div>
	</div>

	<table>
		<tr>
			<td colspan="2">영화 제목</td>
			<td>장르</td>
			<td>감독</td>
			<td>출연진</td>
			<td colspan="2">개봉일</td>
			<td></td>
		</tr>
		<c:if test="${genreMap ne null }">
			<c:forEach var="genreMap" items="${genreMap}" begin="0"
				end="${genreMap.size()}" varStatus="status">
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
				<tr>
					<td><img style="cursor: pointer;"
						id="${genreMap.value.movieCd }" class="content" alt=""
						src="${imgList.get(status.index) }"></td>
					<td style="cursor: pointer;" class="content"
						id="${genreMap.value.movieCd }">${genreMap.value.movieNm }</td>
					<td>${genreMap.value.genreNm }</td>
					<td>${genreMap.value.director}</td>
					<td>${genreMap.value.actor}</td>
					<td colspan="2">${genreMap.value.openDt}</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<script type="text/javascript">
		
	var modal = document.getElementById("modal");
	var modalContent = document.querySelector(".modal-content");
	var closeBtn = document.querySelector(".close");
	var movieInfo = document.getElementById("movieInfo");

	var imageElements = document.querySelectorAll(".content img");
	var titleElements = document.querySelectorAll(".content td:nth-child(2)");

	for (var i = 0; i < imageElements.length; i++) {
	  console.log("event listener added");
	  imageElements[i].addEventListener("click", showModal);
	  titleElements[i].addEventListener("click", showModal);
	}

	function showModal(event) {
	  var movieCd = event.currentTarget.parentElement.querySelector("td:nth-child(2)").id;
	  var movieNm = event.currentTarget.parentElement.querySelector("td:nth-child(2)").textContent;
	  var genreNm = event.currentTarget.parentElement.querySelector("td:nth-child(3)").textContent;
	  var director = event.currentTarget.parentElement.querySelector("td:nth-child(4)").textContent;
	  var actor = event.currentTarget.parentElement.querySelector("td:nth-child(5)").textContent;
	  var openDt = event.currentTarget.parentElement.querySelector("td:nth-child(6)").textContent;

	  var imgSrc = event.currentTarget.src;
	  movieInfo.innerHTML = `
	    <img src="${imgSrc}">
	    <h2>${movieNm}</h2>
	    <p><strong>장르:</strong> ${genreNm}</p>
	    <p><strong>감독:</strong> ${director}</p>
	    <p><strong>출연진:</strong> ${actor}</p>
	    <p><strong>개봉일:</strong> ${openDt}</p>
	  `;

	  modal.style.display = "block";
	}

	function closeModal() {
	  modal.style.display = "none";
	}

	window.addEventListener("click", function(event) {
	  if (event.target == modal) {
	    closeModal();
	  }
	});

	closeBtn.addEventListener("click", closeModal);

	</script>
</body>
</html>
