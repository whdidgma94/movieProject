<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<style>
.card:hover {
	transform: scale(1.0);
	background-color: #f7f7f7;
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
      var movieCdElement = $("select[name='reviewSelectMovie']");
      if (movieCdElement) {
    	  movieCdElement.change(function() {
    		    var movieCd = $(this).val();
    		    selectedMovieCd = movieCd;
    		    showReviewsMovie(selectedMovieCd);
    		});
      }
    });
    $(document).ready(function() {
        var memberIdElement = $("select[name='reviewSelectMember']");
        if (memberIdElement) {
      	  memberIdElement.change(function() {
      		    var memberId = $(this).val();
      		    selectedMemberId = memberId;
      		    showReviewsMember(selectedMemberId);
      		});
        }
      });
    function showReviewsMember(selectedMemberId) {
  	  $.ajax({
  	    url: "${ctx}/getReviews.do",
  	    type: "GET",
  	    data: {
  	      memberId: selectedMemberId
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
  	            	 	  reviewNm: list[i].boardNo,
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
  	        	  cardHtml += "<p class='card-text'> 작성자 : " + review.writerId + "</p>";
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
    function showReviewsMovie(selectedMovieCd) {
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
  	            		  reviewNm: list[i].boardNo,
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
  	        	  var cardHtml = "<div class='card mb-3'><div class='card-body'>";
  	        	  cardHtml += "<div class='row'><div class='col-3'>";
  	        	  cardHtml += "<img src=\"https:\/\/image.tmdb.org/t/p/original"+review.movieImg+"\" style=\"width: 100px; height: auto;\" alt=\"...\">";
  	        	  cardHtml += "</div><div class='col-9'>";
  	        	  cardHtml += "<h5 class='card-title'>" +review.movieNm + "</h5>";
  	        	  cardHtml += "<h6 class='card-subtitle mb-2 text-muted'>&#9733;" + review.grade + "</h6>";
  	        	  cardHtml += "<p class='card-text'>" + review.contents + "</p>";
  	        	  cardHtml += "<p class='card-text'> 작성자 : " + review.writerId + "</p>";
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
					location.reload();
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
		<h1 class="my-4 text-center">리뷰 관리</h1>
		<div class="row mb-4">
			<div class="col-sm-6">
				<select class="form-control" id="movieCd" name="reviewSelectMovie">
					<option value="all">영화별 리뷰</option>
					<c:forEach items="${movieList}" var="movie">
						<option value="${movie.movieCd}"
							${movie.movieCd == selectedMovieCd ? "selected" : ""}>${movie.movieNm}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-6">
				<select class="form-control" id="member" name="reviewSelectMember">
					<option value="all">사용자별 리뷰</option>
					<c:forEach items="${memberList}" var="member">
						<option value="${member.id}"
							${member.id == selectedMemberId ? "selected" : ""}>${member.memberName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div id="cards"></div>
	</div>
</body>
</html>
