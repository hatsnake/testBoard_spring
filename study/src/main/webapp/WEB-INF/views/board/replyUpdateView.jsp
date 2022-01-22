<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정 화면</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		const formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function() {
			location.href="/board/readView?bno=${replyUpdate.bno}" +
						  "&page=${scri.page}" +
						  "&perPageNum=${scri.perPageNum}" +
						  "&searchType=${scri.searchType}" +
						  "&keyword=${scri.keyword}";
		});
	});
</script>
</head>
<body>

<div id="root">
	<header>
		<h1>게시판</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/board/replyUpdate">
			<input type="hidden" id="bno" name="bno" value="${replyUpdate.bno}" readonly="readonly" />
			<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" readonly="readonly" />
			<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />
			<table>
				<tbody>
					<tr>
						<td>
							<label for="content">댓글 내용</label>
							<input type="text" id="content" name="content" value="${replyUpdate.content}" />
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">저장</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
		</form>
	</section>
	<hr />
</div>

</body>
</html>