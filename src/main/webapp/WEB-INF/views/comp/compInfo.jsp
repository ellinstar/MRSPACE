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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>memInfo</title>
<script type="text/javascript">
	$(function() {

		$("#comp_Edit").click(function() {
			location.href = "/comp/compModifyPw.do";
		});

		$("#comp_Cancel").click(function() {
			location.href = "/comp/compPage.do";
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1 class="tit_space" align="center">내 정보</h1>
		<br> <br>
		<div class="well">
			<form id="comp_Form" class="form-horizontal">

				<input type="hidden" id="cp_Bank" name="cp_Bank" />

				<div class="form-group form-group-sm">
					<label for="cp_Id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">${compInfo.cp_Id}</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Name" class="col-sm-2 control-label">업체명</label>
					<div class="col-sm-3">${compInfo.cp_Name}</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Ceo" class="col-sm-2 control-label">대표자명</label>
					<div class="col-sm-3">${compInfo.cp_Ceo}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Add" class="col-sm-2 control-label">소재지</label>
					<div class="col-sm-3">${compInfo.cp_Add}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Bnum" class="col-sm-2 control-label">사업자번호</label>
					<div class="col-sm-3">${compInfo.cp_Bnum}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Account" class="col-sm-2 control-label">입금계좌</label>
					<div class="col-sm-3">${compInfo.cp_Account} (${compInfo.cp_Bank})</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Phone" class="col-sm-2 control-label">연락처</label>
					<div class="col-sm-3">${compInfo.cp_Phone}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Email" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-3">${compInfo.cp_Email}</div>
				</div>
			</form>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<input type="button" value="수정하기" id="comp_Edit"
					class="btn btn-default" /> <input type="button" value="돌아가기"
					id="comp_Cancel" class="btn btn-default" />
			</div>
		</div>
	</div>
</body>
</html>
