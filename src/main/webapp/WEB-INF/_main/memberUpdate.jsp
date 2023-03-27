<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body class="mainView">
	<h1>개인정보 변경</h1>
	<form action="${ctx}/memberUpdate.do" method="post" id="form">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" value="${member.memberName}"
					name="memberName" /></td>
				<td></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" value="${member.pw}" name="pw" /></td>
				<td></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<div id="currentAddress">${member.address}</div>
					<div id="addressForm" style="display: none;">
						<input type="text" id="postcode" placeholder="우편번호" readonly>
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
							id="checkBtn"><br> <input type="text"
							id="roadAddress" placeholder="도로명주소" name="address1" readonly>
						<input type="text" id="jibunAddress" placeholder="지번주소" readonly>
						<span id="guide" style="color: #999; display: none"></span> <input
							type="text" id="detailAddress" placeholder="상세주소" name="address2">
					</div> <input type="button" onclick="showAddressForm()" value="주소변경"
					id="addressBtn">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<div class="email-wrapper">
						<input type="text" name="email_id" placeholder="이메일" /> @ <input
							type="text" name="email_domain" placeholder="도메인" /> <select
							class="select" title="이메일 도메인 주소 선택"
							onclick="setEmailDomain(this.value);return false;">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><input type="button" onclick="updateBtn()"
					value="변경"></td>
			</tr>
		</table>
	</form>
</body>
<script>
	let addressChange=false;
	function showAddressForm() {
	    document.getElementById('currentAddress').style.display = 'none';
	    document.getElementById('addressForm').style.display = 'block';
	    document.querySelector('#addressBtn').style.display = 'none';
	    addressChange=true;
	}
	 function setEmailDomain(domain){
	        $("input[name=email_domain]").val(domain);
	    }
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var roadAddr = data.roadAddress; 
	            var extraRoadAddr = '';
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("roadAddress").value = roadAddr;
	            document.getElementById("jibunAddress").value = data.jibunAddress;
	            
	            var guideTextBox = document.getElementById("guide");
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}
	function check(){
		if($("input[name=pw]").val()==""){
			swal('입력오류','비밀번호를 입력해 주세요','error');
			return false;
		}
		if($("input[name=memberName]").val()==""){
			swal('입력오류','이름을 입력해 주세요','error');
			return false;
		}
		if($("input[name=email_id]").val()==""){
			swal('입력오류','이메일을 입력해 주세요','error');
			return false;
		}
		if($("input[name=email_domain]").val()==""){
			swal('입력오류','이메일을 입력해 주세요','error');
			return false;
		}
		if(addressChange){
			if($("input[name=address1]").val()==""){
				swal('입력오류','주소를 입력해 주세요','error');
				return false;
			}
			if($("input[name=address2]").val()==""){
				swal('입력오류','상세주소를 입력해 주세요','error');
				return false;
			}			
		}
		return true;
	}
	function updateBtn(){
		if(check()){
			swal('개인정보 변경완료!','개인정보가 변경되었습니다.','success')
			.then(function(){		
				$("#form").submit();
			});
		}
	}
</script>
</html>