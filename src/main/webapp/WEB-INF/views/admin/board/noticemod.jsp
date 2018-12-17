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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="contentContainer">
		<div class="panel-heading"><h3>작성된 공지사항 확인</h3></div>

		<div class="panel-body">
			<form role="form" action="/admin/notice/noticeUpdate" method="post" enctype="multipart/form-data">
					<input type="hidden" id="nt_num" name="nt_num" value="${updateData.nt_num}" />
					<input type="hidden" name="nt_file" id="nt_file" value="${updateData.nt_file}" />
					<input type="hidden" name="page" id="page" value="${param.page}"/>
					<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
			
				<div class="form-group">
					<label>제목</label> <input class="form-control" name='nt_title'
					value='<c:out value="${updateData.nt_title}"/>'>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="30" name='nt_content'><c:out value="${updateData.nt_content}"/></textarea>
				</div>
				<div class="form-group">
					<label>첨부파일</label> <input type="file" class="form-control" name='file' id="file">
					<span id="imgView">${updateData.nt_file}<span id="imgArea"></span> </span>
				</div>
			</form>
				<button type="submit" data-oper='modify' class="btn btn-default">
					수정하기
				</button>

				<button class="btn btn-default" data-oper='list' id="boardListBtn">목록</button>
		</div>

	</div>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	var value="${updateData.nt_file}";
	if(value !=""){
		var img = $("<img>");
		$("#imgView").hover(function () {
			img.attr({
				src:"/uploadStorage/notice/${updateData.nt_file}",width:"450px", height:"200px"
			});
			img.addClass("imgViewData");
			$('#imgArea').append(img);
		}, function() {
			img.remove();
		});
		}else{
			$('#imgView').hide();
		}
	

	$('button').on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		if(operation === 'list'){
			formObj.attr("action","/admin/notice/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
	
});


</script>
</body>
</html>