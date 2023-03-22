<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<table class="table">
		<tr>
			<td><c:forEach items="${imageList}"	var="image">
					<img src="https://image.tmdb.org/t/p/original${image}"
						style="width: 100px; height: 150px;" alt="">
				</c:forEach></td>
		</tr>
		<tr>
			<td style="cursor: pointer;" class="content" id="${vo.movieCd}">${vo.movieNm}</td>
		</tr>
		<tr>
			<td>${vo.genreNm}</td>
		</tr>
		<tr>
			<td colspan="24">${vo.openDt}</td>
		</tr>
		<tr>
			<td><button>찜하기</button>
				<button>봤어요</button></td>
		</tr>
	</table>
</body>
</html>