<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
   document.title = 'MRSPACE : 공간등록';
</script>
<head>
<!-- 오픈데스크 1인 버튼 -->
<style type="text/css">
.onoffswitch {
	position: relative;
	width: 170px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.onoffswitch-checkbox {
	display: none;
}

.onoffswitch-label {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #999999;
	border-radius: 7px;
}

.onoffswitch-inner {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch-inner:before, .onoffswitch-inner:after {
	display: block;
	float: left;
	width: 50%;
	height: 34px;
	padding: 0;
	line-height: 34px;
	font-size: 14px;
	color: white;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

.onoffswitch-inner:before {
	content: "오픈데스크 1인";
	padding-left: 10px;
	background-color: #17a2b8;
	color: #FFFFFF;
}

.onoffswitch-inner:after {
	content: "오픈데스크 1인";
	padding-right: 10px;
	background-color: #EEEEEE;
	color: #999999;
	text-align: right;
}

.onoffswitch-switch {
	display: block;
	width: 36px;
	margin: 1px;
	background: #FFFFFF;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 132px;
	border: 2px solid #999999;
	border-radius: 7px;
	transition: all 0.3s ease-in 0s;
}

.onoffswitch-checkbox:checked+.onoffswitch-label .onoffswitch-inner {
	margin-left: 0;
}

.onoffswitch-checkbox:checked+.onoffswitch-label .onoffswitch-switch {
	right: 0px;
}
</style>
<!-- 고정데스크 1인 버튼 -->
<style type="text/css">
.onoffswitch2 {
	position: relative;
	left: 200px;
	bottom: 47px;
	width: 170px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	width: 170px;
}

.onoffswitch-checkbox2 {
	display: none;
}

.onoffswitch-label2 {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #999999;
	border-radius: 7px;
}

.onoffswitch-inner2 {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch-inner2:before, .onoffswitch-inner2:after {
	display: block;
	float: left;
	width: 50%;
	height: 34px;
	padding: 0;
	line-height: 34px;
	font-size: 14px;
	color: white;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

.onoffswitch-inner2:before {
	content: "고정데스크 1인";
	padding-left: 10px;
	background-color: #17a2b8;
	color: #FFFFFF;
}

.onoffswitch-inner2:after {
	content: "고정데스크 1인";
	padding-right: 10px;
	background-color: #EEEEEE;
	color: #999999;
	text-align: right;
}

.onoffswitch-switch2 {
	display: block;
	width: 36px;
	margin: 1px;
	background: #FFFFFF;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 132px;
	border: 2px solid #999999;
	border-radius: 7px;
	transition: all 0.3s ease-in 0s;
}

.onoffswitch-checkbox2:checked+.onoffswitch-label2 .onoffswitch-inner2 {
	margin-left: 0;
}

.onoffswitch-checkbox2:checked+.onoffswitch-label2 .onoffswitch-switch2
	{
	right: 0px;
}
</style>
<!-- 프라이빗오피스1 버튼 -->
<style type="text/css">
.onoffswitch3 {
	position: relative;
	width: 170px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.onoffswitch-checkbox3 {
	display: none;
}

.onoffswitch-label3 {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #999999;
	border-radius: 7px;
}

.onoffswitch-inner3 {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch-inner3:before, .onoffswitch-inner3:after {
	display: block;
	float: left;
	width: 50%;
	height: 34px;
	padding: 0;
	line-height: 34px;
	font-size: 14px;
	color: white;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

.onoffswitch-inner3:before {
	content: "프라이빗오피스1인";
	padding-left: 10px;
	background-color: #17a2b8;
	color: #FFFFFF;
}

.onoffswitch-inner3:after {
	content: "프라이빗오피스1인";
	padding-right: 10px;
	background-color: #EEEEEE;
	color: #999999;
	text-align: right;
}

.onoffswitch-switch3 {
	display: block;
	width: 36px;
	margin: 1px;
	background: #FFFFFF;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 132px;
	border: 2px solid #999999;
	border-radius: 7px;
	transition: all 0.3s ease-in 0s;
}

.onoffswitch-checkbox3:checked+.onoffswitch-label3 .onoffswitch-inner3 {
	margin-left: 0;
}

.onoffswitch-checkbox3:checked+.onoffswitch-label3 .onoffswitch-switch3
	{
	right: 0px;
}
</style>
<!-- 프라이빗오피스3 버튼 -->
<style type="text/css">
.onoffswitch4 {
	position: relative;
	left: 200px;
	bottom: 47px;
	width: 170px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.onoffswitch-checkbox4 {
	display: none;
}

.onoffswitch-label4 {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #999999;
	border-radius: 7px;
}

.onoffswitch-inner4 {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch-inner4:before, .onoffswitch-inner4:after {
	display: block;
	float: left;
	width: 50%;
	height: 34px;
	padding: 0;
	line-height: 34px;
	font-size: 14px;
	color: white;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

.onoffswitch-inner4:before {
	content: "프라이빗오피스3인";
	padding-left: 10px;
	background-color: #17a2b8;
	color: #FFFFFF;
}

.onoffswitch-inner4:after {
	content: "프라이빗오피스3인";
	padding-right: 10px;
	background-color: #EEEEEE;
	color: #999999;
	text-align: right;
}

.onoffswitch-switch4 {
	display: block;
	width: 36px;
	margin: 1px;
	background: #FFFFFF;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 132px;
	border: 2px solid #999999;
	border-radius: 7px;
	transition: all 0.3s ease-in 0s;
}

.onoffswitch-checkbox4:checked+.onoffswitch-label4 .onoffswitch-inner4 {
	margin-left: 0;
}

.onoffswitch-checkbox4:checked+.onoffswitch-label4 .onoffswitch-switch4
	{
	right: 0px;
}
</style>
<!-- 프라이빗오피스6 버튼 -->
<style type="text/css">
.onoffswitch5 {
	position: relative;
	left: 400px;
	bottom: 93px;
	width: 170px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.onoffswitch-checkbox5 {
	display: none;
}

.onoffswitch-label5 {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid #999999;
	border-radius: 7px;
}

.onoffswitch-inner5 {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

.onoffswitch-inner5:before, .onoffswitch-inner5:after {
	display: block;
	float: left;
	width: 50%;
	height: 34px;
	padding: 0;
	line-height: 34px;
	font-size: 14px;
	color: white;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

.onoffswitch-inner5:before {
	content: "프라이빗오피스6인";
	padding-left: 10px;
	background-color: #17a2b8;
	color: #FFFFFF;
}

.onoffswitch-inner5:after {
	content: "프라이빗오피스6인";
	padding-right: 10px;
	background-color: #EEEEEE;
	color: #999999;
	text-align: right;
}

.onoffswitch-switch5 {
	display: block;
	width: 36px;
	margin: 1px;
	background: #FFFFFF;
	position: absolute;
	top: 0;
	bottom: 0;
	right: 132px;
	border: 2px solid #999999;
	border-radius: 7px;
	transition: all 0.3s ease-in 0s;
}

.onoffswitch-checkbox5:checked+.onoffswitch-label5 .onoffswitch-inner5 {
	margin-left: 0;
}

.onoffswitch-checkbox5:checked+.onoffswitch-label5 .onoffswitch-switch5
	{
	right: 0px;
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

input[type=text]:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
}

textarea {
	transition: .3s;
	resize: none; /* 사용자 임의 변경 불가 */
}

textarea:focus {
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
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
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border-radius: .25em;
	display: inline-block;
}

/* named upload */
.filebox .upload-name { <<<<<<<
	HEAD display: inline-block;
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
	appearance: none; =======
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
	>>>>>>>
	refs
	/remotes/origin/master
}

<!--
공간 서비스 /교통편 텍스트 -->#spaceService:focus, #spaceTraffic:focus { <<<<<<<
	HEAD border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000; =======
	border-color: #FF8000;
	box-shadow: 0 0 8px 0 #FF8000;
	>>>>>>>
	refs
	/remotes/origin/master
}
</style>


<script type="text/javascript">
   $(function() {

      //다음 버튼 클릭시 
      $("#btnReg").click(function() {
               alert("공간 등록 신청 성공!");
               
               
               //재고갯수 입력 유효성 검사
               if (document.myForm.spaceStock.value == "") {
                  alert("재고 갯수를 입력하세요.");
                  return false;
               }
               
                  // 숫자가 아닌 것을 입력한 경우
                  var stock = document.myForm.spaceStock.value.substr(0,9);
                   if (!isNumeric(stock)) {
                     alert("재고갯수는 숫자로 입력하세요.");
                     document.myForm.spaceStock.value = ""
                     document.myForm.spaceStock.focus()
                     return false;
                   } 
                   
                 //공간명 유효성검사 
                  if (myForm.spaceName.value == "") {
                     alert("공간명을 입력하세요.");
                     spaceName.focus();
                     return false;
                  }

                  //공간명에 공백 사용불가
                  if (document.myForm.spaceName.value.indexOf(" ") >= 0) {
                     alert("공간명에는 공백을 사용할 수 없습니다.")
                     document.myForm.spaceName.focus()
                     document.myForm.spaceName.select()
                     return false;
                  }

                  //공간명 2~20자 유효성 검사
                  if (document.myForm.spaceName.value.length<2 || document.myForm.spaceName.value.length>20) {
                     alert("아이디를 4~12자까지 입력해주세요.")
                     document.myForm.spaceName.focus()
                     document.myForm.spaceName.select()
                     return false;
                  }
                  
                  //공간 가격 미입력시
                  if(document.myForm.spacePrice.value == ""){
                     alert("가격을 입력해주세요!")
                     document.myForm.spacePrice.value = ""
                        document.myForm.spacePrice.focus()
                        return false;
                  }

                  //공간 가격에 숫자만 입력
                  var price = document.myForm.spacePrice.value
                        .substr(0, 9);
                  if (!isNumeric(price)) {
                     alert("가격은 숫자만 입력하세요.")
                     document.myForm.spacePrice.value = ""
                     document.myForm.spacePrice.focus()
                     return false;
                  }
                  
                  //공간 주소 미입력시
                  if(document.myForm.spaceAddr.value == ""){
                     alert("주소를 입력해주세요!")
                     document.myForm.spaceAddr.value = ""
                        document.myForm.spaceAddr.focus()
                        return false;
                  }
                  

                  //계약기간 미설정시
                  if(document.myForm.spaceDateStart.value == "" && document.myForm.spaceDateEnd.value == ""){
                     alert("임대 계약 기간을 설정해주세요!")
                     document.myForm.spaceDateStart.value = ""
                        document.myForm.spaceDateStart.focus()
                        return false;
                  }
                  //오픈날짜 미선택시
                  if (document.myForm.spaceOpenDate.value == ""
                        && document.myForm.spaceOpenDate.value == "") {
                     alert("오픈가능 날짜를 설정해주세요!")
                     document.myForm.spaceOpenDate.value = ""
                     document.myForm.spaceOpenDate.focus()
                     return false;
                  }

                  //공간 소개 미입력시
                  if (document.myForm.spaceexp.value == "") {
                     alert("공간 설명을 입력해주세요!")
                     document.myForm.spaceexp.value = ""
                     document.myForm.spaceexp.focus()
                     return false;
                  }
                  
                   $("#myForm").attr({
                     "method":"POST",
                     "action":"/space/spaceInsert.do"
                  }); 
                  $("#myForm").submit();
            });
   });

   //숫자입력 (0~9)
         function isNumeric(s) { 
                for (i=0; i<s.length; i++) { 
                  c = s.substr(i, 1); 
                  if (c < "0" || c > "9") return false; 
                } 
                return true; 
              }
      
   
   $(function() {
      //오늘 날짜를 출력
      $("#today").text(new Date().toLocaleDateString());

      //datepicker 한국어로 사용하기 위한 언어설정
      $.datepicker.setDefaults($.datepicker.regional['ko']);

      // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
      // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

      //시작일.
      $('#spaceDateStart').datepicker(
            {
               showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
               buttonImage : "../resources/img/calender.png", // 버튼 이미지
               buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
               buttonText : "날짜선택", // 버튼의 대체 텍스트
               dateFormat : "yy-mm-dd", // 날짜의 형식
               changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
               changeYear : true,
               //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
               onClose : function(selectedDate) {
                  // 시작일(fromDate) datepicker가 닫힐때
                  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#spaceDateEnd").datepicker("option", "minDate",
                        selectedDate);
               }
            });

      //종료일
      $('#spaceDateEnd').datepicker(
            {
               showOn : "both",
               buttonImage : "../resources/img/calender.png",
               buttonImageOnly : true,
               buttonText : "날짜선택",
               dateFormat : "yy-mm-dd",
               changeMonth : true,
               changeYear : true,
               //minDate: 0, // 오늘 이전 날짜 선택 불가
               onClose : function(selectedDate) {
                  // 종료일(toDate) datepicker가 닫힐때
                  // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                  $("#spaceDateStart").datepicker("option", "maxDate",
                        selectedDate);
               }
            });
      
      
      //오픈가능일자
      $('#spaceOpenDate').datepicker(
            {
               showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
               buttonImage : "../resources/img/calender.png", // 버튼 이미지
               buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
               buttonText : "날짜선택", // 버튼의 대체 텍스트
               dateFormat : "yy-mm-dd", // 날짜의 형식
               changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
               changeYear : true,
               //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
               onClose : function(selectedDate) {
                  // 시작일(fromDate) datepicker가 닫힐때
                  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#spaceDateStart").datepicker("option", "maxDate",
                        selectedDate);
               }
            });
   });
   
   /*취소 버튼 클릭 시 처리 이벤트 */
   $("#btnCancle").click(function(){
      location.href="/space/spaceList.do";
   });
      
      
   
</script>



<meta charset="UTF-8">
<title>공간등록 유형선택 페이지</title>
</head>
<body>
	<form name="myForm" id="myForm" enctype="multipart/form-data">
		<br>

		<!-- 제목부분 -->
		<div class="alert  row" role="alert">
			<label class="form-control-plaintext" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">등록할
						공간 유형 선택</font></strong>
			</label>
		</div>
		<hr>

		<div class="all">
			<div class="onoffswitch">
				<!-- 공간 선택 스위치 부분 -->
				<input type="radio" name="sp_Type" class="onoffswitch-checkbox"
					id="switch" value="오픈데스크"> <label class="onoffswitch-label"
					for="switch"> <span class="onoffswitch-inner"></span> <span
					class="onoffswitch-switch"></span>
				</label>
			</div>


			<div class="onoffswitch2">
				<!-- 공간 선택 스위치 부분 -->
				<input type="radio" name="sp_Type" class="onoffswitch-checkbox2"
					id="switch2" value="고정데스크"> <label
					class="onoffswitch-label2" for="switch2"> <span
					class="onoffswitch-inner2"></span> <span
					class="onoffswitch-switch2"></span>
				</label>
			</div>


			<div class="onoffswitch3">
				<!-- 공간 선택 스위치 부분 -->
				<input type="radio" name="sp_Type" class="onoffswitch-checkbox3"
					id="switch3" value="1인프라이빗오피스"> <label
					class="onoffswitch-label3" for="switch3"> <span
					class="onoffswitch-inner3"></span> <span
					class="onoffswitch-switch3"></span>
				</label>
			</div>

			<div class="onoffswitch4">
				<!-- 공간 선택 스위치 부분 -->
				<input type="radio" name="sp_Type" class="onoffswitch-checkbox4"
					id="switch4" value="3인프라이빗오피스"> <label
					class="onoffswitch-label4" for="switch4"> <span
					class="onoffswitch-inner4"></span> <span
					class="onoffswitch-switch4"></span>
				</label>
			</div>


			<div class="onoffswitch5">
				<!-- 공간 선택 스위치 부분 -->
				<input type="radio" name="sp_Type" class="onoffswitch-checkbox5"
					id="switch5" value="6인프라이빗오피스"> <label
					class="onoffswitch-label5" for="switch5"> <span
					class="onoffswitch-inner5"></span> <span
					class="onoffswitch-switch5"></span>
				</label>
			</div>
		</div>
		<!--============================ 스위치 종료 =========================================== -->
		<div class="alert  row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간 재고</font></strong>
			</label> <input type="text" class="form-control col-md-8"
				placeholder="재고 갯수입력" id="spaceStock" name="sp_Stock"> <label
				class="form-control-plaintext col-md-1" style="color: #0c5460">개
			</label>
		</div>

		<hr>

		<div class="alert row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간명</font></strong>
			</label> <input type="text" class="form-control col-md-8" name="sp_Name"
				id="spaceName" placeholder="공간명을 입력해주세요.">
		</div>
		<hr>
		<div class="alert row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간
						가격(월/원)</font></strong>
			</label> <input type="text" class="form-control col-md-8" name="sp_Price"
				id="spacePrice" placeholder="가격을 입력해주세요.">
		</div>
		<hr>
		<div class="alert  row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간 주소</font></strong>
			</label> <input type="text" class="form-control col-md-8" id="spaceAddr"
				name="sp_Address" placeholder="주소"> <input type="button"
				onclick="sample5_execDaumPostcode()" class="btn btn-info"
				value="주소 검색"><br>
			<div id="map"
				style="width: 500px; height: 500px; margin-top: 10px; margin-left: 300px; display: none"></div>
			<hr>
			<script
				src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23e208b11117bed56607098ecaaedb24&libraries=services"></script>

			<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("spaceAddr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 위도 경도값 받아감!
                        $("#mapcoords").val(result.y);
                        $("#mapcoords2").val(result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
			<!-- 업체 지도 위도경도값 -->
			<input type="hidden" id="mapcoords" name="sp_Y"> <input
				type="hidden" id="mapcoords2" name="sp_X">

		</div>

		<hr>
		<div class="alert row">
			<label class="form-control-plaintext col-md-8" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">임대계약기간</font></strong>
				(오늘 날짜 : <span id="today"></span>)<br>
			</label>
		</div>
		<div class="col-md-12 row">
			<input type="text" class="form-control col-md-3" name="sp_Contract1"
				id="spaceDateStart">&nbsp;-&nbsp; <input type="text"
				class="form-control col-md-3" name="sp_Contract2" id="spaceDateEnd">
		</div>
		<hr>
		<div class="alert  row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">오픈
						가능날짜</font></strong>
			</label> <input type="text" class="form-control col-md-3" name="sp_Opendate"
				id="spaceOpenDate">
		</div>
		<hr>
		<div class="alert  row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간 소개</font></strong>
			</label>
			<textarea id="spaceexp" class="form-control" style="height: 150px"
				name="sp_Exposition" placeholder="고객에게 내 공간에 대해 소개해주세요."></textarea>
		</div>
		<hr>

		<div class="alert  row">
			<label class="form-control-plaintext col-md-2" style="color: #0c5460">
				<strong><font style="vertical-align: inherit;">공간
						이미지</font></strong>
			</label>
			<div class="filebox">
				<label for="file" class="btn btn-info">업로드</label> <input
					type="file" id="file" name="file"> &nbsp;*사진은 1장만 등록바랍니다.
			</div>
		</div>
		<hr>
		<div class="alert  row">
			<div class="col-md-6">
				<label class="form-control-plaintext" style="color: #0c5460">
					<strong><font style="vertical-align: inherit;">공간
							서비스</font></strong>
				</label>
				<textarea name="sp_Service" id="spaceService" class="form-control"
					style="height: 300px"
					placeholder="예:&#13;&#10;주차시설:가능&#13;&#10;TV/빔 프로젝터: 없음&#13;&#10;PC/인터넷: WIFI&#13;&#10;취사시설: 전자렌지, 냉온수기, 커피포트&#13;&#10;기타비품: 종이컵, 에어컨, 온풍기, 공기청정기"></textarea>
			</div>
			<div class="col-md-6">
				<label class="form-control-plaintext" style="color: #0c5460">
					<strong><font style="vertical-align: inherit;">교통편</font></strong>
				</label>
				<textarea name="sp_Traffic" id="spaceTraffic" class="form-control"
					style="height: 300px"
					placeholder="예:&#13;&#10;강남역에서 오는방법:xx병원 정류장 맞은편 골목&#13;&#10;&#13;&#10;서울역에서 오는방법: 지하철 환승후 강남역 4번출구"></textarea>
			</div>
		</div>


		<input type="hidden" name='cp_Id' id='cp_Id' value='${cp_Id}' />
	</form>
	<div class="btn-group-right" style="margin-left: 300px; padding: 30px;">
		<button name="btnCancle" id="btnCancle" class="btn btn-info"
			style="width: 200px; margin-right: 30px;">취소</button>
		<button name="btnReg" id="btnReg" class="btn btn-info"
			style="width: 200px;">등록</button>
	</div>
</body>
</html>