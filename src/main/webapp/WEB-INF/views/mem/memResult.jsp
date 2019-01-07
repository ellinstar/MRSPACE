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

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#memSearchBtn").click(function() {
			alert($("#mem_Name").val());
			$("#memSearch").attr({
				"method" : "POST",
				"action" : "/mem/memSearch.do"
			});
			$("#memSearch").submit();
		});
	});
</script>


<style type="text/css">
.features-icons {
	margin-left: 250px;
}
</style>

</head>

<body>
	<section class="features-icons">
		<h3 class="form-signin-heading">아이디 찾기</h3>
		<div class="contentContainer">
			<div class="row" id="memLogin">
				<div class="mb-5">
					<form class="form-signin" id="memSearch" name="memSearch">
						<br>
						<p>회원님의 아이디는 ${memId} 입니다.</p>


					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>