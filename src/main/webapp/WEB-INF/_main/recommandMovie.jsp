<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body class="mainView">
	<div class="container">
	<c:if test="${genreMap eq null}">
		<h1>영화 목록</h1>
	</c:if>
	<c:if test="${genreMap ne null}">
		<h1>${log }님의선호영화</h1>
	</c:if>
		<div class="row">
			<c:if test="${genreMap ne null }">
				<c:forEach items="${genreMap}" var="map">
					<div class="col-md-3 col-sm-6 mb-4">
						<div class="card" style="height: 600px; cursor: pointer;"
							onclick="showModal(${map.value.movieCd})">
							<img
								src="https://image.tmdb.org/t/p/original${map.value.poster_path}"
								class="card-img-top" alt="${map.value.movieNm} 포스터">
							<div class="card-body">
								<h5 class="card-title">${map.value.movieNm}</h5>
								<p class="card-text">${map.value.genreNm}</p>
								<p class="card-text">${map.value.openDt}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>
