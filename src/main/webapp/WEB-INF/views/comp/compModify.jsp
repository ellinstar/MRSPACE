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

<title>Update Comp!</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->

<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/member.css" /> -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/compCommon.js"></script>
<script type="text/javascript" src="/resources/include/js/compModify.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
				break;
			case 2:
				alert("회원정보 수정에 오류가 발생하였습니다. \n잠시후 다시 진행해 주세요.");
				break;
			case 3:
				alert("회원정보 수정 성공.");
				break;
			}
		}
	}

	function bankCheck() {
		var bank = "${comp2.cp_Bank}";
		/* alert("${comp2.cp_Bank}"); */
		$("#cp_Bank1").val(bank).prop("selected", "true");
	}

	// 숫자만 입력
	function numkeyCheck(e) {
		var keyValue = event.keyCode;
		if (((keyValue >= 48) && (keyValue <= 57)) || (keyValue == 45)) {
			return true;
		} else {
			alert("숫자만 입력해주세요");
			return false;
		}
	}
</script>
<style type="text/css">
#mem_Delete {
	margin-left: 200px;
}
</style>
</head>
<body>
	<c:if test="${login == null and cp_Id == null}">
		<c:redirect url="/mem/login.do" />
	</c:if>
	<div class="contentContainer">
		<h1 class="tit_space" align="center">회원정보 수정</h1>
		<br>
		<div class="well">
			<form id="comp_Form" class="form-horizontal">

				<input type="hidden" id="cp_Bank" name="cp_Bank" />

				<div class="form-group form-group-sm">
					<label for="cp_Id" class="col-sm-2 control-label">아 이 디</label>
					<div class="col-sm-3" id="cp_Id">${comp2.cp_Id}</div>
				</div>
				<!-- <div class="form-group form-group-sm">
						<label for="mem_OldPw" class="col-sm-2 control-label">기존 비밀 번호</label>
						<div class="col-sm-3">
							<input type="password" id="mem_OldPw" name="mem_OldPw" maxlength="20" class="form-control" placeholder="기존 비밀번호 입력" >
						</div>
						<div class="col-sm-5">
							<p class="form-control-static error"></p>
						</div>
					</div> -->
				<div class="form-group form-group-sm">
					<label for="cp_Pw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="cp_Pw" name="cp_Pw" maxlength="20"
							class="form-control" placeholder="변경할 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static pwError"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_PwCheck" class="col-sm-2 control-label">비밀번호
						확인</label>
					<div class="col-sm-3">
						<input type="password" id="cp_PwCheck" name="cp_PwCheck"
							maxlength="20" class="form-control" placeholder="변경할 비밀번호 입력 확인">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static pwCheckError"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Name" class="col-sm-2 control-label">업 체 명</label>
					<div class="col-sm-3">${comp2.cp_Name}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Ceo" class="col-sm-2 control-label">대표자명</label>
					<div class="col-sm-3">${comp2.cp_Ceo}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Add" class="col-sm-2 control-label">소 재 지</label>
					<div class="col-sm-3" id="cp_Add">${comp2.cp_Add}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Account" class="col-sm-2 control-label">입금계좌</label>
					<div class="col-sm-3">
						<input type="text" id="cp_Account" name="cp_Account"
							onkeypress="return numkeyCheck(event)"
							value="${comp2.cp_Account}">
					</div>
				</div>
				<%-- <c:if test="${comp2.cp_Bank == '국민은행' }">
					<option value="국민은행" selected="selected">국민은행</option>
				</c:if>
				<option value="국민은행">국민은행</option>
				<c:if test="${comp2.cp_Bank == '기업은행' }">
					<option value="기업은행" selected="selected">기업은행</option>
				</c:if>
				<option value="기업은행">기업은행</option>
				<c:if test="${comp2.cp_Bank == '우리은행' }">
					<option value="우리은행" selected="selected">우리은행</option>
				</c:if>
				<option value="우리은행">우리은행</option>
				<c:if test="${comp2.cp_Bank == '신한은행' }">
					<option value="신한은행" selected="selected">신한은행</option>
				</c:if>
				<option value="신한은행">신한은행</option> --%>
				<div class="form-group form-group-sm">
					<label for="cp_Bank1" class="col-sm-2 control-label">입금은행</label>
					<div class="col-sm-2">
						<select name="cp_Bank1" id="cp_Bank1" class="form-control">
							<option value="국민은행">국민은행</option>
							<option value="기업은행">기업은행</option>
							<option value="우리은행">우리은행</option>
							<option value="신한은행">신한은행</option>
						</select>
					</div>
				</div>
				<!-- <div class="col-sm-3">
					<p class="form-control-static accountError"></p>
				</div> -->
				<!-- <div class="form-group form-group-sm">
					은행
					<div class="col-sm-2"> -->
				<div class="form-group form-group-sm">
					<label for="cp_Phone" class="col-sm-2 control-label">연 락 처</label>
					<div class="col-sm-3">
						<input type="text" id="cp_Phone" name="cp_Phone" maxlength="11"
							class="form-control" value="${comp2.cp_Phone}"
							onKeyPress="return numkeyCheck(event)">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static phoneError"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="cp_Email" class="col-sm-2 control-label">이 메 일</label>
					<div class="col-sm-3">
						<input type="email" id="cp_Email" name="cp_Email" maxlength="30"
							class="form-control" value="${comp2.cp_Email}">
					</div>
					<div class="col-sm-3">
						<p class="form-control-static EmailError"></p>
					</div>
				</div>
			</form>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<input type="button" value="수정하기" id="comp_Submit"
					class="btn btn-default" /> <input type="button" value="돌아가기"
					id="comp_Cancel" class="btn btn-default" />
			</div>
		</div>
	</div>
</body>
</html>
