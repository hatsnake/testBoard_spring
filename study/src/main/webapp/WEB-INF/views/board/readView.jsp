<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		const formObj = $("form[name='readForm']");
		
		// 수정
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제
		$(".delete_btn").on("click", function() {
			const deleteYN = confirm("삭제하시겠습니까?");
			
			if(deleteYN === true) {
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
		
		// 취소
		$(".list_btn").on("click", function() {
			location.href = "/board/list";
		});
	});
</script>
</head>
<body>

<div id="root">
	<header>
		<h1>게시판 상세조회</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
	
	<section id="container">
			<form role="form" name="readForm" method="post">
				<input type="hidden" id="btn" name="bno" value="${read.bno}" />
			</form>
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">제목</label>
							<input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label>
							<textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
						</td>
					</tr>					
					<tr>
						<td>
							<label for="writer">작성자</label>
							<input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="regdate">작성날짜</label>
							<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>							
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
			</div>
	</section>
</div>

</body>
</html>