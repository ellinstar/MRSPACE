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
	rel="stylesheet" id="bootstrap-css">
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
<!-- 아이콘CSS -->
<!-- <link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
 -->

<link rel="stylesheet" href="/resources/popup/needpopup.min.css">

<!-- 찜목록 -->
<script src="/resources/include/js/like.js"></script>

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
<script type="text/javascript">
	$(function() {
		// 검색 후 검색 대상과 단어 출력
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			/* $("#search").val("<c:out value='${data.search}'/>"); */

			/* if ($("#search").val() != 'sp_Name') {
			   // :contains()는 특정 테스트를 포함한 요소반환
			   if ($("#search").val() == 'sp_Name')
			      value = "#list tr td.goDetail";
			   else if ($("#search").val() == 'sp_Name')
			      value = "#list tr td.name";
			   $(value + ":contains('" + word + "')").each(
			         function() {
			            var regex = new RegExp(word, 'gi');
			            $(this).html(
			                  $(this).text().replace(
			                        regex,
			                        "<span class='required'>" + word
			                              + "</span"));
			         });
			} */
		}

		// 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정
		if ("<c:out value='${data.pageSize}' /> " != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		// 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* // 검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function() {
		   if ($("#search").val() == "all") {
		      $("#keyword").val("전체 데이터 조회합니다.");
		   } else if ($("#search").val() != "all") {
		      $("#keyword").val("");
		      $("#keyword").focus();
		   }
		}); */

		// 검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function() {
			if (!chkSubmit($('#keyword'), "검색어를")) {
				return;
			}
			goPage(1);
		});

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 - X
		$(".goDetail2").click(function() {
			var sp_Num = $(this).parents("div").attr("data-num");
			$("#sp_Num").val(sp_Num);
			console.log("글번호 : " + sp_Num);
			// 상세 페이지로 이동하기 위해 form추가 (id : detailForm)
			$("#detailForm").append("<input type='hidden' name='sp_Num' value='${space.sp_Num}'/>");
			
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/common/commonDetail.do"
			});
			
			$("#detailForm").submit();
		});
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		$("#page").val(page);
		$("#sp_Search").attr({
			"method" : "get",
			"action" : "/common/commonList.do"
		});
		$("#sp_Search").submit();
	}

	/* 전체목록 불러오기 */
	function spaceAll() {
		location.href = "/common/commonList.do";
	}
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
	position: relative;
	background-size: cover;
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
	padding-bottom: 0px;
	margin-bottom: 0px;
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
	font-size: 1em;
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

<!-- 다음 지도 CSS -->
<style>
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>


<!-- 이미지 줌 CSS -->
<style type="text/css">
/* @import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300); */

/* Zoom In #1 */
.col-lg-4 div img {
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .2s ease-in-out;
	transition: .2s ease-in-out;
}

.col-lg-4 div:hover img {
	-webkit-transform: scale(1.2);
	transform: scale(1.2);
}

.info_area2 {
	position: relative;
	padding: 18px 20px 14px;
	background-color: #fff;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.info_area2 .tit_space {
	padding-bottom: 7px;
	font-size: 21px;
	line-height: 23px;
}

.info_area2 .info_price_hour2 {
	height: 23px;
	padding-top: 3px;
	margin-top: 11px;
	font-size: 12px;
}

.info_area2 .info_price_hour2 .price {
	
}

.info_area2 .info_price_hour2 .price {
	font-size: 23px;
	font-family: "NanumBarunGothicBold", sans-serif;
	color: #0069d9;
}

.inner_width, .pc .intro+.section_cont {
	width: 1158px;
}

.sorting_filter {
	position: absolute;
	top: 210px;
	right: 420px;
	background-color: #fff;
	width: 154px;
	height: 40px;
}

.filter_area .sorting_filter select {
	position: relative;
	height: 50px;
	opacity: 0;
}

.filter_area .sorting_filter label {
	top: 11px;
	font-size: 14px;
}

