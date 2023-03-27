<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<style>
table {
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	border-right: 1px solid #ddd;
}

.popup {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

.popup-inner {
	width: 300px;
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	text-align: center;
}

.popup h2 {
	margin-top: 0;
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

button {
	background-color: #4CAF50;
	border: none;
	border-radius: 10px;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<body class="mainView">
	<h1>마이페이지</h1>
	<c:if test="${not empty member}">
		<table>
			<tr>
				<th>이름</th>
				<td>${member.memberName}</td>
				<td></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${member.id}</td>
				<td></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${member.birthDay}</td>
				<td></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.address}</td>
				<td></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.email}</td>
				<td></td>
			</tr>
			<c:if test="${not empty member.favoriteGenre}">
				<tr>
					<th>선호 장르</th>
					<td>${member.favoriteGenre}</td>
					<td>
						<button onclick="showPopup('genre')">선호장르 변경</button>
					</td>
				</tr>
			</c:if>
			<tr>
				<th>성별</th>
				<td>${member.gender}</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">
					<button onclick="showPopup('profile')">개인정보 변경</button>
				</td>
			</tr>
		</table>
	</c:if>
</body>
<script>
	function showPopup(sel) {
	    swal({
	        title: "비밀번호를 입력하세요",
	        content: {
	            element: "input",
	            attributes: {
	                type: "password",
	            },
	        },
	        buttons: {
	            cancel: "취소",
	            confirm: "확인",
	        },
	    })
	    .then((value) => {
	    	if(value!=null){
	        	checkPw(value,sel);
	        }
	    });
	}
	
	function checkPw(pw,sel){
		$.ajax({
			url: "checkPassword.do",
			type: "POST",
			data: {
				password: pw
			},
			success: function(response) {
				if(response == 1){
					swal('','','success')
					.then(function(){
						if(sel=='genre'){
							location.href = "memberGenreSelect.do";
						}else if(sel=='profile'){
							location.href = "memberUpdate.do";
						}
					});
				}else{
					swal('입력오류','비밀번호를 확인해 주세요','error');
				}
			},
			error: function(xhr, status, error) {
				console.log("Ajax error:", error);
			}
		});
	}
</script>

</html>