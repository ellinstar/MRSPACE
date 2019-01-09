<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title><tiles:getAsString name="title" /></title>

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
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 검색 후 검색 대상과 단어 출력
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
		}

		// 검색 버튼 클릭 시
		$("#searchData").click(function() {
			$("#mysearch").attr({
				"method" : "GET",
				"action" : "/common/commonList.do"
			});
			$("#mysearch").submit();
		});

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 - X
		$(".goDetail").click(function() {
			var sp_Num = $(this).parents("div").attr("data-num");
			$("#sp_Num").val(sp_Num);
			console.log("글번호 : " + sp_Num);
			// 상세 페이지로 이동하기 위해 form추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/common/commonDetail.do"
			});
			$("#detailForm").submit();
		});

	});
</script>


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

.info_area {
	position: relative;
	padding: 18px 20px 14px;
	background-color: #fff;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.info_area .tit_space {
	padding-bottom: 7px;
	font-size: 21px;
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

section.testimonials.text-center.bg-light {
	margin-top: 45px;
}
</style>


</head>

<body id="page-top">
	<nav class="navbar navbar-light bg-light static-top">
		<tiles:insertAttribute name="header" />
	</nav>


	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">다시 만나고 싶은 공간!</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form class="mysearch" id="mysearch" name="mysearch">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" id="keyword" name="keyword"
									class="form-control form-control-lg"
									placeholder="공간을 빠르게 검색해보세요.">
							</div>

							<div class="col-12 col-md-3">
								<button type="submit" id="searchData" name="searchData"
									class="btn btn-block btn-lg btn-primary">Search!</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Icons Grid -->


	<section class="testimonials text-center bg-light">
		<div class="container">
			<h2 class="mb-6">오늘의 추천 공간</h2>
		</div>
	</section>

	<%-- ========= 상세 페이지 이동을 위한 FORM ============= --%>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="sp_Num" id="sp_Num"> <input
			type="hidden" name="page" value="${data.page}"> <input
			type="hidden" name="pageSize" value="${data.pageSize}">
	</form>

	<section class="features-icons bg-light text-left">

		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${not empty mainlayoutList}">

						<c:forEach var="space" items="${mainlayoutList}"
							varStatus="status">
							<div class="col-lg-4">

								<div class="tac" data-num="${space.sp_Num}">
									<div class="goDetail tal">

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

											</div>
										</div>

										<div class="info_area">
											<h3 class="tit_space">${space.sp_Name}</h3>
											<div class="tags">
												<span class="tag_area_name">${space.sp_Address}</span>
											</div>
											<div class="info_price_hour">
												<strong class="price"><fmt:formatNumber
														value="${space.sp_Price}" /></strong><span class="txt_unit">원/월</span>
												<input type="hidden" value="${space.cp_Phone}">
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


	<%-- =================== 리스트 종료  ================= --%>



	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>


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