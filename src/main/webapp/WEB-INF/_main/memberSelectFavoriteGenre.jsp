<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<link href="${ctx}/css/selectGenreStyle.css" rel="stylesheet" type="text/css">
<body class="selGenre">
	<h1>선호장르 선택</h1>
	<form action="${ctx}/memberGenreSelect.do" method="post">
		<table class="table table-bordered">
		<tr> 
			<td>
				<input type="checkbox" name="genre" value="드라마">드라마 &emsp;
				<input type="checkbox" name="genre" value="코미디">코미디 &emsp;
				<input type="checkbox" name="genre" value="액션">액션
			</td> 
		</tr>
		<tr> 
			<td>		
				<input type="checkbox" name="genre" value="멜로/로맨스">멜로 &emsp;
				<input type="checkbox" name="genre" value="스릴러">스릴러 &emsp;
				<input type="checkbox" name="genre" value="미스터리">미스터리
			</td> 
		</tr>
		<tr> 
			<td>	
				<input type="checkbox" name="genre" value="공포(호러)">공포(호러) &emsp;
				<input type="checkbox" name="genre" value="범죄">범죄 &emsp;
				<input type="checkbox" name="genre" value="가족">가족
			</td> 
		</tr>
		<tr> 
			<td>
				<input type="checkbox" name="genre" value="판타지">판타지 &emsp;
				<input type="checkbox" name="genre" value="SF">SF &emsp;
				<input type="checkbox" name="genre" value="서부극(웨스턴)">서부극(웨스턴)
			</td> 
		</tr>
		<tr> 
			<td>
				<input type="checkbox" name="genre" value="사극">사극 &emsp;
				<input type="checkbox" name="genre" value="애니메이션">애니메이션 &emsp;
				<input type="checkbox" name="genre" value="다큐멘터리">다큐멘터리
			</td> 
		</tr>
		<tr> 
			<td>
				<input type="checkbox" name="genre" value="전쟁">전쟁 &emsp;
				<input type="checkbox" name="genre" value="뮤지컬">뮤지컬 &emsp;
				<input type="checkbox" name="genre" value="성인물(에로)">성인물(에로)
			</td> 
		</tr>
		<tr> 
			<td>
				<input type="checkbox" name="genre" value="공연">공연 &emsp;
				<input type="checkbox" name="genre" value="기타">기타
			</td> 
		</tr>
		</table>
		<button>선택완료</button>
	</form>
	<script>
	const checkboxes = document.querySelectorAll('input[name="genre"]');
	const maxChecked = 3;

	for (let i = 0; i < checkboxes.length; i++) {
	  checkboxes[i].addEventListener('change', function() {
	    const checkedCount = document.querySelectorAll('input[name="genre"]:checked').length;

	    if (checkedCount > maxChecked) {
	      this.checked = false;
	      swal('입력 오류','최대 3종류의 장르만 선택 할 수 있습니다','error');
	    }
	  });
	}
	</script>
</body>
</html>