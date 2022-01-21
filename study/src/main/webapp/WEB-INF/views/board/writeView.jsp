<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		const formObj = $("form[name='writeForm']");
		
		$(".write_btn").on("click", function() {
			if(fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
	});
	
	function fn_valiChk() {
		const regForm = $("form[name='writeForm'] .chk").length;
		for(let i=0; i<regForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</head>
<body>

<div id="root">
	<header>
		<h1>게시판 작성</h1>
	</header>
	<hr/>
	
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<form name="writeForm" role="form" method="post" action="/board/write">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">제목</label>
							<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요." />
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label>
							<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="writer">작성자</label>
							<input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요" />
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="write_btn">작성</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
</div>

</body>
</html>