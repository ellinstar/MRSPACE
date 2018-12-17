<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function spaceList() {
		location.href = "/space/spaceList.do";
	}

	function reservBoard() {
		location.href = "reservBoard.do";
	}

	function compGraph() {
		location.href = "compGraph.do";
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공간관리</h1>
	<div>
		<input type="button" value="공간 목록" onclick="javascript:spaceList()">
		<input type="button" value="예약 현황" onclick="javascript:reservBoard()">
		<input type="button" value="통 계" onclick="javascript:compGraph()">
	</div>
</body>
</html>