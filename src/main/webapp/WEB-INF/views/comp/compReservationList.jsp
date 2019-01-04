<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
</head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/assets/js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
	src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>


<!-- Bootstrap core CSS -->
<!-- <link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->

<script type="text/javascript">
	$(function() {
		$("#agree").click(function() {
			$("#reservStateUpdate").attr({
				"method" : "POST",
				"action" : "/comp/compReservStateUpdate.do"
			});
			$("#reservStateUpdate").submit();
		});
		
		$("#refuse").click(function() {
			$("#reservStateUpdate").attr({
				"method" : "POST",
				"action" : "/comp/compReservStateUpdate2.do"
			});
			$("#reservStateUpdate").submit();
		});
	});
</script>

<body>
	<section class="testimonials text-center">
	<div class="container-fluid"><br><br>
		<h2 class="sub-header">예약 현황</h2><br><br>
		<div class="table-responsive">
			<table class="table table-striped">
				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
				<tr>
					<th>공간명</th>
					<th>예약한 날짜</th>
					<th>예약한 달</th>
					<th>예약 금액</th>
					<th>예약 상태</th>
				</tr>
				</thead>
				<tbody id="list">
				<c:choose>
					<c:when test="${not empty compReservList}">
						<!-- <tr>
							<th>공간명</th>
							<th>예약한 날짜</th>
							<th>예약한 달</th>
							<th>예약 금액</th>
							<th>예약 상태</th>
						</tr> -->
						<c:forEach var="reserv" items="${compReservList}"
							varStatus="status">
							<tr>
								<td>
									<form id="move" name="move">
										<input type="hidden" id="sp_Num" name="sp_Num"
											value="${reserv.sp_Num}">
										<c:out value="${reserv.sp_Name}" />
									</form>
								</td>
								<td><fmt:parseDate value="${reserv.res_Date}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parseDate1" /> <fmt:formatDate
										value="${parseDate1}" pattern="yyyy-MM-dd" /></td>

								<td><fmt:parseDate value="${reserv.res_UseDate}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parseDate2" /> <fmt:formatDate
										value="${parseDate2}" pattern="yyyy년MM월" /></td>
								<td><c:out value="${reserv.res_Amount}" /></td>
								<c:choose>
									<c:when test="${reserv.res_State == 1}">
										<td>
											<form id="reservStateUpdate" name="reservStateUpdate">
												<input type="hidden" value="${reserv.mem_Id}" id="mem_Id" name="mem_Id">
												<input type="hidden" value="${reserv.res_Num}" id="res_Num" name="res_Num">
												<input type="button" value="승인" id="agree" name="agree">
												<input type="button" value="거절" id="refuse" name="refuse">
											</form>
										</td>
									</c:when>
									<c:when test="${reserv.res_State == 2}">
										<td>결제 전</td>
									</c:when>
									<c:when test="${reserv.res_State == 3}">
										<td>사용중</td>
									</c:when>
									<c:when test="${reserv.res_State == 4}">
										<td>사용종료</td>
									</c:when>
									<c:when test="${reserv.res_State == 5}">
										<td>결제 완료</td>
									</c:when>
									<c:when test="${reserv.res_State == -1}">
										<td>예약 거절</td>
									</c:when>
									<c:when test="${reserv.res_State == -2}">
										<td>예약 취소</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="tac">신청한 예약이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>

		</div>
	</div>
	</section>
</body>
</html>