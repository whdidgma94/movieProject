<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
	<div class="container">
		<div class="row">
			<c:forEach items="${noticeList}" var="notice">
				<div class="col-md-12 mb-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${notice.title}</h5>
							<p class="card-text">${notice.day}</p>
							<form action="${ctx}/noticeView.do" method="post">
								<button class="btn btn-primary" name="noticeNo" value="${notice.noticeNo}"> 자세히 보기</button>							
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>