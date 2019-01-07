<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>공지사항</title>
<script type="text/javascript">
	document.title = 'MRSPACE : 공지사항';
</script>
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
			actionForm.append("<input type='hidden' name='nt_num' value='"
			+ $(this).attr("href")+ "'>");
			actionForm.attr("action", "/noticeDetail.do");
			actionForm.submit();
		});
	});
</script>
</head>
<body>
<div class="contentContainer">
		<div class="page-header">
			<h2 class="mb-6">안내 드립니다</h2>
		</div>

		<%-- =================== 리스트 시작  ================= --%>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">

				<thead>
					<tr>
						<th>#번호</th>
						<th>공지사항 제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="notice">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="notice" items="${noticeList}">
								<tr data-num="${notice.nt_num}">
									<td><c:out value="${notice.nt_num}" /></td>
									<td><a class='move'
										href='<c:out value="${notice.nt_num}"/>'><c:out
												value="${notice.nt_title}"></c:out></a></td>
									<td><c:out value="${notice.nt_date}" /></td>
									<td></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>


		</div>
		<%-- =================== 리스트 종료  ================= --%>
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
		<form id="actionForm" action="/notice.do" method="get">
			<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
		</form>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
		
	</div>
</body>
</html>