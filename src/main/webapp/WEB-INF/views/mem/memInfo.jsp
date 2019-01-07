<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap core CSS -->
<link href="/resources/include/css/mem.css" rel="stylesheet">

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>memInfo</title>

<script type="text/javascript">
	$(function() {

		$("#mem_Edit").click(function() {
			location.href = "/mem/memModifyPw.do";
		});

		$("#mem_Cancel").click(function() {
			location.href = "/mem/memMyPage.do";
		});
	});
</script>

</head>

<body>

	<div class="container">
		<h1 class="tit_space" align="center">내 정보</h1>
		<br> <br> <br>
		<div class="well">
			<form id="mem_Form" class="form-horizontal">

				<input type="hidden" id="mem_Job" name="mem_Job" />

				<div class="form-group form-group-sm">
					<label for="mem_Id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">${mem.mem_Id}</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="mem_Name" class="col-sm-2 control-label">회원이름</label>
					<div class="col-sm-3">${mem.mem_Name}</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">${mem.mem_Birth}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Phone" class="col-sm-2 control-label">핸드폰
						번호</label>
					<div class="col-sm-3">${mem.mem_Phone}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Email" class="col-sm-2 control-label">회원
						이메일</label>
					<div class="col-sm-3">${mem.mem_Email}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Job" class="col-sm-2 control-label">직종</label>
					<div class="col-sm-3">${mem.mem_Job}</div>
				</div>
			</form>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<input type="button" value="수정하기" id="mem_Edit"
					class="btn btn-default" /> <input type="button" value="돌아가기"
					id="mem_Cancel" class="btn btn-default" />
			</div>
		</div>
	</div>
</body>
</html>
