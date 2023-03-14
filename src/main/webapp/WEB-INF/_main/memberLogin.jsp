<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<body>
	<h1>로그인</h1>
	<form action="${ctx}/memberLogin.do" method="post">
	<table class="table table-bordered">
	<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
	<tr><td colspan="2"><input type="button" value="로그인" onclick="loginCheck()"></td></tr>
	</table>
	</form>
	<script>
	let status = true;
	function loginCheck(){
		checkIt();
		if (status) {
			let query = {
				id : $("input[name=id]").val(),
				pw : $("input[name=pw]").val()
			};
			$.ajax({
				type : "POST",
				url : "memberLogin.do",
				data : query,
				success : function(data) {
					if(data == 1){
						//alert("로그인성공");
						swal('로그인 성공!', $("input[name=id]").val()+"님 로그인되었습니다.", 'success')
						.then(function(){               
							location.href = "_main.do";
						});
					}else {
						swal('로그인 실패','아이디와 비밀번호를 확인해주세요','error');
						$("input[name=id]").val("");
						$("input[name=pw]").val("");
					}	
				}
			});
		}
	}
	function checkIt() {
		status = true;
		if (!$.trim($("input[name=id]").val())) {
			swal('입력 오류','아이디를 입력해 주세요','error');
			$("input[name=id]").focus();
			status = false;
			return false;
		}
		else if (!$.trim($("input[name=pw]").val())) {
			swal('입력 오류','비밀번호를 입력해 주세요','error');
			$("input[name=pw]").focus();
			status = false;
			return false;
		}
	}
	</script>
</body>
</html>