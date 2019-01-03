<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>




<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/sb-admin.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<!-- <link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css"> -->


<link rel="stylesheet" href="/resources/popup/needpopup.min.css">


<script type="text/javascript"
	src="/resources/include/js/jquery.googlemap.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btnModify").click(function() {
			alert("공간 정보 수정 완료!")
			$("#modifyForm").attr({
				"method" : "POST",
				"action" : "/space/spaceModify.do"
			});
			$("#modifyForm").submit();
		});
	});

	/* 전체목록 불러오기 */
	function cancel() {
		location.href = "/space/spaceList.do?cp_Num=${ cp_Num }";
	}
</script>

<style type="text/css">
body {
	width: 100%;
	margin: 0 auto;
	padding: 0;
}

footer {
	padding: 100px;
	position: relative;
	bottom: 100px;
}

div {
	margin: auto 15;
}
</style>
<!-- 등록 버튼 -->
<style type="text/css">
input[type=date]:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

#spaceDateStart, #spaceDateEnd {
	width: 150px;
}

/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

input[type=text] {
	width: 350px;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
}

input[type=text]:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

textarea {
	width: 100%;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
	height: 150px;
	resize: none; /* 사용자 임의 변경 불가 */
}

textarea:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

#spaceOpenDate {
	width: 100%;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
}

#spaceOpenDate:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	position: relative;
	top: 3.5px;
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #e67e22;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	display: inline-block;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #e67e22;
	border-color: #ee9e57;
}

#spaceOpenDate {
	width: 150px;
}

/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	curs
	inter;
}
</style>

<!-- 공간 서비스/교통편 텍스트 -->
<style type="text/css">
#spaceService, #spaceTraffic {
	width: 400px;
	height: 300px;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
	resize: none;
	border: 2px solid #aaa;
}

#spaceService:focus, #spaceTraffic:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

#spaceTraffic, .trtitle {
	position: relative;
	bottom: 380px;
	left: 710px;
}
</style>

<style type="text/css">
.btnModify, .btnCancle {
	position: relative;
	float: right;
	width: auto;
	bottom: 300px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #f39c12;
	background: #e67e22;
	text-align: center;
	padding: 16px 18px 14px;
	margin: 12px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px #d35400;
	-moz-box-shadow: 0px 6px 0px #d35400;
	box-shadow: 0px 6px 0px #d35400;
	width: auto;
	display: inline-block;
}

.btnModify:active, .btnCancle:active {
	-webkit-box-shadow: 0px 2px 0px #d35400;
	-moz-box-shadow: 0px 2px 0px #d35400;
	box-shadow: 0px 2px 0px #d35400;
	position: relative;
}
</style>

</head>

<body>
	<form name="modifyForm" id="modifyForm">
		<input type="hidden" name="sp_Num" id="sp_Num"
			value="${modify.sp_Num}"> <input type="hidden" id="cp_Num"
			name="cp_Num" value="${modify.cp_Num}" /> <br>
		<h1>공간 수정 - ${modify.sp_Name}</h1>
		<hr>
		<h3>공간 가격 (월/원)</h3>
		<input type="text" name="sp_Price" id="spacePrice"
			placeholder="가격을 입력해주세요." size="100" value="${modify.sp_Price}">
		<hr>
		<h3>공간 소개</h3>
		<textarea id="spaceexp" class="spaceexp" name="sp_Exposition">${modify.sp_Exposition}</textarea>
		<hr>
		<!-- 멀티업로드 -->
		<h3>공간 서비스 등록</h3>
		<div class="svrg">
			<textarea name="sp_Service" id="spaceService">${modify.sp_Service}</textarea>
		</div>
		<div class="e">
			<br>
			<h3 class="trtitle">교통편 등록</h3>
			<div class="svrg">
				<textarea name="sp_Traffic" id="spaceTraffic">${modify.sp_Traffic}</textarea>
			</div>
		</div>
		<input type="button" value="CANCLE" name="btnCancle" id="btnCancle"
			onclick="javascript:cancel()" class="btnCancle" /> <input
			type="button" value="MODIFY" name="btnModify" id="btnModify"
			class="btnModify" /> <input type="hidden" name='cp_Id' id='cp_Id'
			value='${modify.cp_Id}' />


	</form>
	<!-- /.container -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>