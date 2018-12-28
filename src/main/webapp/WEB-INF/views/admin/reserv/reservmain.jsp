<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<title>Insert title here</title>
<!-- Bootstrap custom CSS -->
<link href="/resources/css/admin.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
	$(".reserv").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='res_Num' value='"
		+ $(this).attr("href")+ "'>");
		actionForm.attr("action", "/admin/reserv/detail");
		actionForm.submit();
	});
	var searchForm = $("#searchForm");
	$("#search").on("change", function(e) {
		e.preventDefault();
		searchForm.submit();
		$("#search option:selected").text();
		//$(this).find("option:eq(search)").prop("selected", true);
		
		
	});
	
});
</script>
</head>
<body>
	<div class="contentContainer">
	<!-- =====================콤보박스================================= -->
	<form id='searchForm' action="/admin/reserv" method="get" class="form-label-group form-row " >
		<select name="search" id="search" class="form-control font-weight-bold" data-live-search="true">
			<option value="0">전체</option>
			<c:forEach var="cp" items="${cp}">
			<option class="font-weight-bold" value="<c:out value='${cp.cp_Num}'/>"><c:out value='${cp.cp_Name}'/></option>
			</c:forEach>
		</select>
		</form>
	<!-- =====================콤보박스================================= -->
	<div class="row">
		<div class="col-6">
		<div class="page-header">
			<h3>오늘의 예약건</h3>
		</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>예약번호</th>
						<th>공간명</th>
						<th>공간유형</th>
						<th>회원ID</th>
						<th>업체명</th>
						<th>예약진행상태</th>
					</tr>
				</thead>
				<tbody id="reservlist">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty todayRes}" >
						<c:forEach var="res" items="${todayRes}">
							<tr>
								<td></td>
								<td><a class='reserv' href='<c:out value="${res.res_Num}"/>'><c:out value="${res.res_Num}"></c:out></a> </td>
								<td><c:out value="${res.sp_Name}"/></td>
								<td><c:out value="${res.sp_Type}"/></td>
								<td><c:out value="${res.mem_Id}"/></td>
								<td><c:out value="${res.cp_Name}"/></td>
								<td><c:out value="${res.res_State}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<%-- =============== 페이지 네비게이션 시작 =============== --%>
		<!-- 페이지 번호 출력 -->
		<div class='pull-right button-group'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1 }">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":''}"><a
						href="${num}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
			<form id="actionForm" action="/admin/reserv/detail" method="get">
			<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			</form>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
		</div>
		<%-- =================== 전체 예약 =================== --%>
		<div class="col-6">
		<div class="page-header">
			<h3>전체 예약건</h3>
		</div>
		
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>업체번호</th>
						<th>예약번호</th>
						<th>공간명</th>
						<th>공간유형</th>
						<th>회원ID</th>
						<th>사용월</th>
						<th>예약진행상태</th>
					</tr>
				</thead>
				<tbody id="rescplist">
				<c:choose>
					<c:when test="${not empty rescplist}" >
						<c:forEach var="rescp" items="${rescplist}">
							<tr>
								<td><c:out value="${rescp.cp_Num}"/></td>
								<td><a class='move' href='<c:out value="${rescp.res_Num}"/>'><c:out value="${rescp.res_Num}"></c:out></a> </td>
								<td><c:out value="${rescp.sp_Name}"/></td>
								<td><c:out value="${rescp.sp_Type}"/></td>
								<td><c:out value="${rescp.mem_Id}"/></td>
								<td><c:out value="${rescp.resUseDate}"/></td>
								<td><c:out value="${rescp.res_State}"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			
			
		</div>
		</div>	
	</div>

</body>
</html>
