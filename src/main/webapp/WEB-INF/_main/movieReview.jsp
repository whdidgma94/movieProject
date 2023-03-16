<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
	<div class="container">
		<h1 class="text-center my-5">영화 리뷰</h1>
		<c:if test="${not empty sessionScope.log}">
			<div class="row">
				<div class="col-12 col-md-8 offset-md-2">
	
					<form action="${ctx}/addReview.do" method="post">
						<div class="form-inline">
						    <div class="form-group mr-3">
						        <label for="movieCd">영화선택&emsp;</label>
						        <select class="form-control" id="movieCd" name="movieCd">
						            <c:forEach items="${movieList}" var="movie">
						                <option value="${movie.movieCd}">${movie.movieNm}</option>
						            </c:forEach>
						        </select>
						    </div>
						    <div class="form-group mr-3">
						        <label for="grade">평점&emsp;</label>
						        <select class="form-control" id="grade" name="grade" required>
						            <option value="">선택하세요</option>
						            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
									<option value="4">&#9733;&#9733;&#9733;&#9733;&#9734;</option>
									<option value="3">&#9733;&#9733;&#9733;&#9734;&#9734;</option>
									<option value="2">&#9733;&#9733;&#9734;&#9734;&#9734;</option>
									<option value="1">&#9733;&#9734;&#9734;&#9734;&#9734;</option>
						        </select>
						    </div>
						</div>
						<div class="form-group">
							<label for="contents">내용</label>
							<textarea class="form-control" id="contents" name="contents" rows="10" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
		</c:if>
		
		<div class="row my-5">
			<div class="col-12">
				<h3>${movieTitle} 리뷰</h3>
				<c:forEach var="review" items="${reviewList}">
					<div class="card my-3">
						<div class="card-header">${review.writerId}</div>
						<div class="card-body">
							<p class="card-text">${review.contents}</p>
							<p class="card-text">평점 : ${review.grade}</p>
						</div>
						<div class="card-footer text-muted">${review.regDate}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>