<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script>
    var selectedMovieCd = "all";
    $(document).ready(function() {
      var movieCdElement = $("select[name='reviewSelect']");
      if (movieCdElement) {
    	  movieCdElement.change(function() {
    		    var movieCd = $(this).val();
    		    selectedMovieCd = movieCd;
    		    showReviews(selectedMovieCd);
    		});
      }
      showReviews(selectedMovieCd);
    });
    function showReviews(selectedMovieCd) {
    	  $.ajax({
    	    url: "${ctx}/getReviews.do",
    	    type: "GET",
    	    data: {
    	      movieCd: selectedMovieCd
    	    },
    	    success: function(res) {
    	    	var list = JSON.parse(res).reviewList;
    	    	  var cardsDiv = document.getElementById("cards");
    	    	  cardsDiv.innerHTML = "";   	    	  
    	    	  var reviewList = [];
    	    	  for(let i = 0 ; i < list.length;i++){
	                		reviewList.push({
	    	    	          movieCd: list[i].movieCd,
	    	    	          grade: list[i].grade,
	    	    	          contents: list[i].contents
	    	    	    	});
    	    	  }
    	    	  for (var i = 0; i < reviewList.length; i++) {
    	    	    var review = reviewList[i];
    	    	    var cardHtml = "<div class='card mb-3'><div class='card-body'>";
    	    	    cardHtml += "<h5 class='card-title'>" +review.movieCd + "</h5>";
    	    	    cardHtml += "<h6 class='card-subtitle mb-2 text-muted'>&#9733;" + review.grade + "</h6>";
    	    	    cardHtml += "<p class='card-text'>" + review.contents + "</p>";
    	    	    cardHtml += "</div></div>";
    	    	    cardsDiv.innerHTML += cardHtml;
    	    	  }
    	    	},
    	    error: function(xhr, status, error) {
    	      console.log("Error: " + error);
    	    }
    	  });
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
       			<select class="form-control" id="movieCd" name="reviewSelect">
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