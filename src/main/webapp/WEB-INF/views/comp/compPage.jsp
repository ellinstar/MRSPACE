<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%-- <%@ page import="com.space.complogin.vo.CompLoginVO" %>
<%
	CompLoginVO cvo = (CompLoginVO) session.getAttribute("cpLogin");
	int cp_Num = cvo.getCp_Num();
	
%> --%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	/* 	function spaceList() {
	 location.href = "/space/spaceList.do";
	 }

	 function reservBoard() {
	 location.href = "reservBoard.do";
	 }

	 function compGraph() {
	 location.href = "compGraph.do";
	 } */
	function spaceList() {
		$("#sp_Form").attr({
			"method" : "post",
			"action" : "/space/spaceList.do"
		});
		$("#sp_Form").submit();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공간관리</h1>
	<div class="container">
		<form id="sp_Form">
			<%-- <input type="hidden" name="cp_Id" id="cp_Id" value="${cplogin.cp_Id}" /> --%>
			<h1 class="tit_space">마이 페이지</h1>
			<div class="row2">
				<br> <br> <br>
				<ul class="list-inline mb-2">
					<li class="list-inline-item"><a href="/space/spaceList.do?cp_Num=${ cp_Num }"
						id="spaceList"> <img alt="공간목록" src="">
					</a></li>
				</ul>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<ul class="list-inline mb-2">
					<li class="list-inline-item"><a href="/reserv/reservBoard.do"><img
							alt="예약현황" src=""></a></li>
				</ul>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<ul class="list-inline mb-2">
					<li class="list-inline-item"><a href="/comp/compGraph.do"><img
							alt="통계" src=""></a></li>
				</ul>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<ul class="list-inline mb-2">
					<li class="list-inline-item"><a href="/comp/compInfo.do"><img
							alt="내 정보" src=""></a></li>
				</ul>

			</div>
		</form>
	</div>
</body>
</html>