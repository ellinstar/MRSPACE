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

<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#memSearchBtn").click(function() {
		if (!formCheck($('#mem_Name'), $('.error:eq(0)'), "이름을"))
			return;
		else if (!formCheck($('#mem_Phone'), $('.error:eq(1)'), "전화번호를")){
			return;
		}else{
		$("#memSearch").attr({
			"method" : "POST",
			"action" : "/mem/memSearch.do"
		});
			$("#memSearch").submit();
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
		<h3 class="form-signin-heading">아이디 / 비밀번호 찾기</h3>
		<div class="contentContainer">
			<div class="row" id="memLogin">
				<form class="form-signin" id="memSearch" name="memSearch">
					<br>
					<h6>아이디 찾기</h6>
					<label for="mem_Name" class="sr-only">이&nbsp;름 </label>
					<input	type="text" id="mem_Name" name="mem_Name" class="form-control"	placeholder="이 름" required autofocus> 
					<label	for="mem_Phone" class="sr-only">휴대폰 번호</label>
					<input type="text" id="mem_Phone" name="mem_Phone" class="form-control"	placeholder="휴대폰 번호" required> 
					<input type="button" class="btn btn-lg btn-primary btn-block" id="memSearchBtn" value="확인">
				</form>
			</div>
		</div>
</body>
</html>