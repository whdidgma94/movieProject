<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>

<body class="mainView">
	<h1>공지 작성</h1>
	<c:if test="${sessionScope.log == 'admin'}">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8 mt-5">
					<form action="${ctx}/addNotice.do" method="post">
						<div class="form-group">
							<label for="contents">제목</label>
							<input type="text" name="title">
							</div>
						<div class="form-group">
							<label for="contents">내용</label>
							<textarea class="form-control" id="content" name="content" rows="10" style="resize:none;background-color:rgb(5, 37, 65);
	color:white;" required></textarea>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-primary" onclick="submitForm()">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</c:if>

	<script>
	function submitForm() {
		swal.fire({
			title: '등록하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: '등록',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				document.forms[0].submit();
			}
		});
	}
	</script>

</body>
</html>