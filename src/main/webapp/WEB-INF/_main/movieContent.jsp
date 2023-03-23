<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<body>
	<table class="table table-borderless">
		<tr>
			<td colspan="2"><img
				src="https://image.tmdb.org/t/p/original${vo.backdrop_path}"
				style="width: 400px; height: auto;"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${vo.movieNm}</td>
		</tr>
		<tr>
			<td>장르</td>
			<td>${vo.genreNm}</td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td>${vo.openDt}</td>
		</tr>
		<tr>
<<<<<<< Updated upstream
			<td colspan="2"><button class="btn btn-primary">자세히보기</button></td>
=======
			<td colspan="2"><button class="btn btn-primary" onclick="location.href='${ctx}/movieDetail.do'">자세히보기</button> </td>
>>>>>>> Stashed changes
		</tr>
	</table>
</body>
<script>
	$(".btn").click(function() {
		window.location.href = "${ctx}/movieContentView.do";
	})
</script>
</html>
