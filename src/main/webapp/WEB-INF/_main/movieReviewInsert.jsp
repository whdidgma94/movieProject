<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
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
</body>
</html>