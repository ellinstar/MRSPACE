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
<title>찜 목록</title>
</head>
<!-- Bootstrap core CSS -->
<!-- <link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->

<!-- Custom styles for this template -->
<!-- <link href="dashboard.css" rel="stylesheet"> -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- <script src="../../assets/js/ie-emulation-modes-warning.js"></script> -->



<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->



<!-- Custom styles for this template -->
<link href="/resources/css/landing-page.min.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var sp_Num = $(this).parents("tr").attr("data-num");
			$("#sp_Num").val(sp_Num);
			console.log("공간번호 : " + sp_Num);
			// 상세 페이지로 이동하기 위해 form 추가 (id : move) 
			$("#move").attr({
				"method" : "post",
				"action" : "/mem/likeDelete.do"
			});
			$("#move").submit();
		});

		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {
			var sp_Num = $(this).parents("tr").attr("data-num");
			$("#sp_Num").val(sp_Num);
			console.log("공간번호 : " + sp_Num);
			// 상세 페이지로 이동하기 위해 form 추가 (id : move) 
			$("#move").attr({
				"method" : "get",
				"action" : "/common/commonDetail.do"
			});
			$("#move").submit();
		});
	});
</script>
<body>
	<section class="testimonials text-center">
		<%-- ========= 상세 페이지 이동을 위한 FORM ============= --%>
		<form name="move" id="move">
			<input type="hidden" name="sp_Num" id="sp_Num">
		</form>

		<div class="contentContainer">
			<br>
			<div class="container-fluid">
				<h2 class="sub-header">찜 목록</h2>
			</div>
			<br> <br>

			<%-- =================== 리스트 시작  ================= --%>
			<div class="table-responsive">
				<table class="table table-striped">
					<colgroup>
						<col width="10%" />
						<col width="30%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>공간명</th>
							<th>주소</th>
							<th>유형</th>
							<th>금액</th>
							<th>찜한 날짜</th>
							<th>처리</th>
						</tr>
					</thead>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty likeList}">
								<c:forEach var="like" items="${likeList}" varStatus="status">
									<tr class="tac" data-num="${like.sp_Num}">
										<td class="goDetail tal"><a>${like.sp_Name}</a></td>
										<td>${like.sp_Address}</td>
										<td>${like.sp_Type}</td>
										<td>${like.like_Amount}</td>
										<td><fmt:parseDate value="${like.like_Date}"
												pattern="yyyy-MM-dd HH:mm:ss" var="parseDate" /> <fmt:formatDate
												value="${parseDate}" pattern="yyyy-MM-dd" /></td>
										<td class="delete"><a>삭제</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">찜한 목록이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>


			</div>
			<%-- =================== 리스트 종료  ================= --%>

		</div>
	</section>
</body>
</html>