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
	<div class="contentContainer">
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
					<label>작성자</label>
					<input class="form-control" name="qna_name" value='<c:out value="${detail.qna_Name}"/>'/>
				</div>
				<div class="col-md-6">
					<label>작성일</label>
					<input class="form-control" name="qna_date" value='<c:out value="${detail.qna_Date}"/>'/>
				</div>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="30" name='qna_content'
					readonly="readonly"><c:out value="${detail.qna_Content}" />
					
				</textarea>
			</div>
			<%-- <c:if test=>
			</c:if> --%>
			<button id="ntModFormBtn" class="btn btn-default">Modify</button>
			<button id="ntDelBtn" class="btn btn-default">Delete</button>

			<a class="btn btn-default" id="boardListBtn" href="/admin/qna/list">목록</a>

			<form name="f_data" id="f_data" method="get">
				<input type="hidden" name="qna_num" id="qna_num" value="${detail.qna_Num}" /> 
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			</form>

		</div>

	</div>
</body>
</html>