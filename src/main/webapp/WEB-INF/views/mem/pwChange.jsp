<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>

<!-- Bootstrap core CSS -->

<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<script type="text/javascript">
	$(function() {
		$("#pwChangeBtn").click(function() {
			if (!formCheck($('#mem_Id'), $('.error:eq(0)'), "아이디를"))
				return;
			else if (!formCheck($('#mem_Name'), $('.error:eq(1)'), "이름을"))
				return;
			else if (!formCheck($('#mem_Phone'), $('.error:eq(2)'), "전화번호를")) {
				return;
			} else {
				$("#pwChange").attr({
					"method" : "POST",
					"action" : "/mem/pwChange.do"
				});
				$("#pwChange").submit();
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
				<form class="form-signin" id="pwChange" name="pwChange">
					<h2 class="form-signin-heading">회원정보확인</h2>
					<label for="mem_Id" class="sr-only">아 이 디</label> <input
						type="text" id="mem_Id" name="mem_Id" class="form-control"
						placeholder="ID" required autofocus> <label for="mem_Name"
						class="sr-only">이름</label> <input type="text" id="mem_Name"
						name="mem_Name" class="form-control" placeholder="이름" required>
					<label for="mem_Phone" class="sr-only">전화번호</label> <input
						type="text" id="mem_Phone" name="mem_Phone" class="form-control"
						placeholder="전화번호" required> <input type="button"
						class="btn btn-lg btn-primary btn-block" id="pwChangeBtn"
						value="비밀번호 변경">
				</form>
			</div>
		</div>
	
</body>
</html>