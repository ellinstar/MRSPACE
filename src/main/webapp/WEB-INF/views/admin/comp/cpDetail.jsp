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
			<h3>업체 상세 페이지</h3>
		</div>

		<div class="panel-body">
		<table>
		<tr><th>상호명</th><td><c:out value="${detail.cp_Name}"></c:out></td></tr>
		<tr><th>아이디</th><td><c:out value="${detail.cp_Id}"></c:out></td></tr>
		<tr><th>사업자 번호</th><td><c:out value="${detail.cp_Bnum}"></c:out></td></tr>
		<tr><th>대표자명</th><td><c:out value="${detail.cp_Ceo}"></c:out></td></tr>
		<tr><th>본사 위치</th><td><c:out value="${detail.cp_Add}"></c:out></td></tr>
		<tr><th>담당자 연락처</th><td><c:out value="${detail.cp_Phone}"></c:out></td></tr>
		<tr><th>담당자 이메일</th><td><c:out value="${detail.cp_Email}"></c:out></td></tr>
		<tr><th>입금 계좌번호</th><td><c:out value="${detail.cp_Bank}"/><c:out value="${detail.cp_Account}"/></td></tr>
		
		</table>
		<button>삭제</button>&nbsp;
		<button>반려</button>&nbsp;
		<button>접수</button>&nbsp;
		<button>승인</button>
		</div>
	</div>

</body>
</html>