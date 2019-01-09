<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>


<!-- Navigation -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#joinBtn").click(function() {
			location.href = "/mem/memType.do";
		});
	});
</script>

<style>
#logoimg {
	width: 180px;
	
}
</style>
<div class="container">
	<a class="navbar-brand" href="/"><img id="logoimg" alt=""
		src="/resources/img/logo.png"></a> <a href="/">Home</a> <a
		href="/notice.do">공지사항</a>
	<c:choose>
		<c:when
			test="${cp_Id != null or cp_Id != '' and login.mem_Id == null and login.mem_Id == ''}">
			<a href="/space/spaceRegister.do">내 공간 등록</a>
			<ul class="navbar-nav">
				<li><strong>[${cp_Name}]님 반갑습니다.</strong>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="/mem/logout.do">로그아웃</a> <a
					href="/comp/compPage.do">&nbsp;&nbsp;&nbsp;마이페이지</a></li>
			</ul>
		</c:when>
		<c:when
			test="${login.mem_Id != null or login.mem_Id != '' and cp_Id == null and cp_Id == ''}">
			<a href="/qna/qnaList.do">문의게시판</a>
			<ul class="navbar-nav">
				<li><strong>[${login.mem_Name}]님 반갑습니다.</strong>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="/mem/logout.do">로그아웃</a> <a
					href="/mem/memMyPage.do">&nbsp;&nbsp;&nbsp;마이페이지</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="navbar-nav">
				<li><a class="btn btn-primary" href="/mem/login.do">로&nbsp;그&nbsp;인
				</a> <input class="btn btn-primary" type="button" id="joinBtn"
					name="joinBtn" value="회원가입" /></li>
			</ul>
		</c:otherwise>
	</c:choose>
</div>
