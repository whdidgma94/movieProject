<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
	<div class="container">
		<h1 class="text-center my-5">공지삭제</h1>
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
							<button class="btn btn-secondary mt-3" onclick="deleteNotice(${notice.noticeNo})"> 삭제하기 </button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<script>
		function deleteNotice(noticeNo) {
			$.ajax({
				url: "${ctx}/noticeRemove.do",
				type: "POST",
				data: {noticeNo: noticeNo},
				success: function(result) {
					location.reload();
				},
				error: function(xhr, status, error) {
					alert("공지 삭제 중 오류가 발생했습니다.");
				}
			});
		}
	</script>
</body>
</html>
