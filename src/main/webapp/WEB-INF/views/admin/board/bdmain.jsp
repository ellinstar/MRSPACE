<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<!-- Bootstrap custom CSS -->
<link href="/resources/css/admin.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	/* 게시글 등록 */
	$("#insertFormBtn").on("click", function() {
		self.location = "/admin/notice/writeForm";
	});
	var actionForm = $("#actionForm");
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
		$("#mail-form").attr("action","/admin/mailSender").attr("method", "Post");
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
	<div class="contentContainer">
		<div class="page-header">
			<h3><a href="/admin/notice/list">공지사항 게시판</a></h3>
			<!-- <button class="btn btn-sm pull-right" id="emailFormBtn">
				사업자 공지 메일 보내기</button> -->
			<button class="btn btn-sm btn-primary pull-right" id="insertFormBtn">공지사항 쓰기 </button>
		</div>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th data-value="nt_num" class="order">#번호</th>
						<th>공지사항 제목</th>
						<th data-value="nt_date" class="order">작성일</th>
					</tr>
				</thead>
				<tbody id="noticeList">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty ntMainList}" >
						<c:forEach var="notice" items="${ntMainList}">
							<tr>
								<td><c:out value="${notice.nt_num}"/></td>
								<td><a class='move' href='<c:out value="${notice.nt_num}"/>'><c:out value="${notice.nt_title}"></c:out></a> </td>
								<td><c:out value="${notice.nt_date}"/></td>
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
			<form id="actionForm" action="/admin/notice/ntDetail" method="get"></form>
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
		<div class="page-header">
			<h3><a href="/admin/qna/list">문의 게시판</a></h3>
			</div>
		<div class="col-md-12">
			<table summary="게시판 리스트"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th data-value="nt_num" class="order">#번호</th>
						<th>제목</th>
						<th>답변</th>
						<th>작성자</th>
						<th data-value="nt_date" class="order">작성일</th>
					</tr>
				</thead>
				<tbody id="qnaList">
				<c:choose>
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
				</c:choose>
				</tbody>
			</table>
		</div>
			
	</div>

</body>
</html>
