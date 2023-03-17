<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
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
		   	                      movieNm: "${movie.movieNm}"
		    	               });
    	    	  			}
    	    	  		}
	           	  </c:forEach>  
    	          }

    	    	  for (var i = 0; i < reviewList.length; i++) {
    	    	    var review = reviewList[i];
    	    	    var cardHtml = "<div class='card mb-3'><div class='card-body'>";
    	    	    cardHtml += "<h5 class='card-title'>" +review.movieNm + "</h5>";
    	    	    cardHtml += "<h6 class='card-subtitle mb-2 text-muted'>&#9733;" + review.grade + "</h6>";
    	    	    cardHtml += "<p class='card-text'>" + review.contents + "</p>";
    	    	    cardHtml += "<button onclick='removeReview("+review.reviewNm+")'>삭제하기</button>";
    	    	    cardHtml += "</div></div>";
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
<body>
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