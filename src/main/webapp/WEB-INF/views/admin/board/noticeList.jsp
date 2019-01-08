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
<title>Notice</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<!-- Bootstrap custom CSS -->
<link href="/resources/css/admin.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		/* 게시글 등록 */
		$("#ntFormBtn").click(function() {
			location.href = "/admin/notice/writeForm";
		});
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
			actionForm.attr("action", "/admin/notice/ntDetail");
			actionForm.submit();
		});
		/* 사업자 메일 보내기 */
		$("#emailFormBtn").click(function() {
			$("#myModal").modal('show');
		});
		$("#mailSendBtn").click(function() {
			$("#mail-form").attr("action","/admin/notice/mailSender").attr("method", "Post");
			$("#mail-form").submit();
			if ("${result}" == "success") {
				alert("메일이 성공적으로 발송되었습니다");
				$("#myModal").close();
				location.href = "/admin/notice/list";
			}
		});
	});
	</script>
</head>
<body>
	<div class="contentContainer" style="width: 85%; margin-left:3%; margin-top: 10px;">
		<div class="page-header">
			<h3>공지사항</h3>
		<div id="button-group" class="pull-right">
			<button id="ntFormBtn" class="btn btn-sm btn-primary">공지사항 쓰기</button>
			<!-- <button class="btn btn-sm" id="emailFormBtn">사업자 공지 메일 보내기</button> -->
		</div>
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
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

		<%-- =============== 사업자 메일 보내기 모달 =============== --%>
		<!-- Modal 추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">업체 공지사항 쓰기</h4>
					</div>
					<form name=mail-form action="/admin/notice/mailSender"
						method="Post">
						<div class="modal-body">
							<div class="form-group">
								<label>제목</label> <input class="form-control" name='mail_title'>
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="20" name='mail_message'></textarea>
							</div>
							<div class="form-group">
								<label>첨부파일</label> <input type="file" class="form-control"
									name='mail_file'>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary" id="mailSendBtn">Send</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<%-- =============== 사업자 메일보내기 모달 끝 =============== --%>

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
		<form id="actionForm" action="/admin/notice/list" method="get">
			<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
		</form>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
	</div>


</body>
</html>