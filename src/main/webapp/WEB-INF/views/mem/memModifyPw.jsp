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
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
				break;
			}
		}
	}

	$(function() {

		errCodeCheck();

		$("#mem_Submit").click(function() {
			if (!formCheck($('#mem_OldPw'), $('.error:eq(0)'), "비밀번호를")) {
				return;
			} else if (!inputVerify(1, '#mem_OldPw', '.error:eq(0)')) {
				return;

			} else {
				$("#mem_Form").attr({
					"method" : "POST",
					"action" : "/mem/memModifyPw.do"
				});
				$("#mem_Form").submit();
			}
		});
	});
</script>

</head>
<body>
	<section class="testimonials text-center bg-light">
		<div class="contentContainer">
			<h1 class="tit_space">비밀번호 확인</h1>
			<br>
			<br>
			<br>
			<div class="row" id="memMP">
				<form class="form-signin" id="mem_Form" name="mem_Form">
					<br> <label for="mem_OldPw">비밀번호</label> <input
						type="password" id="mem_OldPw" name="mem_OldPw" required autofocus>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
					<input type="button" class="btn btn-default" id="mem_Submit"
						value="확인">
				</form>
			</div>
		</div>
	</section>
</body>
</html>