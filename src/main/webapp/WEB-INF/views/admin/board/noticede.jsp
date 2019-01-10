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
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link href="/resources/css/landing-page.min.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	$("#ntModFormBtn").click(function() {
		$("#f_data").attr("action", "/admin/notice/updateForm");
		$("#f_data").submit();
	});
	$("#ntDelBtn").click(function() {
		var con = confirm("이 게시글을 삭제합니다 ");
		if(con == true){
			$("#f_data").attr("action", "/admin/notice/noticeDelete");
			$("#f_data").submit();
		}
		
	});
	 /* 첨부파일 보여주기 */
	/*var file="<c:out value='${detail.nt_file}'/>";
	if(file != ""){
		$("#fileImage").attr({
			src:"/uploadStorage/notice/${detail.nt_file}", width:"450px", height:"200px"
		});
	} */
});
</script>
</head>
<body>
	<div class="contentContainer" style="width: 85%; margin-left:3%; margin-top: 25px;">
		<div class="panel-heading"><h3>작성된 공지사항 확인</h3></div>

		<div class="panel-body">
			
				<div class="form-group">
					<label>제목</label> <input class="form-control" name='nt_title'
					value='<c:out value="${detail.nt_title}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<div class="form-control" id='nt_content' style="height: 100%;">
						<p>
					${detail.nt_content}"
					</p>
					</div>
				</div>
				<div class="form-group">
				<c:if test="${detail.nt_file != '' }">
					<label>첨부파일</label> 
					<img id="fileImage" src="/uploadStorage/notice/${detail.nt_file}">
				</c:if>
				</div>
				<button id="ntModFormBtn" class="btn btn-default">
					Modify
				</button>
				<button id="ntDelBtn" class="btn btn-default">
					Delete
				</button>

				<a class="btn btn-default" id="boardListBtn" href="/admin/notice/list">목록</a>
				
				<form name="f_data" id="f_data" method="get">
			<input type="hidden" name="nt_num" id="nt_num" value="${detail.nt_num}"/>
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name="nt_file" id="nt_file" value="/uploadStorage/notice/${detail.nt_file}" />
		</form>
			
		</div>

	</div>

</body>
</html>