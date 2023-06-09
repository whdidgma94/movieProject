<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<style>
.card:hover {
	transform: scale(1.0);
	background-color: #f7f7f7;
	transition: transform 0.5s;
}

.fa-star.half, .fa-star.checked.half {
	color: #f7d400;
	font-size: 24px;
}

.grade {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	color: #777;
}

.rating-text {
	margin-left: 10px;
}
</style>
<script>
    var selectedMovieCd = "all";
    $(document).ready(function() {
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
    	    	  			if(list[i].writerId == "${log}"){
		    	               reviewList.push({
		    	            	  reviewNm: list[i].boardNo,
		   	                      movieCd: list[i].movieCd,
		   	                      grade: list[i].grade,
		   	                      contents: list[i].contents,
		   	                      movieNm: "${movie.movieNm}",
		   	                      movieImg: "${movie.poster_path}"
		    	               });
    	    	  			}
    	    	  		}
	           	  </c:forEach>  
    	          }

    	    	  for (var i = 0; i < reviewList.length; i++) {
    	        	  var review = reviewList[i];
    	        	  var cardHtml = "<div class='card mb-3'><div class='card-body'>";
    	        	  cardHtml += "<div class='row'><div class='col-3'>";
    	        	  cardHtml += "<img src=\"https:\/\/image.tmdb.org/t/p/original"+review.movieImg+"\" style=\"width: 100px; height: auto;\" alt=\"...\">";
    	        	  cardHtml += "</div><div class='col-9'>";
    	        	  cardHtml += "<h5 class='card-title'>" +review.movieNm + "</h5>";
    	        	  cardHtml += "<div class='grade'>";
      	    	    for(var j = 0; j <5;j++ ){
      	    	    	if(review.grade>j){
      	    	   			cardHtml += "<span class='fa fa-star checked half'></span>"
      	    	    	}else{
      	    	    		cardHtml += "<span class='fa fa-star'></span>"
      	    	    	}
      	    	    }
      	    	    cardHtml += "<span class='rating-text'>평점:"
      					+review.grade+"점</span></div>"
    	        	  cardHtml += "<p class='card-text'>" + review.contents + "</p>";
    	    	    cardHtml += "<button class='btn btn-danger' onclick='removeReview("+review.reviewNm+")'>삭제하기</button>";
    	        	  cardHtml += "</div></div></div></div>";
    	        	  cardsDiv.innerHTML += cardHtml;
    	        	}
    	    	},
    	    error: function(xhr, status, error) {
    	      console.log("Error: " + error);
    	    }
    	  });
    	}
    function removeReview(reviewNm){
    	$.ajax({
    	    url: "${ctx}/movieReviewRemove.do",
    	    type: "GET",
    	    data: {
    	      reviewNm: reviewNm
    	    },
    	    success: function(res) {
    	    	swal('리뷰 삭제 성공!', "", 'success')
				.then(function(){               
 	   	    		showReviews(selectedMovieCd);
				});
    	    }
    	    ,error: function(xhr, status, error) {
    	      console.log("Error: " + error);
    	    }
    	  });
    }
</script>
<body class="mainView">
	<div class="container">
		<h1 class="text-center my-5">내가 작성한 리뷰</h1>
		<div class="row my-5">
			<div class="col-12">
				<div id="cards"></div>
			</div>
		</div>
	</div>
</body>
</html>