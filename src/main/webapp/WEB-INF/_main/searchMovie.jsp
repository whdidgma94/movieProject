<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<body>
	<h1></h1>
	<div class="search-wrapper" align="center">
		<div class="search">
			<input type="text" id="search" placeholder="입력"> <img
				src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
				id="searchImg">
		</div>
	</div>
	<table>
		<c:if test="${searchList ne null }">
			<c:forEach var="searchList" items="${searchList}" begin="0"
				end="${searchList.size() }" step="1" varStatus="status">
				<c:if test="${(status.index)%3 eq 0}">
					<tr>
				</c:if>
				<td id="searchList"><img alt="" id="${searchList.title}"
					src="${searchList.image}" /><br /> <strong>${searchList.title}</strong></td>
				<c:if test="${(status.index)%3 eq 2}">
					</tr>
				</c:if>
			</c:forEach>
			<%
			session.removeAttribute("searchList");
			%>
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
					if (response == "null") {
						swal('입력 오류', '일치하는 결과가 없습니다', 'error');
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
					url : "${ctx}/searchMovieView.do",
					data : {
						inputVal : searchInput.val()
					},
					success : function(response) {
						if (response == "null") {
							swal('입력 오류', '일치하는 결과가 없습니다', 'error');
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

		const searchWrapper = document.querySelector('.search-wrapper');
		const searchWrapperTop = searchWrapper.offsetTop;

		window.addEventListener('scroll', function() {
			const currentScroll = window.pageYOffset;

			if (currentScroll >= searchWrapperTop) {
				searchWrapper.style.position = 'fixed';
				searchWrapper.style.top = 0;
			} else {
				searchWrapper.style.position = 'absolute';
				searchWrapper.style.top = '20%';
			}
		});

		function animateScrollTop() {
			const currentScroll = window.pageYOffset;
			const targetScroll = searchWrapperTop;
			const distance = targetScroll - currentScroll;
			const step = distance / 30;

			if (distance > 0) {
				window.scrollTo(0, currentScroll + step);
				if (currentScroll + step < targetScroll) {
					window.requestAnimationFrame(animateScrollTop);
				}
			}
		}

		searchWrapper.addEventListener('click', function() {
			if (window.pageYOffset >= searchWrapperTop) {
				return;
			}
			animateScrollTop();
		});
	</script>
</body>
</html>
