<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
.card:hover {
  transform: scale(1.0);
  background-color: #f7f7f7;
}
</style>
<body class="mainView">
	<div class="container">
		<h1 class="text-center my-5">회원 목록</h1>
		<div class="row">
			<c:forEach items="${memberList}" var="member">
				<div class="col-md-6">
					<div class="card mb-4">
						<div class="card-body">
							<h5 class="card-title">${member.memberName}</h5>
							<p class="card-text">아이디 : ${member.id}</p>
							<p class="card-text">생년월일 : ${member.birthDay}</p>
							<p class="card-text">주소 : ${member.address}</p>
							<p class="card-text">이메일 : ${member.email}</p>
							<p class="card-text">좋아하는 장르 : ${member.favoriteGenre}</p>
							<p class="card-text">성별 : ${member.gender}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
