<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<table>
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
				<tr>
					<td><img style="cursor: pointer;"
						id="${vo.movieCd }" class="content" alt=""
						src="#"></td>
					<td style="cursor: pointer;" class="content"
						id="${vo.movieCd }">${vo.movieNm }</td>
					<td>${vo.genreNm }</td>
					<td>${vo.director}</td>
					<td>${vo.actor}</td>
					<td colspan="2">${vo.openDt}</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="7">
						<hr>
					</td>
				</tr>
	</table>
</body>
</html>