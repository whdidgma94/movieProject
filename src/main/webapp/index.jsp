<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<body>
	<h1 style="color: black;">데이터베이스 세팅중 입니다.</h1>
	
	<script>	
      window.addEventListener('load', ()=>{
    	  $.ajax({
  	          type: "POST",
  	          url: "${ctx}/setDataBase.do",
  	          data: {
  	        	},
  	          success: function(response) {
  	        	window.location.href = "${ctx}/_main.do";
  	          },
  	          error : function() {
  	            alert("error");
  	          }
  	        }); 	  
      });
      </script>
</body>
</html>