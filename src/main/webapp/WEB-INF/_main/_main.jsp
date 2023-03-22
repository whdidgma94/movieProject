<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
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
			<div class="col-md-6">
				<h2 class="text-center">현재 상영작</h2>
				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <c:forEach items="${movieList}" var="movie" varStatus="status">
				    <c:if test="${status.index == 0}">
				    	<div class="carousel-item active">
				    </c:if>
				    <c:if test="${status.index != 0}">
				    	<div class="carousel-item">
				    </c:if>
				      <img src="https://image.tmdb.org/t/p/original${movie.poster_path}" 
				      style="object-fit: contain; max-height: 78vh; cursor: pointer;" 
				      onclick="showModal(${movie.movieCd})" class="d-block w-100" alt="...">
				    </div>
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
