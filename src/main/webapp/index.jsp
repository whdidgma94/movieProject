<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<body>
	<h1>index</h1>
	<script>
      
	
      window.addEventListener('load', ()=>{
    	  $.ajax({
  	          type: "POST",
  	          url: "${ctx}/setDataBase.do",
  	          data: {
  	        	},
  	          success: function(response) {
  	          },
  	          error : function() {
  	            alert("error");
  	          }
  	        }); 	  
      });
      </script>
</body>
</html>