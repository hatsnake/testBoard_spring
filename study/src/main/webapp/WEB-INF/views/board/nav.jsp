<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	li {
		list-style: none;
		display: inline;
		padding: 6px;
	}
</style>
<div>
	<div>
		<li>
			<a href="/board/list">목록</a>
		</li>
		<li>
			<a href="/board/writeView">글 작성</a>
		</li>
		<li>
			<c:if test="${member != null}">
				<a href="/member/logout">로그아웃</a>
			</c:if>
			<c:if test="${member == null}">	
				<a href="/">로그인</a>
			</c:if>
		</li>
		<li>
			<c:if test="${member != null}">
				<p>${member.userId}님 환영합니다.</p>
			</c:if>
		</li>
	</div>
</div>