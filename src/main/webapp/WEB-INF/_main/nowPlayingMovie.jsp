<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<body class="mainView">
	<div class="container">
		<h1 class="text-center">현재 상영작</h1>
		<div class="row">
			<c:forEach items="${movieList}" var="movie">
				<div class="col-md-3 col-sm-6 mb-4">
					<div class="card" style="height: 600px; cursor: pointer;" onclick="showModal(${movie.movieCd})">
						<img src="https://image.tmdb.org/t/p/original${movie.poster_path}" class="card-img-top" alt="${movie.movieNm} 포스터">
						<div class="card-body">
							<h5 class="card-title">${movie.movieNm}</h5>
							<p class="card-text">${movie.genreNm}</p>
							<p class="card-text">${movie.openDt}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>