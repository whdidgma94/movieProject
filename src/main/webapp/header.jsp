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
	$(document).ready(function() {
		  $('#subBar').css('opacity', '0');
		  
		  $('.nav').mouseenter(function() {
		    $('#subBar').stop().animate({
		      opacity: 1
		    }, 200);
		  }).mouseleave(function() {
		    $('#subBar').stop().animate({
		      opacity: 0
		    }, 200);
		  });
	$("#recommendMovie").mouseover(function() {
	    $("#subBar").html("<div>나의 선호 장르</div><div>인기 순위</div><div>개봉 예정작</div>");
	});

	$("#searchMovie").mouseover(function() {
	    $("#subBar").html("<div>영화제목 검색</div><div>배우 이름 검색</div><div>감독 이름 검색</div>");
	});

	$("#bookMovie").mouseover(function() {
	    $("#subBar").html("<div>상영관별 예매</div><div>영화별 예매</div>");
	});

	$("#movieReview").mouseover(function() {
	    $("#subBar").html("<div>최신 리뷰</div><div>별점 높은 리뷰</div><div>내가 작성한 리뷰</div>");
	});

	$("#movieRank").mouseover(function() {
	    $("#subBar").html("<div>일간 박스오피스 순위</div><div>주간 박스오피스 순위</div>");
	});

	$("#memberManage").mouseover(function() {
	    $("#subBar").html("<div>회원 목록 조회</div><div>회원 정보 수정</div><div>회원 삭제</div>");
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
					<a class="dropdown-item" href="${ctx}/memberMyPage.do">마이페이지</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="nav justify-content-around contentsbar">
		<div class="col-2 py-3" id="recommendMovie" onclick="location.href='${ctx}/recommandMovie.do'">추천영화</div>
		<div class="col-2 py-3" id="searchMovie"
			onclick="location.href='${ctx}/searchMovie.do'">영화검색</div>
		<div class="col-2 py-3" id="bookMovie" onclick="location.href=#">예매하기</div>
		<div class="col-2 py-3" id="movieReview"
			onclick="location.href='${ctx}/movieReview.do'">영화리뷰</div>
		<div class="col-2 py-3" id="movieRank"
			onclick="location.href='${ctx}/movieRank.do'">영화순위</div>
		<c:if test="${log == 'admin'}">
			<div class="col-2 py-3" id="memberManage" onclick="location.href=#">회원관리</div>
			<div class="col-2 py-3" onclick="location.href=#">차량추가</div>
		</c:if>
	</div>
	<div class="nav justify-content-around contentsbar" id="subBar"
		style="margin-bottom: 20px"></div>