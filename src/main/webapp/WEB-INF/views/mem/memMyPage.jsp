<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>

</head>
<style>
.btn-sq-lg {
	width: 200px !important;
	height: 200px !important;
}
</style>

<body>
	<section class="testimonials text-center">
		<div class="container">
			<br><br><br>
			<h1 class="tit_space">마이 페이지</h1>
			<br><br>
			<div class="row">
				<div class="col-lg-12">
					<p>
						<a href="/mem/myReservationList.do" class="btn btn-sq-lg btn-primary"><br> 
						<i class="fa fa-user fa-5x"></i><br /> <br>예약 목록</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<a href="/mem/likeList.do" class="btn btn-sq-lg btn-success"><br>
						<i class="fa fa-user fa-5x"></i><br /> <br>찜 목록</a> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<a href="/mem/memInfo.do" class="btn btn-sq-lg btn-danger"><br>
						<i class="fa fa-user fa-5x"></i><br /> <br>내 정보</a>
					</p>
					<br><br><br>
				</div>
			</div>
		</div>
	</section>
</body>
</html>