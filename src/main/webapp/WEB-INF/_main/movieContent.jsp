<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<table class="table">
		<tr>
		<td>
		<img src="https://image.tmdb.org/t/p/original${vo.backdrop_path}" style="width: 400px; height: auto;">
		</td>
		</tr>
		<tr>
			<td style="cursor: pointer;" class="content" id="${vo.movieCd}">${vo.movieNm}</td>
		</tr>
		<tr>
			<td>${vo.genreNm}</td>
		</tr>
		<tr>
			<td colspan="2">${vo.openDt}</td>
		</tr>
		<tr>
			<td><button>찜하기</button><button>봤어요</button> </td>
		</tr>
	</table>
</body>
</html>