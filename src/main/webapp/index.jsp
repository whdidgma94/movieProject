<%@page import="Controller.SetGenreController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<body>
	<h1>index</h1>
	<%
	SetGenreController gc = new SetGenreController();
	gc.setGenreDb();
	%>
	<script>
	  let page = 1;
      const base_url = "https://image.tmdb.org/t/p/w300/";
      
      function postMovie(page){
          const url = "https://api.themoviedb.org/3/movie/upcoming?api_key=a699dda4efd374eb3d9a01da4dacc267&language=ko-KR&page="+page;
          fetch(url).then(res => res.json()).then(function(res){
              const movies = res.results;
              movies.map(function(movie){
            	  $.ajax({
          	          type: "POST",
          	          url: "${ctx}/setDataBase.do",
          	          data: {
          	        	  movie: JSON.stringify(movie)
          	        	},
          	          success: function(response) {
          	          },
          	          error : function() {
          	            alert("error");
          	          }
          	        });
              });
          })
          .catch(error => console.log(error));
      };
	
      window.addEventListener('load', ()=>{
		for(let i = 1;i<=1;i++){
			postMovie(i);
		}    	  
      });
      </script>
</body>
</html>