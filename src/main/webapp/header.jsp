<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름</title>
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
<div class="top">
<img alt="logo" src="${ctx}/img/logo.png">
<div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" id="dropdownBtn">
    asdadsadsadsadsa3123123123123131313123
  </button>
  <div class="dropdown-menu dropdown-menu-end">
    <a class="dropdown-item" href="#">dropdown item 1</a>
    <a class="dropdown-item" href="#">dropdown item 2</a>
    <a class="dropdown-item" href="#">dropdown item 3</a>
  </div>
</div>
</div>
<div class="nav justify-content-around contentsbar">
	<div class="col-2 py-3" onclick="location.href=#"> 예약하기 </div>
	<div class="col-2 py-3" onclick="location.href=#"> 예약확인 </div>	
	<div class="col-2 py-3" onclick="location.href=#"> 게시판 </div>
	<c:if test="${log == 'admin'}"><div class="col-2 py-3" onclick="location.href=#"> 회원관리 </div>
								   <div class="col-2 py-3" onclick="location.href=#"> 차량추가 </div></c:if>
	<c:if test="${log != 'admin' && log != null}"><div class="col-2 py-3" onclick="location.href=#"> 마이페이지 </div></c:if>
</div>
