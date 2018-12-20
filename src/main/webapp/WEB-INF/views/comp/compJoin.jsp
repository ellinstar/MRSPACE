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
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="/resources/include/js/join.js"></script> -->
<!-- <script type="text/javascript" src="/resources/include/js/common.js"></script> -->
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
			};
		};
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

<script type="text/javascript">
	
</script>

<title>Company Join</title>
</head>
<body>
	<div id="container">
		<h1>회원가입(업체)</h1>
		<div class="home">
			<form id="myForm">
				<div>
					<label for="cp_Id">아 이 디</label> <input type="text" name="cp_Id"
						id="cp_Id" placeholder="예) qwer8845"> <input type="button" id="idConfirmBtn"
						value="아이디 중복체크">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static idError"></p>
				</div>
				<div>
					<label for="cp_Pw">비밀번호</label> <input type="password" name="cp_Pw"
						id="cp_Pw" placeholder="예) asdf1234">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static pwError"></p>
				</div>
				<div>
					<label for="cp_Pw2">비밀번호 확인</label> <input type="password"
						name="cp_Pw2" id="cp_Pw2" placeholder="asdf1234">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static pw2Error"></p>
				</div>
				<div>
					<label for="cp_Name">업 체 명</label> <input type="text"
						name="cp_Name" id="cp_Name" placeholder="예) 미래공간">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static nameError"></p>
				</div>
				<div>
					<label for="cp_Ceo">대표자명</label> <input type="text" name="cp_Ceo"
						id="cp_Ceo" placeholder="예) 박지성">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static ceoError"></p>
				</div>
				<div>
					<label for="cp_Add">소 재 지</label> <input type="text" name="cp_Add"
						id="cp_Add">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static addError"></p>
				</div>
				<div>
					<label for="cp_Bnum">사업자번호</label> <input type="text"
						name="cp_Bnum" id="cp_Bnum" onkeypress="return numkeyCheck(event)"
						placeholder="예) 000-00-00000"> <input type="button" id="bNumConfirmBtn"
						value="사업자번호 확인">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static bnumError"></p>
				</div>
				<div>
					<label for="cp_Account">입금계좌</label> <input type="text"
						id="cp_Account" name="cp_Account" id="cp_account"
						onKeyPress="return numkeyCheck(event)" placeholder="예) - 포함해서 입력해주세요."> <select
						name="cp_Bank" onchange="bankDisplay(this.form)" id="cp_Bank">
						<option value="국민은행">국민은행</option>
						<option value="기업은행">기업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="신한은행">신한은행</option>
					</select>
				</div>
				<div class="col-sm-5">
					<p class="form-control-static accountError"></p>
				</div>
				<div>
					<label for="cp_Phone">연 락 처</label> <input type="text"
						name="cp_Phone" id="cp_Phone"
						onkeyPress="return numkeyCheck(event)" placeholder="예) - 제외하고 입력해주세요.">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static phoneError"></p>
				</div>
				<div>
					<label for="cp_Email">이 메 일</label> <input type="email"
						name="cp_Email" id="cp_Email" placeholder="예) sw483@naver.com">
				</div>
				<div class="col-sm-5">
					<p class="form-control-static emailError"></p>
				</div>
				<div>
					<input type="button" id="join" value="가입신청" />
					<button onclick="historyBack()">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>