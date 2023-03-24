<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<body class="mainView">

	<div class="container">
		<div class="search-wrapper">
			<div class="search">
				<input type="text" id="search" placeholder="입력"> <img
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
					id="searchImg">
			</div>
		</div>
		<div class="row">
			<c:if test="${searchList ne null }">
				<c:forEach items="${searchList}" var="search">
					<div class="col-md-3 col-sm-6 mb-4">
						<div class="card" style="height: 600px; cursor: pointer;"
							onclick="showModal(${search.movieCd})">
							<img
								src="https://image.tmdb.org/t/p/original${search.poster_path}"
								class="card-img-top" alt="${search.movieNm} 포스터">
							<div class="card-body">
								<h5 class="card-title">${search.movieNm}</h5>
								<p class="card-text">${search.genreNm}</p>
								<p class="card-text">${search.openDt}</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<%
				session.removeAttribute("searchList");
				%>
			</c:if>
		</div>
	</div>


</body>
<script>
		const searchInput = $('#search');
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
						} else if (response == "notValid") {
							swal('입력 오류', '검색어를 입력하세요', 'error');
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
		$("#searchImg").click(function() {
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
					} else if (response == "notValid") {
						swal('입력 오류', '검색어를 입력하세요', 'error');
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
		
		searchInput.on('keydown', handleSearch);

		$("td#searchList>img").click(function() {
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
</html>
