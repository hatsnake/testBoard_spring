<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutBtn").on("click", function() {
				location.href="/member/logout";
			});
			
			$("#registerBtn").on("click", function() {
				location.href="/member/register";
			});
			
			$("#memberUpdateBtn").on("click", function() {
				location.href="/member/memberUpdateView";
			});
			
			$("#memberDeleteBtn").on("click", function() {
				location.href="/member/memberDeleteView";
			});
		});
	</script>
</head>
<body>

<div class="container">
	<form name="homeForm" method="post" action="/member/login">
		<div>
			<%@include file="board/nav.jsp" %>
		</div>
		<h1>로그인</h1>
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="userId">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="password" name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null}">
			<div>
				<p>${member.userId}님 환영합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color:red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</div>

</body>
</html>
		