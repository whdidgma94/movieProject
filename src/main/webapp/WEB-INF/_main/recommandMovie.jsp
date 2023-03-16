<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<body>
	<c:if test="${genreMap eq null}">
		<h1>영화 목록</h1>
	</c:if>
	<c:if test="${genreMap ne null}">
		<h1>${log }님의선호영화</h1>
	</c:if>

	<table>
			<tr>
				<td>영화 제목</td>
				<td>장르</td>
				<td>감독</td>
				<td>출연진</td>
				<td>개봉일</td>
			</tr>
			<c:if test="${genreMap ne null }">
				<c:forEach var="genreMap" items="${genreMap}">
					<tr>
						<td colspan="5">
							<hr>
						</td>
					</tr>
					<tr>
						<td>${genreMap.value.movieNm }</td>
						<td>${genreMap.value.genreNm }</td>
						<td>${genreMap.value.director}</td>
						<td>${genreMap.value.actor}</td>
						<td>${genreMap.value.openDt}</td>
					</tr>
					<tr>
						<td colspan="5">
							<hr>
						</td>
					</tr>
		</c:forEach>
		</c:if>
	</table>
</body>
</html>
