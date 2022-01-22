<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancel").on("click", function() {
			location.href="/";
		});
		
		$("#submit").on("click", function() {
			if($("#userPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			
			alert("정보 수정을 성곻하셨습니다.");
		});
	});
</script>
</head>
<body>

<section id="container">
	<form method="post" action="/member/memberUpdate">
		<div class="form-group has-feedback">
			<label class="control-label" for="userId">아이디</label>
			<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPass">패스워드</label>
			<input class="form-control" type="password" id="userPass" name="userPass" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userName">성명</label>
			<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"/>
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
			<button class="cancel btn btn-danger" type="button">취소</button>
		</div>
	</form>
</section>

</body>
</html>