<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		const formObj = $("form[name='updateForm']");
		
		$(document).on("click", "#fileDel", function() {
			$(this).parent().remove();
		});
		
		fn_addFile();
		
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href="/board/readView?bno=${update.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}";
		});
		
		$(".update_btn").on("click", function() {
			if(fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
	
	function fn_valiChk() {
		const updateForm = $("form[name='updateForm'] .chk").length;
		for(let i=0; i<updateForm; i++) {
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
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();
		});
	}
	const fileNoArray = new Array();
	const fileNameArray = new Array();
	function fn_del(value, name) {
		fileNoArray.push(value);
		fileNameArray.push(name);
		$("#fileNoDel").attr("value", fileNoArray);
		$("#fileNameDel").attr("value", fileNameArray);
	}
	
</script>
</head>
<body>

<div id="root">
	<header>
		<h1>게시판 수정하기</h1>
	</header>
	<hr />
	
	<div>
		<%@include file="nav.jsp" %>
	</div>
	<hr />
	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
			<input type="hidden" id="bno" name="bno" value="${update.bno}" readonly="readonly"/>
			<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly"/>
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly"/>
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly"/>
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly"/>
			<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
			<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
			
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">제목</label>
							<input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요." />
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">내용</label>
							<textarea id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<label for="writer">작성자</label>
							<input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="regdate">작성날짜</label>
							<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td id="fileIndex">
							<c:forEach var="file" items="${file}" varStatus="var">
								<div>
									<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" values="${file.FILE_NO}">
									<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
									<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
									<button id="fileDel" onclick="fn_del('${file.FILE_NO}', 'FILE_NO_${var.index}');" type="button">삭제</button> <br />
								</div>
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="button" class="update_btn">저장</button>
				<button type="button" class="cancel_btn">취소</button>
				<button type="button" class="fileAdd_btn">파일추가</button>
			</div>
		</form>
	</section>
</div>

</body>
</html>