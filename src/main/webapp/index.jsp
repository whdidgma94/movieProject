<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<body>
	<h1>index</h1>

	<script>
        window.addEventListener('load', ()=>{
		var today = new Date();
		var targetDate = new Date(today.setDate(today.getDate()-1)).toISOString().substring(0,10).replace(/-/g,'');

        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=7532377ec0b85020c332a47475218ba2&targetDt="+targetDate

          $.getJSON(url, function(data) {
                  let movieList = data.boxOfficeResult.dailyBoxOfficeList;
                });
          });                    
                    $("#boxoffice").on("click",".movie", function(){
                    let d = $(this);
                    let movieCd = d.attr("id");
                    let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=7532377ec0b85020c332a47475218ba2&movieCd="+movieCd;
                    $.getJSON(url,function(res){
                        let movie = res.movieInfoResult.movieInfo;
                        d.append("<hr>");
                        d.append("개봉일 : "+movie.openDt+"<br>");
                        d.append("감독 : "+movie.directors[0].peopleNm+"<br>");
                        d.append("주연 : "+movie.actors[0].peopleNm+", "+movie.actors[1].peopleNm+", "+movie.actors[2].peopleNm);
                        d.append("<hr>");

                    })
                });
        </script>
</body>
</html>