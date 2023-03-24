<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<style>
tr.movie:hover {
	background-color: #f7f7f7;
}

tr.movie:hover td, tr.movie:hover th {
	color: #333;
}
</style>
<body class="mainView">
	<div class="container">
		<h1 class="mt-3 mb-5">영화 순위 ${type}</h1>
		<table class="table table-bordered">
			<thead>
				<tr style="text-align: center;">
					<th class="text-nowrap">순위</th>
					<th>포스터</th>
					<th>영화 제목</th>

					<th class="text-nowrap">개봉일</th>
					<c:if test="${type eq 'grade'}">
						<th class="text-nowrap">평점</th>
					</c:if>
					<c:if test="${type eq 'review'}">
						<th class="text-nowrap">리뷰갯수</th>
					</c:if>
					<c:if test="${type eq 'box'}">
						<th class="text-nowrap">전일 관객수</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:if test="${movieRankList ne null }">
					<c:forEach var="movieRankList" items="${movieRankList}" begin="0"
						end="${movieRankList.size() }" step="1" varStatus="status">
						<c:if
							test="${(type == 'grade' && movieRankList.grade != 0) || (type == 'review' && reviewCnt.get(status.index) != 0) || (type == 'box' && audiCnt.get(status.index) != 0)}">
							<tr class="movie" style="cursor: pointer;"
								onclick="showModal(${movieRankList.movieCd})">
								<td class="text-nowrap">${status.count}</td>
								<td><img
									src="https://image.tmdb.org/t/p/original${movieRankList.poster_path}"
									style="width: 100px; height: auto;" alt="..."></td>
								<td>${movieRankList.movieNm }</td>
								<td class="text-nowrap">${movieRankList.openDt}</td>
								<c:if test="${type eq 'box'}">
									<td class="text-nowrap">${audiCnt.get(status.index)}</td>
								</c:if>
								<c:if test="${type eq 'grade'}">
									<td class="text-nowrap">${movieRankList.grade}</td>
								</c:if>
								<c:if test="${type eq 'review'}">
									<td class="text-nowrap">${reviewCnt.get(status.index)}</td>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>