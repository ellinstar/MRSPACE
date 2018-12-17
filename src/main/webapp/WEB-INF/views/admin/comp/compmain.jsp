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
<title>업체 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<!-- Bootstrap custom CSS -->
<link href="/resources/css/admin.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='cp_Num' value='"
		+ $(this).attr("href")+ "'>");
		actionForm.attr("action", "/admin/comp/detail");
		actionForm.submit();
	});
});
</script>
</head>
<body>
<div class="contentContainer">
		<div class="page-header">
			<h3><a href="/admin/comp/list">업체 등록 현황</a></h3>
		</div>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th data-value="cp_num" class="order">#번호</th>
						<th>업체명</th>
						<th>아이디</th>
						<th>승인</th>
						<th>상태</th>
						<th data-value="cp_date" class="order">가입신청일</th>
					</tr>
				</thead>
				<tbody id="complist">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty cpMainList}" >
						<c:forEach var="company" items="${cpMainList}">
							<tr>
								<td><c:out value="${company.cp_Num}"/></td>
								<td><a class='move' href='<c:out value="${company.cp_Num}"/>'><c:out value="${company.cp_Name}"></c:out></a> </td>
								<td><c:out value="${company.cp_Id}"/></td>
								<td><c:out value="${company.cp_Joinstate}"/></td>
								<td><c:out value="${company.cp_Joinstate}"/></td>
								<td><c:out value="${company.cp_Date}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<form id="actionForm" action="/admin/comp/detail" method="get">
			</form>
		</div>
		<div class="page-header">
			<h3><a href="/admin/comp/space">공간 등록 현황</a></h3>
			</div>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th data-value="nt_num" class="order">#번호</th>
						<th>업체명</th>
						<th>공간명</th>
						<th>유형</th>
						<th>위치</th>
						<th>총수량</th>
						<th data-value="nt_date" class="order">등록신청일</th>
					</tr>
				</thead>
				<tbody id="qnaList">
				<%-- <c:choose>
					<c:when test="${not empty qnaList}" >
						<c:forEach var="qna" items="${qnaList}">
							<tr>
								<td><c:out value="${qna.que_num}"/></td>
								<td><a class='move' href='<c:out value="${qna.que_num}"/>'><c:out value="${qna.que_title}"></c:out></a> </td>
								<td><c:out value="${qnd.que_rep_num}"/></td>
								<td><c:out value="${qnd.mem_num}"/></td>
								<td><c:out value="${qnd.que_date}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose> --%>
				</tbody>
			</table>
		</div>
			
	</div>
</body>
</html>