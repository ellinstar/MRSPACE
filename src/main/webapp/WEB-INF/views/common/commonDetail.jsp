<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


<link rel="stylesheet" href="/resources/popup/needpopup.min.css">


<!-- 구글지도 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("maps", "3.4", {
		other_params : "sensor=false&language=kr"
	});
</script>
<script type="text/javascript"
	src="/resources/include/js/jquery.googlemap.js"></script>


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

body {
	background-color: #f5f5f5;
}

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

@font-face {
	font-family: 'NanumBarunGothicBold';
	src: url('resources/fonts/NanumBarunGothicBold.ttf'); /* 폰트파일 주소 */
}

.info_area {
	border-top: 3px solid #0e63ff;
	border-bottom: 3px solid #0e63ff;
	position: relative;
	padding: 18px 20px 14px;
	background-color: #fff;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-overflow: ellipsis;
	height: 295px;
	margin-top: 20px;
	margin-left: 85px;
}

.info_area .tit_space {
	padding-bottom: 7px;
	font-size: 24px;
	line-height: 23px;
}

.info_area .info_price_hour {
	height: 23px;
	padding-top: 3px;
	margin-top: 11px;
	font-size: 12px;
}

.info_area .info_price_hour .price {
	
}

.info_area .info_price_hour .price {
	font-size: 23px;
	font-family: "NanumBarunGothicBold", sans-serif;
	color: #0069d9;
}

.txt_vat {
	font-family: "NanumBarunGothicBold", sans-serif;
	text-align: right;
	font-size: 14px;
	color: #999;
}

.host_profile {
	position: relative;
	width: 100%;
}

.sp_name {
	font-family: "NanumBarunGothicBold";
	vertical-align: top;
	font-size: 24px;
	line-height: 26px;
	color: #000;
}

.sp_location {
	padding-bottom: 18px;
	margin-bottom: 20px;
	border-bottom: 1px solid #ebebeb;
	font-size: 15px;
	color: #656565;
	word-break: break-all;
}

.btn_rounded {
	height: 50px;
	color: #704de4;
	line-height: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}

.btn {
	display: inline-block;
	text-align: center;
	font-size: 20px;
}

.host_profile .row .col4 {
	width: 50%;
	padding: 0 6px;
}

.wrapper {
	padding: 40px 60px;
}

p {
	font-size: 1.2em;
	line-height: 1.4;
	color: #343638;
	margin: 20px 0;
}

.needpopup {
	border-radius: 6px;
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
}

.needpopup p {
	margin: 0;
}

.needpopup p+p {
	margin-top: 10px;
}
</style>

</head>
<script type="text/javascript">
$(function() {
	$("#reserv").click(function() {
	<%session.removeAttribute("reserv");%>
});
</script>

<body>


	<input type="hidden" name="sp_Num" id="sp_Num" value="${detail.sp_Num}">
	<input type="hidden" id="cp_Num" name="cp_Num" value="${detail.cp_Num}" />

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
				<br>
				<h5>공간소개</h5>
				<p>${detail.sp_Exposition}</p>
				<br>
				<h5>공간 서비스</h5>
				<p>${detail.sp_Service}</p>
				<p></p>
				<br>
				<h5>공간 주소</h5>

				<!-- 공간주소 -->
				<div class="host_profile" id="_host_map">
					<div class="inner">
						<div class="sp_location">
							<input type="hidden" name="spcLat" id="spcLat" value="37.487766">
							<input type="hidden" name="spcLng" id="spcLng" value="127.0132">

							<p class="sp_address">${detail.sp_Address}</p>
						</div>

					</div>

					<!-- 구글지도 마커표시 -->
					<div id="map2" style="width: 700px; height: 450px;"></div>
					<script type="text/javascript">
						$(function() {
							$("#map2").googleMap();
							$("#map2").addMarker({
								coords : [ 37.5457747, 126.9828226 ], // Map center
								url : 'http://www.blueb.co.kr',
								id : 'marker1'
							});
						})
					</script>


					<!-- 네이버지도 -->
					<!-- 	<div class="map" id="_map" _lat="37.487766" _lng="127.0132">
						<img id="_detailStaticMap" class="lazy"
							src="https://ssl.map.naver.com/staticmap/image?version=1.1&amp;crs=EPSG:4326&amp;center=127.0132,37.487766&amp;level=12&amp;baselayer=default&amp;overlayer=ol_vc_an&amp;exception=blank&amp;markers_icon=type,scloud,127.0132,37.487766&amp;scale=1&amp;caller=scloud&amp;format=jpeg&amp;dataversion=142.0&amp;w=761&amp;h=640"
							width="761" height="640">
						<div id="_mapLayer"></div>

					</div> -->
				</div>
				<p></p>
				<br>
				<h5>교통편</h5>
				<p>${detail.sp_Traffic}</p>

				<br> <br>

				<h5>'업체명의' 다른 공간</h5>
			</div>


			<div class="info_area">
				<h5 class="mt-4">공간 예약 정보</h5>
				<address>
					<strong>${detail.sp_Type}</strong> <br>───────────────────<br>
					<p class="info_price_hour">
						<strong class="price"><span class="txt_sign">\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<fmt:formatNumber value="${detail.sp_Price}" /></strong> <span
							class="txt_unit">/1개월</span> <br> <span class="txt_vat">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(VAT포함)</span>
						<br>

					</p>
					<br>

					<p>
						<a class="btn btn-primary btn-lg" href="#" data-needpopup-show="#small-popup"> <i
							class="glyphicon glyphicon-earphone"></i> 전화 &raquo;
						</a> <a class="btn btn-primary btn-lg" id="reserv"
							href="/reserv/reservation.do">예약하기 &raquo;</a>
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


	<!-- 전화 popup 모달창 -->
	<div class="wrapper">


		<div id='small-popup' class="needpopup">
			<p>"코워킹스페이스를 통해 연락드렸어요~" 라고 말씀하시면 더 친절하게 안내 받으실 수 있습니다. :)</p>
			<p>-------------------------------------------------------------------------</p>
			<h2>${detail.sp_Name}</h2>
			<%-- <h2>${detail.cp_Phone}</h2> --%>
			<p>PHONE : ${detail.cp_Phone}</p>
		</div>
	</div>

	<script src="/resources/popup/needpopup.min.js"></script>
	<script>
		needPopup.config.custom = {
			'removerPlace' : 'outside',
			'closeOnOutside' : false,
			onShow : function() {
				console.log('needPopup is shown');
			},
			onHide : function() {
				console.log('needPopup is hidden');
			}
		};
		needPopup.init();
	</script>
	<!-- 전화 popup 모달창 끝 -->

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