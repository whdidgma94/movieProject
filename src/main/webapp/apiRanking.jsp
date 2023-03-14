<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		let y = new Date();
		y.setDate(y.getDate() - 1);
		let str = y.getFullYear() + "-" + ("0" + (y.getMonth() + 1)).slice(-2)
				+ "-" + ("0" + y.getDate()).slice(-2);
		$("#date").attr("max", str);

		// 버튼의 클릭 이벤트
		$("#mybtn")
				.click(
						function() {
							let d = $("#date").val();//YYYY-MM-dd
							const regex = /-/g;
							let d_str = d.replace(regex, "")//YYYYMMdd 

							let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="
									+ d_str

							$
									.getJSON(
											url,
											function(data) {
												let movieList = data.boxOfficeResult.dailyBoxOfficeList;
												$("#boxoffice").empty();
												$("#boxoffice").append(
														d + " 박스 오피스 순위<br>");
												for ( let i in movieList) {
													$("#boxoffice")
															.append(
																	"<div class='movie' id="+movieList[i].movieCd+">"
																			+ (parseInt(i) + 1)
																			+ ". "
																			+ movieList[i].movieNm
																			+ " / "
																			+ movieList[i].audiAcc
																			+ "명</div><hr>");
													console
															.log(movieList[i].movieCd);
												}
											});
						});//button click
		//영화 제목 클릭시 영화 정보 출력
		$("#boxoffice")
				.on(
						"click",
						".movie",
						function() {
							let d = $(this);
							let movieCd = d.attr("id");
							let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd="
									+ movieCd;
							$.getJSON(url, function(res) {
								let movie = res.movieInfoResult.movieInfo;
								d.append("<hr>");
								d.append("개봉일 : " + movie.openDt + "<br>");
								d.append("감독 : " + movie.directors[0].peopleNm
										+ "<br>");
								d.append("주연 : " + movie.actors[0].peopleNm
										+ ", " + movie.actors[1].peopleNm
										+ ", " + movie.actors[2].peopleNm);
								d.append("<hr>");

							})
						})
	});//ready
</script>

</head>
<body>
	<input type="date" id="date">
	<button id="mybtn">확인</button>
	<div id="boxoffice">
		박스 오피스 순위<br>
	</div>
</body>
</html>