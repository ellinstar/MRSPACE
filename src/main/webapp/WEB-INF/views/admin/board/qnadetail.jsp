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
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="contentContainer" style="width: 85%; margin-left:3%; margin-top: 10px;">
		<div class="panel-heading">
			<h3>문의 내용 상세보기</h3>
		</div>

		<div class="panel-body">

			<div class="form-group">
				<label>제목</label> <input class="form-control" name='qna_title'
					value='<c:out value="${detail.qna_Title}"/>' readonly="readonly">
			</div>
			<div class="form-group form-row">
				<div class="col-md-6">
					<label>작성자</label> <input class="form-control" name="qna_name"
						value='<c:out value="${detail.qna_Name}"/>' readonly="readonly" />
				</div>
				<div class="col-md-6">
					<label>작성일</label> <input class="form-control" name="qna_date"
						value='<c:out value="${detail.qna_Date}"/>' readonly="readonly" />
				</div>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="10" name='qna_content'
					readonly="readonly"><c:out value="${detail.qna_Content}" />
					
				</textarea>
			</div>
					<form id="repForm" method="post">
						<div class="form-group">
							<label>문의사항 댓글내용</label>
							<textarea rows="10" class="form-control" name="rep_content" placeholder="댓글을 등록하세요" autofocus="autofocus">
							<c:out value="${rep.rep_content}" /></textarea>
							<label class="form-control"> 작성일 ${rep.rep_date}</label>
						</div>
						<div class="form-group">
						
							<input type="hidden" id="qna_Num" name="qna_Num" value='<c:out value="${detail.qna_Num}"/>'>
							<c:choose>
							<c:when test="${empty rep}">
							<input type="submit" id="repInsert" class="btn btn-primary" value="등록하기">
							<input type="reset" class="btn" value="작성글비우기">
							</c:when>
							<c:otherwise>
						<!-- 	<input type="submit" id="repUpdate" class="btn btn-primary" value="수정하기">
							<input type="button" id="repDelete" class="btn" value="댓글지우기"> -->
							</c:otherwise>
							</c:choose>
						</div>
					</form>
					<a class="btn btn-default" id="boardListBtn" href="/admin/qna/list">목록으로 돌아가기</a>

			<form name="f_data" id="f_data" method="get">
				<input type="hidden" name="qna_Num" id="qna_Num"
					value="${detail.qna_Num}" /> <input type='hidden' name='pageNum'
					value='<c:out value="${cri.pageNum}"/>'> <input
					type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#repInsert").on("click",function() {
			$("#repForm").attr("action","/admin/qna/repInsert");
			$("#repForm").submit();
		});
		$("#repUpdate").on("click",function() {
			$("#repForm").attr("action","/admin/qna/repUpdate");
			$("#repForm").submit();
		});
		
	});
	</script>
</body>
</html>