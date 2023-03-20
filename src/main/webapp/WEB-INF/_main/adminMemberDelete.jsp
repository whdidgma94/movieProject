<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.4/dist/sweetalert2.min.js"></script>

<body>
	<div class="container">
		<h1 class="text-center my-5">회원 삭제</h1>
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
							<button class="btn btn-danger mt-3 delete-button" onclick="deleteBtn(${member.memberNo})">회원 삭제</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
	function deleteBtn(memberNo){
		swal.fire({
			title: "정말 삭제하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor:"#DD6B55",
			confirmButtonText: "네",
			cancelButtonText: "아니요",
			allowEnterKey: false
		}).then((result) =>{
			if (result.isConfirmed) {
				$.ajax({
					url: "${ctx}/adminMemberDelete.do",
					method: "POST",
					data: {
						memberNo: memberNo
					},
					success: function() {
						new swal("삭제완료.", "회원 삭제가 완료되었습니다", "success")
						.then(function(){
							location.reload();
						});
					},
					error: function() {
						swal("회원 삭제에 실패하였습니다.", "", "error");
					}
				});
			}
		});
	}	
	</script>
</body>
</html>
