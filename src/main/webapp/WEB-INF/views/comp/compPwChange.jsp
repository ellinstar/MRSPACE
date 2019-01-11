<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/signin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/compCommon.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pwChangeBtn").click(function() {
			if (!formCheck($('#cp_Id'), $('.error:eq(0)'), "아이디를")) {
				return;
			} else if (!formCheck($('#cp_Name'), $('.error:eq(1)'), "업체명을")) {
				return;
			} else if (!formCheck($('#cp_Ceo'), $('.error:eq(2)'), "대표자명을")) {
				return;
			} else if (!formCheck($('#cp_Bnum'), $('.error:eq(3)'), "사업자번호를")) {
				return;
			} else {
				$("#compPwChange").attr({
					"method" : "POST",
					"action" : "/comp/compPwChange.do"
				});
				$("#compPwChange").submit();
			}
		});
	});

	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 9:
				alert("존재하지 않는 사용자 입니다.");
				break;
			}
		}

	}
</script>
</head>
<body>
	<div class="contentContainer">
		<div id="pwChangeDiv">
			<form class="form-signin" id="compPwChange" name="compPwChange">
				<h2 class="form-signin-heading">업체정보확인</h2>
				<label for="cp_Id" class="sr-only">아 이 디</label> <input type="text"
					id="cp_Id" name="cp_Id" class="form-control" placeholder="ID"
					required autofocus> <label for="cp_Name" class="sr-only">업체명</label>
				<input type="text" id="cp_Name" name="cp_Name" class="form-control"
					placeholder="업체명" required> <label for="cp_Ceo"
					class="sr-only">대표자명</label> <input type="text" id="cp_Ceo"
					name="cp_Ceo" class="form-control" placeholder="대표자명" required>
				<label for="cp_Bnum" class="sr-only">사업자번호</label> <input
					type="text" id="cp_Bnum" name="cp_Bnum" class="form-control"
					placeholder="사업자번호" required> <input type="button"
					class="btn btn-lg btn-primary btn-block" id="pwChangeBtn"
					value="비밀번호 변경">
			</form>
		</div>
	</div>
</body>
</html>