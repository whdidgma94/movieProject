<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
.card:hover {
  transform: scale(1.0);
  background-color: #f7f7f7;
}
</style>
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
    	          for (let i = 0; i < list.length; i++) {	              
    	    	  <c:forEach items="${movieList}" var="movie">
    	    	  		if(${movie.movieCd}==list[i].movieCd){
    	               reviewList.push({
   	                      movieCd: list[i].movieCd,
   	                      grade: list[i].grade,
   	                      contents: list[i].contents,
   	                      movieNm: "${movie.movieNm}",
   	                      writerId: list[i].writerId,
   	                      movieImg: "${movie.poster_path}"
    	               });
    	    	  		}
	           	  </c:forEach>  
    	          }

    	          for (var i = 0; i < reviewList.length; i++) {
    	        	  var review = reviewList[i];
    	        	  var cardHtml = "<div class='card mb-3' onclick='showModal("+review.movieCd+")'><div class='card-body'>";
    	        	  cardHtml += "<div class='row'><div class='col-3'>";
    	        	  cardHtml += "<img src=\"https:\/\/image.tmdb.org/t/p/original"+review.movieImg+"\" style=\"width: 100px; height: auto;\" alt=\"...\">";
    	        	  cardHtml += "</div><div class='col-9'>";
    	        	  cardHtml += "<h5 class='card-title'>" +review.movieNm + "</h5>";
    	        	  cardHtml += "<h6 class='card-subtitle mb-2 text-muted'>&#9733;" + review.grade + "</h6>";
    	        	  cardHtml += "<p class='card-text'>" + review.contents + "</p>";
    	        	  cardHtml += "<p class='card-text'> 작성자 : " + review.writerId + "</p>";
    	        	  cardHtml += "</div></div></div></div>";
    	        	  cardsDiv.innerHTML += cardHtml;
    	        	}
    	    	},
    	    error: function(xhr, status, error) {
    	      console.log("Error: " + error);
    	    }
    	  });
    	}
</script>
<body class="main">
	<div class="container">
		<h1 class="text-center my-5">TOP10 영화 리뷰</h1>	
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