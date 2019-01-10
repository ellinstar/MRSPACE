<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<div class="contentContainer"  style="width: 85%; margin-left:3%; margin-top: 25px; ">
		<div class=""page-header"><h3>공지사항 작성</h3></div>

		<div class="panel-body">
			<form role="form" method="post" name="noticewrForm" id="noticewrForm" action="/admin/notice/noticeInsert" enctype="multipart/form-data">
				<div class="form-group">
					<label>제목</label> <input class="form-control" name='nt_title'>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="15" name='nt_content'></textarea>
				</div>
				<div class="form-group">
					<label>첨부파일</label> <input type="file" class="form-control" name='file' id="file">
				</div>
				<input type="hidden" id="ad_num" name="ad_num" value="2" >
				<input type="hidden" id="nt_views" name="nt_views" value="0">
				<button type="submit" class="btn btn-default" id="boardInsertBtn">저장</button>
				<a class="btn btn-default" id="boardListBtn" href="/admin/notice/list">목록</a>
			</form>
		</div>

	</div>
	
</body>
</html>