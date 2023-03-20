<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<body>
	<div class="container">
		<h1 class="mt-3 mb-5">영화 순위 ${type}</h1>
		<table class="table table-striped">
			<thead>
				<tr style="text-align: center;">
					<th class="text-nowrap">순위</th>
					<th>영화 제목</th>
					<th>감독</th>
					<th>배우</th>
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
						<tr>
							<td class="text-nowrap">${status.count }</td>
							<td>${movieRankList.movieNm }</td>
							<td>${movieRankList.director}</td>
							<td>${movieRankList.actor}</td>
							<td class="text-nowrap">${movieRankList.openDt}</td>
							<c:if test="${type eq 'grade'}">
								<td class="text-nowrap">${movieRankList.grade}</td>
							</c:if>
							<c:if test="${type eq 'review'}">
								<td class="text-nowrap">${movieRankList.grade}</td>
							</c:if>
							<c:if test="${type eq 'box'}">
								<td class="text-nowrap">${movieRankList.audiCnt}</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>