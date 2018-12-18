<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">



<!-- Custom styles for this template -->
<link href="/resources/css/landing-page.min.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		/* 첨부파일 이미지 보여주기 위한 속성 추가 */
		var file = "<c:out value='${detail.sp_File}' />";
		if (file != "") {
			$("#fileImage").attr({
				src : "/uploadStorage/${detail.sp_File}",
				width : "334px",
				height : "188px"
			});
		}
	});
</script>

<style type="text/css">
header.masthead2 {
	height: 340px;
	width: 100%;
	position: relative;
	background-size: cover;
	padding-top: 78px;
	color: #fff;
}

header.masthead2 .overlay2 {
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
	/* 	opacity: .3 */
}

img {
	width: 100%;
	height: 320px;
}
</style>

</head>
<body>


	<input type="hidden" name="sp_Num" id="sp_Num" value="${detail.sp_Num}">



	<!-- Header with Background Image -->
	<header class="business-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<img src="/uploadStorage/space/${detail.sp_File}">
				</div>
			</div>
		</div>
	</header>


	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-sm-8">
				<h2 class="mt-4">${detail.sp_Name}</h2>
				<h4>공간소개</h4>
				<p>${detail.sp_Exposition}</p>
				<h4>공간 서비스</h4>	
				<p>${detail.sp_Service}</p>
				<p></p>
				<h4>공간 주소</h4>
				<p>${detail.sp_Address}</p>
				<p></p>
				<h4>교통편</h4>
				<p>${detail.sp_Traffic}</p>
				
				<br><br>
				
				<h4>'업체명의' 다른 공간</h4>
			</div>
			

			<div class="col-sm-4">
				<h3 class="mt-4">공간 예약 정보</h3>
				<address>
					<strong>${detail.sp_Type}</strong> <br>----------------------------------- <br>
					<p class="info_price_hour">
						<strong class="price"><fmt:formatNumber value="${detail.sp_Price}" /></strong> <span
							class="txt_unit">원/월</span>
							<br>       (VAT포함) <br>

					</p>
					<br>
					
					<p>
						<a class="btn btn-primary btn-lg" href="#">
						<i class="glyphicon glyphicon-earphone"></i>
						전화 &raquo;</a>
						<a class="btn btn-primary btn-lg" href="#">예약하기 &raquo;</a>
					</p>
				</address>
			</div>
		</div>
		
		
		
		
		
		
		
		<!-- /.row -->

		<div class="row">
			<div class="col-sm-4 my-4">
				<div class="card">
					<img class="card-img-top" src="http://placehold.it/300x200" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque sequi
							doloribus.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4 my-4">
				<div class="card">
					<img class="card-img-top" src="http://placehold.it/300x200" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque sequi
							doloribus totam ut praesentium aut.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4 my-4">
				<div class="card">
					<img class="card-img-top" src="http://placehold.it/300x200" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->




	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Custom scripts for all pages 스크롤 TOP만 참조함-->
	<script src="/resources/js/sb-admin.min.js"></script>

</body>
</html>