<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
		
		fn_addFile();
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
	
	function fn_addFile() {
		let fileIndex = 1;
		
		$(".fileAdd_btn").on("click", function() {
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click",  "#fileDelBtn", function() {
			$(this).parent().remove();
		});
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
		<form name="writeForm" role="form" method="post" action="/board/write" enctype="multipart/form-data">
			<table>
				<tbody>
					<c:if test="${member.userId != null}">
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
							<td id="fileIndex">
							</td>
						</tr>
						<tr>
							<td>
								<button type="submit" class="write_btn">작성</button>
								<button type="button" class="fileAdd_btn">파일추가</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${member.userId == null}">
						<p>로그인 후에 작성하실 수 있습니다.</p>
					</c:if>
				</tbody>
			</table>
		</form>
	</section>
</div>

</body>
</html>