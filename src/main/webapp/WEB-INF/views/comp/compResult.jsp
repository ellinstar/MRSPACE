<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
			<div class="row">
				<div class="mb-5">
					<form class="form-signin">
						<br>
						<p>회원님의 아이디는 ${cpId} 입니다.</p>


					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>