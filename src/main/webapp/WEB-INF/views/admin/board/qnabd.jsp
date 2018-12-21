<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap core CSS -->
<!-- <link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet"> -->

</head>
<body>
	<div class="contentContainer">
		<div class="page-header">
			<h3>문의게시판</h3>
		</div>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">

				<thead>
					<tr>
						<th data-value="qna_Num" class="order">#번호</th>
						<th>제목</th>
						<th>답변</th>
						<th data-value="mem_Name">작성자</th>
						<th data-value="que_Date" class="order">작성일</th>
					</tr>
				</thead>
				<tbody id="qna">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty qna}">
							<c:forEach var="qna" items="${qna}">
								<tr>
									<td><c:out value="${qna.qna_Num}" /></td>
									<td><a class='move'
										href='<c:out value="${qna.qna_Num}"/>'><c:out
												value="${qna.qna_Title}"></c:out></a></td>
									<td><%  %></td>
									<td><c:out value="${qna.qna_Name}"/></td>
									<td><c:out value="${qna.qna_Date}" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
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
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":''}"><a
						href="${num}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
		<form id="actionForm" action="/admin/qna" method="get">
			<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			<input type="hidden" name='type'
				value='<c:out value="${pageMaker.cri.type}"/>'> <input
				type="hidden" name='keyword'
				value='<c:out value="${pageMaker.cri.keyword}"/>'>

		</form>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							/* 게시글 등록 */
							$("#insertFormBtn").on("click", function() {
								self.location = "/admin/noticeWrite";
							});
							/* 페이지 이동 */
							var actionForm = $("#actionForm");

							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							$(".move").on("click",function(e) {
									e.preventDefault();
									actionForm.append("<input type='hidden' name='nt_num' value='"
									+ $(this).attr("href")+ "'>");
									actionForm.attr("action","/noticeDetail");
									actionForm.submit();
							});
						});
	</script>
</body>
</html>