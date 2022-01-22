<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
			if($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
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
			
			const idChkVal = $("#idChk").val();
			if(idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if(idChkVal == "Y") {
				$("#regForm").submit();
			}
		});
		
	});
	
	function fn_idChk() {
		$.ajax({
			url: "/member/idChk",
			type: "post",
			dataType: "json",
			data: {"userId": $("#userId").val()},
			success: function(data) {
				if(data == 1) {
					alert("중복된 아이디입니다.");
				} else if(data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	
</script>
</head>
<body>

<section class="container">
	<form id="regForm" action="/member/register" method="post">
		<h2 class="mt-3">회원가입</h2>
	
		<div class="form-group has-feedback">
			<label class="control-label" for="userId">아이디</label>
			<input class="form-control" type="text" id="userId" name="userId" />
			<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPass">패스워드</label>
			<input class="form-control" type="password" id="userPass" name="userPass" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userName">성명</label>
			<input class="form-control" type="text" id="userName" name="userName" />
		</div>
	</form>
	<div class="form-group has-feedback">
		<button class="btn btn-success" type="button" id="submit">회원가입</button>
		<button class="cancel btn btn-danger" type="button">취소</button>
	</div>	
	<div>
		<c:if test="${msg == false}">
			중복된 아이디입니다.
		</c:if>
	</div>
	
</section>

</body>
</html>