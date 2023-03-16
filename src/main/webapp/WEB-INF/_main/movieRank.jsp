<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<body>
<div></div>
	<h1>영화 순위</h1>
	<table>
		<tr>
			<td>순위</td>
			<td>영화 제목</td>
			<td>감독</td>
			<td>배우</td>
			<td>개봉일</td>
		</tr>
			<c:if test="${movieRankList ne null }">
				<c:forEach var="movieRankList" items="${movieRankList}" begin="0"
					end="${movieRankList.size() }" step="1" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${movieRankList.movieNm }</td>
						<td>${movieRankList.director}</td>
						<td>${movieRankList.actor}</td>
						<td>${movieRankList.openDt}</td>
					</tr>
				</c:forEach>
			</c:if>
	</table>
</body>
</html>