.filter_area .sorting_filter label {
	position: absolute;
	top: 16px;
	right: 0;
	left: 0;
	font-size: 13px;
}

button#like {
	font-size: 11px;
	float: right;
	margin-right: 7px;
}

a.btn.btn-primary {
	font-size: 1rem;
}

input#joinBtn {
	font-size: 1rem;
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

	<input type="hidden" name="sp_Num" id="sp_Num" value="${space.sp_Num }">
	<%-- 	<input type="hidden" name="sp_Num" id="sp_Num" value="${detail.sp_Num}"> --%>
	<input type="hidden" id="cp_Num" name="cp_Num" value="${detail.cp_Num}" />

	<!-- Header with Background Image -->
	<img src="/uploadStorage/space/${detail.sp_File}">


	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-sm-8">
				<h2 class="mt-4">${detail.sp_Name}</h2>
				<br>
				<div class="alert alert-info" role="alert">
					<strong><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">공간소개</font></font></strong><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</div>

				<p>${detail.sp_Exposition}</p>
				<br>
				<div class="alert alert-info" role="alert" style="width: 1062px;">
					<strong><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">공간서비스</font></font></strong><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</div>
				<p>${detail.sp_Service}</p>
				<p></p>
				<br>
				<div class="alert alert-info" role="alert" style="width: 1062px;">
					<strong><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">공간주소</font></font></strong><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</div>
				<!-- 공간주소 -->
				<div class="host_profile" id="_host_map">
					<div class="inner">
						<div class="sp_location">
							<input type="hidden" name="spcLat" id="spcLat" value="37.487766">
							<input type="hidden" name="spcLng" id="spcLng" value="127.0132">

							<p class="sp_address">${detail.sp_Address}</p>
						</div>

					</div>

					<!-- 지도div -->
					<div id="map" style="width: 1060px; height: 400px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23e208b11117bed56607098ecaaedb24"></script>
					<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = { 
        center: new daum.maps.LatLng(${detail.sp_Y}, ${detail.sp_X}), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

var imageSrc = '/resources/img/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(${detail.sp_Y}, ${detail.sp_X}); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
  position: markerPosition,
  image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
var content = '<div class="customoverlay">' +
    '  <a href="http://localhost/">' +
    '    <span class="title">${detail.sp_Name}</span>' +
    '  </a>' +
    '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new daum.maps.LatLng("${detail.sp_Y}", "${detail.sp_X}");  

// 커스텀 오버레이를 생성합니다
var customOverlay = new daum.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
    yAnchor: 1 
});
</script>
				</div>
				<p></p>
				<br>
				<div class="alert alert-info" role="alert" style="width: 1062px;">
					<strong><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">교통편</font></font></strong><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</div>
				<p>${detail.sp_Traffic}</p>

				<br> <br>

				<div class="alert alert-info" role="alert" style="width: 1062px;">
					<strong><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">'업체명의' 다른 공간</font></font></strong><font
						style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font>
				</div>
			</div>


			<div class="info_area">
				<div>
					<h5 class="mt-4">공간 예약 정보</h5>
					<button type="button" id="like" class="btn btn-danger btn-circle">
						<i class="glyphicon glyphicon-heart"></i>찜하기
					</button>
				</div>
				<address>
					<strong>${detail.sp_Type}</strong> <br>───────────────────<br>
					<p class="info_price_hour">
						<strong class="price"><span class="txt_sign">\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<fmt:formatNumber value="${detail.sp_Price}" /></strong> <span
							class="txt_unit">/1개월</span> <br> <span class="txt_vat">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(VAT포함)</span>
						<br>

					</p>
					<br>

					<p>
						<a class="btn btn-primary btn-lg" href="#"
							data-needpopup-show="#small-popup" style="margin-left: 20px;">
							<i class="glyphicon glyphicon-earphone"></i> 전화 &raquo;
						</a> <a class="btn btn-primary btn-lg" id="reserv"
							href="/reserv/reservation.do">예약하기 &raquo;</a>
					</p>
				</address>
			</div>
		</div>



		<div class="spaceList2">


			<!-- /.row -->
			<section class="features-icons bg-light text-left">

				<div class="container">
					<div class="row">
						<c:choose>
							<c:when test="${not empty dtcommonList}">

								<c:forEach var="space" items="${dtcommonList}"
									varStatus="status">
									<div class="col-lg-4">

										<div class="tac" data-num="${space.sp_Num}">
											<div class="goDetail2 tal">

												<!-- 슬라이스 시작 시점1 -->

												<div id="myCarousel" class="carousel slide my-4"
													data-ride="carousel" data-interval="false">
													<ol class="carousel-indicators">
														<li data-target="#myCarousel" data-slide-to="0"
															class="active"></li>
														<!--       <li data-target="#myCarousel" data-slide-to="1"></li>
                                 <li data-target="#myCarousel" data-slide-to="2"></li> -->
													</ol>

													<div class="carousel-inner" role="listbox">
														<div class="carousel-item active">
															<img src="/uploadStorage/space/${space.sp_File}"
																class="d-block img-fluid" alt="First slide">
														</div>
														<%-- 		<div class="carousel-item">
														<img class="d-block img-fluid"
															src="/uploadStorage/space/${space.sp_File}"
															alt="Second slide">
													</div>
													<div class="carousel-item">
														<img class="d-block img-fluid"
															src="/uploadStorage/space/${space.sp_File}"
															alt="Third slide">
													</div>
 --%>
														<!-- 		<a class="carousel-control-prev" href="#myCarousel"
														role="button" data-slide="prev"> <span
														class="carousel-control-prev-icon" aria-hidden="true"></span>
														<span class="sr-only">Previous</span>
													</a> <a class="carousel-control-next" href="#myCarousel"
														role="button" data-slide="next"> <span
														class="carousel-control-next-icon" aria-hidden="true"></span>
														<span class="sr-only">Next</span>
													</a> -->

													</div>
												</div>

												<div class="info_area2">
													<h3 class="tit_space">${space.sp_Name}</h3>
													<div class="tags">
														<span class="tag_area_name">${space.sp_Address}</span>
													</div>
													<div class="info_price_hour2">
														<strong class="price"><fmt:formatNumber
																value="${space.sp_Price}" /></strong><span class="txt_unit">원/월</span>
														<input type="hidden" value="${space.cp_Phone}"> <input
															type="hidden" value="${space.cp_Num}"> <input
															type="hidden" value="${space.sp_Num}">
														<%-- ========= 상세 페이지 이동을 위한 FORM ============= --%>
														<form name="detailForm" id="detailForm">
															<input type="hidden" name="sp_Num" id="sp_Num"
																value="${space.sp_Num}">

														</form>


													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" class="tac">등록된 공간이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>


					</div>
				</div>


			</section>

			<!-- /.row -->
		</div>
	</div>
	<!-- /.container -->


	<!-- 전화 popup 모달창 -->
	<div class="wrapper">
		<div id='small-popup' class="needpopup">
			<p>" 코워킹스페이스를 통해 연락드렸어요~" 라고 말씀하시면 더 친절하게 안내 받으실 수 있습니다.:)</p>
			<p>-------------------------------------------------------------------------</p>
			<h2>${detail.sp_Name}</h2>
			<%-- 	<h2>${detail.cp_Phone}</h2> --%>
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

	<!-- 찜 관련 -->
	<form id="like_Form" class="form-horizontal">
		<input type="hidden" id="sp_Num" name="sp_Num"
			value="${detail.sp_Num }" /> <input type="hidden" id="sp_Name"
			name="sp_Name" value="${detail.sp_Name }" /> <input type="hidden"
			id="like_Amount" name="like_Amount" value="${detail.sp_Price}" /> <input
			type="hidden" id="mem_Id" name="mem_Id" value="${login.mem_Id }" />
	</form>



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