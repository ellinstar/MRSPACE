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
<title>공간목록</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.js"></script>
<!-- Bootstrap custom CSS -->
<link href="/resources/css/admin.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	/* 페이지 이동 */
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='sp_Num' value='"
		+ $(this).attr("href")+ "'>");
		actionForm.attr("action", "/admin/space/detail");
		actionForm.submit();
	});
});
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="page-header">
			<h3>공간 목록</h3>
		</div>
		<%-- =================== 리스트 시작  ================= --%>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">

				<thead>
					<tr>
						<th>#번호</th>
						<th>업체명</th>
						<th>공간명</th>
						<th>유형</th>
						<th>위치</th>
						<th>총 수량</th>
						<th>남은 수량</th>
						<th>등록 신청일</th>
					</tr>
				</thead>
				<tbody id="space">
					<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty spaceList}" >
						<c:forEach var="space" items="${spaceList}">
							<tr>
								<td><c:out value="${space.sp_Num}"/></td>
								<td><c:out value="${space.cp_Num}"/></td>
								<td><a class='move' href='<c:out value="${space.sp_Num}"/>'><c:out value="${space.sp_Name}"></c:out></a> </td>
								<td><c:out value="${space.sp_Type}"/></td>
								<td><c:out value="${space.sp_Address}"/></td>
								<td><c:out value="${space.sp_Stock}"/></td>
								<td><c:out value="${space.sp_Rest}"/></td>
								<td><c:out value="${space.sp_Date}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<%-- =================== 리스트 종료  ================= --%>

		<%-- =============== 페이지 네비게이션 시작 =============== --%>
		<!-- 페이지 번호 출력 -->
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1 }">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a
						href="${num}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
		<form id="actionForm" action="/admin/space/list" method="get">
			<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>

		</form>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
	</div>

</body>
</html>