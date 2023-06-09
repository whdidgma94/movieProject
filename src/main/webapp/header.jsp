<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJOTTE Movie</title>
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
	    $("#subBar").html("<div onclick=checkLog('recommand')>나의 선호 장르</div><div onclick='location.href=\"${ctx}/upcomingMovie.do\"'>개봉 예정작</div><div onclick='location.href=\"${ctx}/nowPlayingMovie.do\"'>현재 상영작</div>");
	});

	$("#searchMovie").mouseover(function() {
	    $("#subBar").html("<div onclick='location.href=\"${ctx}/searchView.do?type=Movie\"'>영화제목 검색</div><div onclick='location.href=\"${ctx}/searchView.do?type=Actor\"'>배우 이름 검색</div><div onclick='location.href=\"${ctx}/searchView.do?type=Director\"'>감독 이름 검색</div>");
	});

	$("#movieReview").mouseover(function() {
	    $("#subBar").html("<div onclick=checkLog('addReview')>리뷰 작성</div><div id=\"movieReview\" onclick=\"location.href='${ctx}/movieReview.do'\">영화 리뷰</div><div onclick=checkLog('myReview')>내가 작성한 리뷰</div>");
	});

	$("#movieRank").mouseover(function() {
	    $("#subBar").html("<div onclick='location.href=\"${ctx}/movieRank.do?type=box\"'>일간 박스오피스 순위</div><div onclick='location.href=\"${ctx}/movieRank.do?type=review\"'>리뷰 많은순</div><div onclick='location.href=\"${ctx}/movieRank.do?type=grade\"'>평점 높은순</div>");
	});

	$("#memberManage").mouseover(function() {
	    $("#subBar").html("<div onclick='location.href=\"${ctx}/adminMemberList.do\"'>회원 목록 조회</div><div onclick='location.href=\"${ctx}/adminMemberUpdate.do\"'>회원 정보 수정</div><div onclick='location.href=\"${ctx}/adminMemberDelete.do\"'>회원 삭제</div>");
	});
	$("#noticeManage").mouseover(function() {
	    $("#subBar").html("<div onclick='location.href=\"${ctx}/addNotice.do\"'>공지사항 작성</div><div onclick='location.href=\"${ctx}/noticeRemove.do\"'>공지사항 삭제</div><div onclick='location.href=\"${ctx}/adminReview.do\"'>리뷰 관리</div>");
	});
	$(".content").click(function() {
		var movieCd = $(this).attr('id');
	});
	$("#close").click(function() {
		$("#modal").hide();
	});
	window.addEventListener("click", function(event) {
		if (event.target == modal) {
			$("#modal").hide();
		}
	});
		});
	function showModal(movieCd){
		$.ajax({
			type : "GET",
			url : "movieContent.do?movieCd=" + movieCd,
			success : function(data) {
				$("#movieInfo").html(data);
				$("#modal").show();
			},
			error : function() {
				alert("Error");
			}
		});		
	}
	function checkLog(type){
		  if (${log==null}) {
		    swal('권한 없음', '로그인 후 이용하세요', 'error').then(function() {
		      location.href = "${ctx}/memberLogin.do";
		    });
		    return;
		  } 
		  if(type==='recommand'){
		    location.href="${ctx}/recommandMovie.do";
		  }else if(type==='myReview'){
			location.href="${ctx}/movieMyReview.do";
		  }else if(type==='addReview'){
			location.href="${ctx}/addReview.do"; 
		  }
		}
</script>
</head>
<body>
	<div class="header">
		<div class="top">
			<h2 class="cinema-link" onclick="location.href='${ctx}/_main.do'"
				style="cursor: pointer;">JJOTTE Movie</h2>

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
						<a class="dropdown-item" href="${ctx}/memberMyMovie.do">관심있는
							영화</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="nav justify-content-around contentsbar">
			<div class="col-2 py-3" id="recommendMovie" onclick="location.href=#">추천영화</div>
			<div class="col-2 py-3" id="searchMovie" onclick="location.href=#">영화검색</div>
			<div class="col-2 py-3" id="movieReview">영화리뷰</div>
			<div class="col-2 py-3" id="movieRank" onclick="location.href=#">영화순위</div>
			<c:if test="${log == 'admin'}">
				<div class="col-2 py-3" id="memberManage">회원관리</div>
				<div class="col-2 py-3" id="noticeManage">게시물관리</div>
			</c:if>
		</div>
		<div class="nav justify-content-around contentsbar" id="subBar"
			style="margin-bottom: 20px"></div>
	</div>
	<div class="head-bottom">1</div>

	<div id="modal" class="modal">
		<div class="modal-content">
			<button id="close" style="background-color: transparent; border: none; color: #999999; font-size: 24px; cursor: pointer;">&times;</button>
			<p id="movieInfo"></p>
		</div>
	</div>