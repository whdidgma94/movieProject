<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style.css">
<body>
	<main>
	<h2>영화 제목</h2>
	<div class="img-wrapper">
		<div class="main-img"> <img alt="" src=""> </div>
		<div class="select-img"><img alt="" src=""><img alt="" src=""><img alt="" src=""></div>
	</div>
	<div class="btns">
		<button class="btn btn-primary">찜하기</button>
		<button class="btn btn-primary">봤어요</button>
	</div>
	<div class="table-wrapper">
		<table>
			<tr>
				<th>장르</th>
				<td>장르명</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>감독명</td>
			</tr>
			<tr>
				<th>출연</th>
				<td>출연진</td>
			</tr>
		</table>
	</div>
</main>
</body>
</html>