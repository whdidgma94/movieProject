<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<body>
	<div class="search">
		<input type="text" id="search" placeholder="입력"> <img
			src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
			id="searchImg">
	</div>
	<table class="table table-bordered">
		<tr>
		</tr>

	</table>
	<script>
		const searchInput = $('#search');
		const form = $('#form');

		$("#searchImg").click(function() {
			const query = searchInput.val();
			searchInput.val("");
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
						searchInput.val("");
					},
					error : function() {
						alert("error");
					}
				});
			}
		}

		searchInput.on('keydown', handleSearch);
		form.on('submit', function(event) {
			if (!searchInput.val()) {
				event.preventDefault();
			}
		});
	</script>
</body>
</html>
