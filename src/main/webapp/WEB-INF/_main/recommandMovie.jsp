<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link href="${ctx}/css/movieContentStyle.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
	<c:if test="${genreMap eq null}">
		<h1>영화 목록</h1>
	</c:if>
	<c:if test="${genreMap ne null}">
		<h1>${log }님의선호영화</h1>
	</c:if>
	<br>
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="movieInfo"></p>
		</div>
	</div>

	<table>
		<tr>
			<td colspan="2">영화 제목</td>
			<td>장르</td>
			<td>감독</td>
			<td>출연진</td>
			<td colspan="2">개봉일</td>
			<td></td>
		</tr>
		<c:if test="${genreMap ne null }">
			<c:forEach var="genreMap" items="${genreMap}" begin="0"
				end="${genreMap.size()}" varStatus="status">
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
				<tr>
					<td><img style="cursor: pointer;"
						id="${genreMap.value.movieCd }" class="content" alt=""
						src="${imgList.get(status.index) }"></td>
					<td style="cursor: pointer;" class="content"
						id="${genreMap.value.movieCd }">${genreMap.value.movieNm }</td>
					<td>${genreMap.value.genreNm }</td>
					<td>${genreMap.value.director}</td>
					<td>${genreMap.value.actor}</td>
					<td colspan="2">${genreMap.value.openDt}</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

<script type="text/javascript">
	
	$(document).ready(function() {
	  $(".content").click(function() {
	    var movieCd = $(this).attr('id');
	    $.ajax({
	      type: "GET",
	      url: "movieContent.do?movieCd=" + movieCd,
	      success: function(data) {
	        $("#movieInfo").html(data);
	        $("#modal").show();
	      },
	      error: function() {
	        alert("Error");
	      }
	    });
	  });
	  $(".close").click(function() {
	    $("#modal").hide();
	  });
	  window.addEventListener("click", function(event) {
		  if (event.target == modal) {
			  $("#modal").hide();
		  }
		});
	});

</script>
</body>
</html>
