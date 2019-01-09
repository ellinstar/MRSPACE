<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%-- <%@ page trimDirectiveWhitespaces="true"%> --%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/css/comp.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/compJoin.js"></script>
<script src="/resources/include/js/compCommon.js"></script>
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
			;
		}
		;
	};

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
.navbar-nav {
	float: left;
	/* margin: 0 auto; */
	margin-right: -200px;
}

.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
	{
	margin-left: -220px;
}
</style>
<script type="text/javascript">
	
</script>

<title>Company Join</title>
<script type="text/javascript">
	document.title = 'MRSPACE : 업체회원가입';
</script>
</head>
<body>
	<div id="contentContainer">
		<h1 class="tit_space" align="center">회원가입(업체)</h1>
		<br>
		<div class="well">
			<form id="myForm" class="form-horizontal">

				<div class="form-group form-group-sm">
					<label for="cp_Id" class="col-sm-2 control-label">아 이 디</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Id" id="cp_Id"
							placeholder="예) qwer8845" class="form-control">
					</div>
					<div class="col-sm-2">
						<input type="button" id="idConfirmBtn" value="중복확인"
							class="btn btn-primary" />
					</div>
					<div class="col-sm-5">
						<p class="form-control-static idError"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Pw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="cp_Pw" id="cp_Pw"
							placeholder="예) asdf1234" class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static pwError"></p>
					</div>
				</div>


				<div class="form-group form-group-sm">
					<label for="cp_Pw2" class="col-sm-2 control-label">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="cp_Pw2" id="cp_Pw2"
							placeholder="예) asdf1234" class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static pw2Error"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Name" class="col-sm-2 control-label">업 체 명</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Name" id="cp_Name"
							placeholder="예) 미래공간" class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static nameError"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Ceo" class="col-sm-2 control-label">대표자명</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Ceo" id="cp_Ceo" placeholder="예) 박지성"
							class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static ceoError"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Add" class="col-sm-2 control-label">소 재 지</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Add" id="cp_Add" class="form-control"
							placeholder="예) 서울시 성동구 무학로2길 54">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static addError"></p>
					</div>
				</div>

				<div class="form-group form-group-sm">
					<label for="cp_Bnum" class="col-sm-2 control-label">사업자번호</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Bnum" id="cp_Bnum"
							onkeypress="return numkeyCheck(event)"
							placeholder="예) 000-00-00000" class="form-control">
					</div>
					<div class="col-sm-2">
						<input type="button" id="bNumConfirmBtn" value="중복확인"
							class="btn btn-primary" />
					</div>
					<div class="col-sm-5">
						<p class="form-control-static bnumError"></p>
					</div>
				</div>


				<div class="form-group form-group-sm">
					<label for="cp_Account" class="col-sm-2 control-label">입금계좌</label>
					<div class="col-sm-3">
						<input type="text" id="cp_Account" name="cp_Account"
							id="cp_account" onKeyPress="return numkeyCheck(event)"
							placeholder="예) 3333-06-8802212" class="form-control">
					</div>
					<div class="col-sm-2">
						<select class="form-control" name="cp_Bank"
							onchange="bankDisplay(this.form)" id="cp_Bank">
							<option value="국민은행">국민은행</option>
							<option value="기업은행">기업은행</option>
							<option value="우리은행">우리은행</option>
							<option value="신한은행">신한은행</option>
						</select>
					</div>
					<div class="col-sm-5">
						<p class="form-control-static accountError"></p>
					</div>
				</div>


				<div class="form-group form-group-sm">
					<label for="cp_Phone" class="col-sm-2 control-label">연 락 처</label>
					<div class="col-sm-3">
						<input type="text" name="cp_Phone" id="cp_Phone"
							onkeyPress="return numkeyCheck(event)"
							placeholder="예) 01012345678" class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static phoneError"></p>
					</div>
				</div>


				<div class="form-group form-group-sm">
					<label for="cp_Email" class="col-sm-2 control-label">이 메 일</label>
					<div class="col-sm-3">
						<input type="email" name="cp_Email" id="cp_Email"
							placeholder="예) sw483@naver.com" class="form-control">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static emailError"></p>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" id="join" value="가입신청"
							class="btn btn-default" /> <input type="button" value="돌아가기"
							id="cp_Cancel" class="btn btn-default" />
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>