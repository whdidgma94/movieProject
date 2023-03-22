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
		<h1>${log }님의 선호영화</h1>
	</c:if>
	<br>
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="movieInfo"></p>
		</div>
	</div>

</body>
</html>
