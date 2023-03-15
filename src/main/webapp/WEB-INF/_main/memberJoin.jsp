<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<h1>회원가입</h1>
	<form action="${ctx}/memberJoin.do" method="post" id="form">
	<table class="table table-bordered">
		<tr><td>아이디</td><td><input type="text" name="id" onchange="idChange()">&emsp;<input type="button" value="중복확인" onclick="idCheck()" id="checkBtn"></td></tr>
		<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
		<tr><td>이름</td><td><input type="text" name="memberName"></td></tr>
		<tr><td>생년월일</td> <td><input type="date" name="birthDay" id="today" size="15"></td> </tr>
		<tr> <td>주소</td>
			<td>
				<input type="text" id="postcode" placeholder="우편번호" readonly>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="checkBtn"><br>
				<input type="text" id="roadAddress" placeholder="도로명주소" name="address1" readonly>
				<input type="text" id="jibunAddress" placeholder="지번주소" readonly>
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" placeholder="상세주소" name="address2">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
			  <div class="email-wrapper">
			    <input type="text" name="email_id" value="" placeholder="이메일"/> @ 
			    <input type="text" name="email_domain" value="" placeholder="도메인"/> 
			    <select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
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
			</tr>
		<tr><td>성별</td><td><input type="radio" name="gender" value="남자" checked>남자 &emsp;<input type="radio" name="gender" value="여자">여자
	</td></tr>
	<tr><td colspan="2"><input type="button" onclick="joinBtn()" value="회원가입"></td></tr>
	</table>
	</form>
	<script>
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
		let confirmed=false;
		function idChange(){
			confirmed=false;
		}
		window.addEventListener("load",()=>{
			setRday();
		});
			
		function setRday(){
	    	var now = new Date().toISOString().substring(0, 10);
	    	document.getElementById("today").setAttribute("max", now);
		}
		function idCheck(){
			if ($("input[name=id]").val()) {
				let query = {
					id : $("input[name=id]").val()
				};
				$.ajax({
					type : "post",
					url : "memberIdConfirm.do",
					data : query,
					success : function(data) {
						if (data == "false") {
							swal('중복체크','이미 존재하는 아이디 입니다','error');
							 $("input[name=id]").val('');
							 confirmed=false;
						} else {
							swal('중복체크','사용 가능한 아이디 입니다','success');
							confirmed=true;
							$("input[name=pw]").focus();
						}
					}
				})	
			}else{
				swal('입력오류','아이디를 입력해 주세요','error');
			}
		}
		function check(){
			if(!confirmed){
				swal('오류','아이디 중복확인을 해 주세요','error');
				return false;
			}
			if($("input[name=id]").val()==""){
				swal('입력오류','아이디를 입력해 주세요','error');
				return false;
			}
			if($("input[name=pw]").val()==""){
				swal('입력오류','비밀번호를 입력해 주세요','error');
				return false;
			}
			if($("input[name=memberName]").val()==""){
				swal('입력오류','이름을 입력해 주세요','error');
				return false;
			}
			if($("input[name=birthDay]").val()==""){
				swal('입력오류','생년월일을 입력해 주세요','error');
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
			if($("input[name=phone]").val()==""){
				swal('입력오류','전화번호를 입력해 주세요','error');
				return false;
			}
			if($("input[name=address1]").val()==""){
				swal('입력오류','주소를 입력해 주세요','error');
				return false;
			}
			if($("input[name=address2]").val()==""){
				swal('입력오류','상세주소를 입력해 주세요','error');
				return false;
			}
			
			return true;
		}
		function joinBtn(){
			if(check()){
				swal('가입 완료!','회원가입이 완료 되었습니다','success')
				.then(function(){		
					$("#form").submit();
				});
			}
		}
	</script>
</body>
</html>