<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<div>
	<c:if test="${log == null}">
		<div>로그인</div>
		<div>회원가입</div>
	</c:if>
	<c:if test="${log != null}">
		<div>로그아웃</div>
	</c:if>
</div>
<div class="nav justify-content-start contentsbar">
	<div class="col-2 py-3" onclick="#"> 예매 </div>
	<div class="col-2 py-3" onclick="#"> 현재상영작 </div>
	<c:if test="${log == 'admin'}">
	<div class="col-2 py-3" onclick="#"> 관리자페이지 </div>
	<div class="col-2 py-3" onclick="#"> 회원관리 </div>
	<div class="col-2 py-3" onclick="#"> 영화추가 </div>
	<div class="col-2 py-3" onclick="#"> 영화관리 </div>
	</c:if>
	<c:if test="${log != 'admin' && log != null}"><div class="col-2 py-3" onclick="#"> 마이페이지 </div></c:if>
</div>
