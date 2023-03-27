<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>

<body class="mainView">
	<h1>리뷰 작성</h1>
	<c:if test="${not empty sessionScope.log}">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8 mt-5">
					<div style="text-align: center;">봤어요 한 영화만 리뷰 작성이 가능 합니다</div>
					<form action="${ctx}/addReview.do" method="post">
						<div class="form-group">
							<label for="movieCd">영화선택</label> <select class="form-control"
								id="movieCd" name="movieCd">
								<c:forEach items="${movieList}" var="movie">
									<c:forEach items="${seenList}" var="seen">
										<c:if test="${movie.movieCd == seen}">
											<option value="${movie.movieCd}">${movie.movieNm}</option>
										</c:if>
									</c:forEach>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="grade">평점</label> <select class="form-control"
								id="grade" name="grade" required>
								<option value="">선택하세요</option>
								<option style="color: #f7d400;" value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
								<option style="color: #f7d400;" value="4">&#9733;&#9733;&#9733;&#9733;&#9734;</option>
								<option style="color: #f7d400;" value="3">&#9733;&#9733;&#9733;&#9734;&#9734;</option>
								<option style="color: #f7d400;" value="2">&#9733;&#9733;&#9734;&#9734;&#9734;</option>
								<option style="color: #f7d400;" value="1">&#9733;&#9734;&#9734;&#9734;&#9734;</option>
							</select>
						</div>
						<div class="form-group">
							<label for="contents">내용</label>
							<textarea class="form-control" id="contents" name="contents"
								rows="10" style="resize: none;" required></textarea>
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-primary"
								onclick="submitForm()">등록</button>
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