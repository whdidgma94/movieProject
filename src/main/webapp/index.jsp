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
	    for ( let i =0;i<10;i++) {
	      let url2 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd="+movieList[i].movieCd;
	      $.getJSON(url2, function(data) {
	        let movie = data.movieInfoResult.movieInfo;
	        $.ajax({
	          type: "POST",
	          url: "${ctx}/setDataBase.do",
	          data: {
	        	  movieList : JSON.stringify(movieList[i]),
	        	  movie: JSON.stringify(movie)
	        	},
	          success: function(response) {
	          },
	          error : function() {
	            alert("error");
	          }
	        });
	      });   
	    }
	  }); 
	});

      </script>
</body>
</html>