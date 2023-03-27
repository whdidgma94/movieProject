<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<body class="mainView">
	<div class="container">
		<div class="row">
			<div class="col-md-6 border-right">
				<h2 class="text-center">좋아요</h2>
				<div class="row">
					<c:forEach items="${movieList}" var="movie">
						<c:forEach items="${likeList}" var="like">
							<c:if test="${movie.movieCd == like}">
								<div class="col-md-6 col-sm-6 mb-4">
									<div class="card" style="height: 600px; cursor: pointer;"
										onclick="showModal(${movie.movieCd})">
										<img
											src="https://image.tmdb.org/t/p/original${movie.poster_path}"
											class="card-img-top" alt="${movie.movieNm} 포스터">
										<div class="card-body">
											<h5 class="card-title">${movie.movieNm}</h5>
											<p class="card-text">${movie.genreNm}</p>
											<p class="card-text">${movie.openDt}</p>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<h2 class="text-center">봤어요</h2>
				<div class="row">
					<c:forEach items="${movieList}" var="movie">
						<c:forEach items="${seenList}" var="seen">
							<c:if test="${movie.movieCd == seen}">
								<div class="col-md-6 col-sm-6 mb-4">
									<div class="card" style="height: 600px; cursor: pointer;"
										onclick="showModal(${movie.movieCd})">
										<img
											src="https://image.tmdb.org/t/p/original${movie.poster_path}"
											class="card-img-top" alt="${movie.movieNm} 포스터">
										<div class="card-body">
											<h5 class="card-title">${movie.movieNm}</h5>
											<p class="card-text">${movie.genreNm}</p>
											<p class="card-text">${movie.openDt}</p>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
console.log(${likeList});
console.log(${seenList});
</script>
</html>