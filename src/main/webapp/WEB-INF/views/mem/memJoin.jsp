<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Join Mem!</title>

<!-- Bootstrap core CSS -->
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> -->

<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/join.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != '') {
			switch (parseInt(errCode)) {
			case 1:
				alert("이미 가입된 회원입니다!");
				break;
			case 2:
				alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.");
				break;
			}
		}
	}
</script>
</head>
<body>

	<div class="contentContainer">
		<h1 class="tit_space" align="center">회원가입</h1>
		<br>
		<div class="well">
			<form id="mem_Form" class="form-horizontal">

				<input type="hidden" id="mem_Job" name="mem_Job" />

				<div class="form-group form-group-sm">
					<label for="mem_Id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Id" name="mem_Id" maxlength="20"
							class="form-control" placeholder="예) LeeSanghyun123" />
					</div>
					<div class="col-sm-2">
						<input type="button" id="idConfirmBtn" value="중복확인"
							class="btn btn-primary" />
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Pw" class="col-sm-2 control-label">비밀 번호</label>
					<div class="col-sm-3">
						<input type="password" id="mem_Pw" name="mem_Pw" maxlength="20"
							class="form-control" placeholder="예) abcd1234">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_PwCheck" class="col-sm-2 control-label">비밀번호
						확인</label>
					<div class="col-sm-3">
						<input type="password" id="mem_PwCheck" name="mem_PwCheck"
							maxlength="20" class="form-control" placeholder="예) abcd1234">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="mem_Name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Name" name="mem_Name" maxlength="10"
							class="form-control" placeholder="예) 이상현">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="mem_Birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Birth" name="mem_Birth" maxlength="8"
							class="form-control" placeholder="예) 19900218">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="mem_Phone" class="col-sm-2 control-label">핸드폰</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Phone" name="mem_Phone" maxlength="11"
							class="form-control" placeholder="예) 01012345678">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="mem_Email" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-3">
						<input type="email" id="mem_Email" name="mem_Email" maxlength="30"
							class="form-control" placeholder="예) leesanghyun@naver.com">
					</div>
					<div class="col-sm-3">
						<p class="form-control-static error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="job" class="col-sm-2 control-label">직종</label>
					<div class="col-sm-2">
						<select id="job" class="form-control">
							<option value="IT개발자">IT개발자</option>
							<option value="토목/건축">토목/건축</option>
							<option value="교수/강사">교수/강사</option>
							<option value="법률/행정">법률/행정</option>
							<option value="경영/인사">경영/인사</option>
							<option value="금융/보험">금융/보험</option>
							<option value="예술/스포츠">예술/스포츠</option>
							<option value="디자이너">디자이너</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="회원가입" id="mem_Submit"
							class="btn btn-default" /> <input type="button" value="돌아가기"
							id="mem_Cancel" class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
