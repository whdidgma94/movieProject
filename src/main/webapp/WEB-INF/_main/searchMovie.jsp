<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<body>
	<div class="search">
		<input type="text" id="search" placeholder="입력"> <img
			src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
			id="searchImg">
	</div>
	<table>
		<c:if test="${searchList eq null }">
			<tr>
				<td colspan="3" id="result"></td>
			</tr>
			<hr>
		</c:if>
		<c:if test="${searchList ne null }">
			<c:forEach var="searchList" items="${searchList}" begin="0"
				end="${searchList.size() }" step="1" varStatus="status">
				<c:if test="${(status.index)%3 eq 0}">
					<tr>
				</c:if>
				<td id="searchList"><img alt="" id="${searchList.movieCd}"
					src="${ctx }/img/logo.png" /><br /> <strong>${searchList.movieNm  }</strong></td>
				<c:if test="${(status.index)%3 eq 2}">
					</tr>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<script>
		const searchInput = $('#search');

		$("#searchImg").click(function() {
			const query = searchInput.val();
			$.ajax({
				type : "POST",
				url : "${ctx}/searchViewMovie.do",
				data : {
					inputVal : searchInput.val()
				},
				success : function(response) {
					if (response == null) {
						$("#result").text("일치하는 결과가 없습니다");
					} else {
						history.go(0);
					}
					searchInput.val("");
				},
				error : function() {
					alert("error");
				}
			});
		});

		function handleSearch(event) {
			if (event.which === 13) {
				event.preventDefault();
				const query = searchInput.val();
				$.ajax({
					type : "POST",
					url : "${ctx}/searchViewMovie.do",
					data : {
						inputVal : searchInput.val()
					},
					success : function(response) {
						if (response == null) {
							$("#result").text("일치하는 결과가 없습니다");
						} else {
							history.go(0);
						}
						searchInput.val("");
					},
					error : function() {
						alert("error");
					}
				});
			}
		}

		searchInput.on('keydown', handleSearch);

		$("td#searchList>img").click(function() {
			alert("hi");
			var num = $(this).attr("id");
		})
	</script>
</body>
</html>
