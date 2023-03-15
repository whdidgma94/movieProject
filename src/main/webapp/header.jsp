<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름</title>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/116a85af51.js"
	crossorigin="anonymous"></script>
<script>
window.addEventListener('load', ()=>{
	  var today = new Date();
	  var targetDate = new Date(today.setDate(today.getDate()-1)).toISOString().substring(0,10).replace(/-/g,'');
	  
	  let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=7532377ec0b85020c332a47475218ba2&targetDt="+targetDate
	  $.getJSON(url, function(data) {
	    let movieList = data.boxOfficeResult.dailyBoxOfficeList;
	    for ( let i =0;i<10;i++) {
	      let url2 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd="+movieList[i].movieCd;
	      console.log(url2);
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
	            alert("error2");
	          }
	        });
	      });   
	    }
	  }); 
	});

      </script>
</head>
<body>
	<div class="top">
		<img alt="logo" src="${ctx}/img/logo.png">
		<c:if test="${log != null}">
			<div class="curLog">${log}님로그인중</div>
		</c:if>
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				data-toggle="dropdown" id="dropdownBtn">
				<i class="fa-solid fa-user"></i>
			</button>
			<div class="dropdown-menu dropdown-menu-right">
				<c:if test="${log == null}">
					<a class="dropdown-item" href="${ctx}/memberLogin.do">로그인</a>
					<a class="dropdown-item" href="${ctx}/memberJoin.do">회원가입</a>
				</c:if>
				<c:if test="${log != null}">
					<a class="dropdown-item" href="${ctx}/memberLogout.do">로그아웃</a>
					<a class="dropdown-item" href="#">마이페이지</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="nav justify-content-around contentsbar">
		<div class="col-2 py-3" onclick="location.href=#">추천영화</div>
		<div class="col-2 py-3" onclick="location.href=#">영화검색</div>
		<div class="col-2 py-3" onclick="location.href=#">예매하기</div>
		<div class="col-2 py-3" onclick="location.href=#">영화순위</div>
		<div class="col-2 py-3" onclick="location.href=#">영화리뷰</div>
		<c:if test="${log == 'admin'}">
			<div class="col-2 py-3" onclick="location.href=#">회원관리</div>
			<div class="col-2 py-3" onclick="location.href=#">차량추가</div>
		</c:if>
	</div>