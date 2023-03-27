<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body class="mainView">
<div class="container">
	<div class="row mt-3">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">${notice.title}</h5>
					<p class="card-text">${notice.content}</p>
					<p class="card-text"><small class="text-muted">${notice.day}</small></p>
				</div>
			</div>
			<a href="javascript:history.back()" class="btn btn-secondary mt-3">뒤로가기</a>
		</div>
	</div>
</div>
</body>
</html>
