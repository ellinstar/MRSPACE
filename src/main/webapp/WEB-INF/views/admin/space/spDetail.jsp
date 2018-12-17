<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company</title>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="contentContainer">
		<div class="panel-heading">
			<h3>공간 상세 페이지</h3>
		</div>

		<div class="panel-body">
		<table>
		<tr><th>업체명</th><td><c:out value="${detail.cp_Num}"></c:out></td></tr>
		<tr><th>공간명</th><td><c:out value="${detail.sp_Name}"></c:out></td></tr>
		<tr><th>공간유형</th><td><c:out value="${detail.sp_Type}"></c:out></td></tr>
		<tr><th>남은 수량/총 수량</th><td><c:out value="${detail.sp_Rest}"/>/<c:out value="${detail.sp_Stock}"/></td></tr>
		<tr><th>공간 위치</th><td><c:out value="${detail.sp_Address}"></c:out></td></tr>
		<tr><th>공간 소개</th><td><c:out value="${detail.sp_Exposition}"></c:out></td></tr>
		<tr><th>공간 서비스</th><td><c:out value="${detail.sp_Service}"></c:out></td></tr>
		<tr><th>교통편</th><td><c:out value="${detail.sp_Traffic}"/></td></tr>
		<tr><th>공간사진</th><td><c:out value="${detail.sp_File}"/></td></tr>
		
		</table>
		<button>삭제</button>&nbsp;
		<button>반려</button>&nbsp;
		<button>접수</button>&nbsp;
		<button>승인</button>
		</div>
	</div>

</body>
</html>