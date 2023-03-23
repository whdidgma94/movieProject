<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
	<main
		style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
		<h2>${vo.movieNm }</h2>

		<div class="img-wrapper">
			<div class="main-img" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
				<img style="width: 600px; height: 700px; margin-bottom: 20px" alt=""
					src="https://image.tmdb.org/t/p/original${imageList.get(0) }">
			</div>
			<div class="select-img">
				<ul class="pagination"
					style="width: 100%; display: flex; justify-content: center; align-items: center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only preBtn">Previous</span>

					</a></li>

					<c:forEach var="image" items="${imageList }" varStatus="status"
						begin="0" end="9">
						<img alt="" src="https://image.tmdb.org/t/p/original${image }"
							style="height: 100px; width: 100px">
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only nextBtn">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="btns">
			<button class="btn btn-primary">찜하기</button>
			<button class="btn btn-primary">봤어요</button>
		</div>
		<div class="table-wrapper">
			<table>
				<tr>
					<th>장르</th>
					<td>장르명</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>감독명</td>
				</tr>
				<tr>
					<th>출연</th>
					<td>출연진</td>
				</tr>
			</table>
		</div>
	</main>
</body>

<script>
  const selectImgs = document.querySelectorAll('.select-img img');
  const mainImg = document.querySelector('.main-img img');
  selectImgs.forEach(img => {
    img.addEventListener('click', () => {
      mainImg.src = img.src;
    });
  });
  
  
</script>
</html>