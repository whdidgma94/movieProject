<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
.card:hover {
  transform: scale(1.0);
  background-color: gray;
}
.card-body:hover{
	background-color :gray;
}
</style>
<body class="mainView">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2 class="text-center">공지사항</h2>
				<div class="notice-scroll" style="height: 78vh">
					<c:forEach items="${noticeList}" var="notice">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="card-title">${notice.title}</h5>
								<p class="card-text">${notice.day}</p>
								<form action="${ctx}/noticeView.do" method="post">
									<button class="btn btn-primary" name="noticeNo" value="${notice.noticeNo}"> 자세히 보기</button>							
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:set var="firstNowPlayingMovie" value="" />
			<c:forEach items="${movieList}" var="movie">
			    <c:if test="${movie.subject == 'now_playing' and empty firstNowPlayingMovie}">
			        <c:set var="firstNowPlayingMovie" value="${movie.movieCd}" />
			    </c:if>
			</c:forEach>
			<div class="col-md-6">
				<h2 class="text-center">현재 상영작</h2>
				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <c:forEach items="${movieList}" var="movie" varStatus="status">
				    <c:if test="${movie.subject == 'now_playing'}">
				        <c:if test="${movie.movieCd == firstNowPlayingMovie}">
				          <div class="carousel-item active">
				        </c:if>
				        <c:if test="${movie.movieCd != firstNowPlayingMovie}">
				          <div class="carousel-item">
				        </c:if>
				          <img src="https://image.tmdb.org/t/p/original${movie.poster_path}" 
				               style="object-fit: contain; max-height: 75vh; cursor: pointer;" 
				               onclick="showModal(${movie.movieCd})" class="d-block w-100" alt="...">
				        </div>
				    </c:if>
				    </c:forEach>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
$(document).ready(function(){
  $('.carousel').carousel({
    interval: 2000 //2초마다 자동으로 슬라이드
  });
});
</script>
