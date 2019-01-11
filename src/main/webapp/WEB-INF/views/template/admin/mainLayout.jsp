<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>

<html lang="ko">
<c:choose>
	<c:when test="${adminId != null}">
		<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title><tiles:getAsString name="title" /></title>

<!-- Bootstrap core CSS-->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<style type="text/css">
.row {
	
}

.content-wrapper {
	padding-left: 10px;
	overflow-x: hidden;
	width: 100%;
	padding-top: 1rem;
	padding-bottom: 80px;
}
</style>
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>
<script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="/resources/js/demo/datatables-demo.js"></script>
<script src="/resources/js/demo/chart-area-demo.js"></script>
		</head>

		<body id="page-top">

			<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
				<tiles:insertAttribute name="header" />
			</nav>
			<div id="wrapper">

				<tiles:insertAttribute name="left" />


				<div id="content-wrapper">
					<tiles:insertAttribute name="sub" />
					<%--<tiles:insertAttribute name="main" /> --%>
				</div>
			</div>


		</body>
	</c:when>

	<c:when test="${adminId == null}">
		<head>

<title>관리자 로그인</title>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

		</head>
		<body class="bg-dark">
			<div>
				<div style="text-align: center;">
					<img id="logoimg" alt="" src="/resources/img/spacelogo_white.png"
						style="width: 360px; margin: 0 auto;">
				</div>
				<div class="container">
					<div class="card card-login mx-auto mt-5">
						<div class="card-header" style="text-align: center;">Please
							ADMIN sign in</div>
						<div class="card-body">
							<h2>
								<c:out value="${error}" />
							</h2>
							<h2>
								<c:out value="${logout}"></c:out>
							</h2>
							<c:choose>
								<c:when test="${adminId == null}">
									<div class="container">
										<form class="form-signin" id="adloginForm">
											<label for="adminId" class="sr-only">관리자아이디</label> <input
												type="text" name="adminId" class="form-control" id="adminId"
												placeholder="adminID" required autofocus> <label
												for="adminPw" class="sr-only">관리자비밀번호</label> <input
												type="password" name="adminPw" class="form-control"
												id="adminPw" placeholder="Password" required>
											<div class="checkbox">
												<label> <!--   <input type="checkbox" value="remember-me"> Remember me -->
												</label>
											</div>
											<input type="submit" class="btn btn-lg btn-primary btn-block"
												id="adloginBtn" value="로그인"> <a href="/"
												style="margin-top: 10px; text-align: center;">←
												MRSPACE(으)로 돌아기기</a> <input type="hidden"
												name="${_csrf.parameterName}" value="${_csrf.token}">
										</form>
									</div>
								</c:when>

								<c:when test="${adminId != null}">
									<c:redirect url="/admin/main" />
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>


			<!-- /container -->
			<script type="text/javascript">
				$(function() {
					/*
					 * 로그인 버튼 클릭 시 처리 이벤트
					 */
					$("#adloginBtn").click(function() {
						$("#adloginForm").attr({
							"method" : "POST",
							"action" : "/adminlogin"
						});
						$("#adloginForm").submit();
					});
				});
			</script>

			<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
				<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	</c:when>
</c:choose>
</html>