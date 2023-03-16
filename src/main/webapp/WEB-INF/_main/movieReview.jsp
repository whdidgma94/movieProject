<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script>
    var selectedMovieCd = "all";
    window.addEventListener('DOMContentLoaded', function() {
    	var movieCdElement = document.querySelectorAll("select[name='movieCd']")[1];
    	if (movieCdElement) {
    		  movieCdElement.addEventListener("change", function() {
    		    var movieCd = this.value;
    		    selectedMovieCd = movieCd;
    		    console.log("selectedMovieCd:", selectedMovieCd);
    		    showReviews(selectedMovieCd);
    		  });
    		}
    });
    function showReviews(selectedMovieCd) {
    	  var reviews = ${sessionScope.reviewList};
    	  var filteredReviews = [];
    	  if (selectedMovieCd === "all") {
    	    filteredReviews = reviews;
    	  } else {
    	    for (var i = 0; i < reviews.length; i++) {
    	      if (reviews[i].movieCd === selectedMovieCd) {
    	        filteredReviews.push(reviews[i]);
    	      }
    	    }
    	  }
    	  var cardsDiv = document.getElementById("cards");
    	  cardsDiv.innerHTML = "";
    	  for (var i = 0; i < filteredReviews.length; i++) {
    	    var review = filteredReviews[i];
    	    var cardHtml = "<div class='card mb-3'><div class='card-body'>";
    	    cardHtml += "<h5 class='card-title'>" + review.movieNm + "</h5>";
    	    cardHtml += "<h6 class='card-subtitle mb-2 text-muted'>" + review.grade + "</h6>";
    	    cardHtml += "<p class='card-text'>" + review.contents + "</p>";
    	    cardHtml += "</div></div>";
    	    cardsDiv.innerHTML += cardHtml;
    	  }
    	}
</script>
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
				<label for="movieCd">영화선택&emsp;</label>
       			<select class="form-control" id="movieCd" name="movieCd">
       				<option value="all">모든영화</option>
		            <c:forEach items="${movieList}" var="movie">
		                <option value="${movie.movieCd}" ${movie.movieCd == selectedMovieCd ? "selected" : ""}>${movie.movieNm}</option>
		            </c:forEach>
      				</select>
      				<div id="cards"></div>
			</div>
		</div>
	</div>
</body>

</html>