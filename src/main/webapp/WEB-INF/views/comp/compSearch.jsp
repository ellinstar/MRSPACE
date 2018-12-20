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

<!-- Bootstrap core CSS -->

<!-- Custom styles for this template -->
<link href="/resources/css/signin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
$(function () {
	$("#compSearchBtn").click(function() {
		if (!formCheck($('#cp_Name'), $('.error:eq(0)'), "업체이름을"))
			return;
		else if (!formCheck($('#cp_Ceo'), $('.error:eq(1)'), "대표자 성함을"))
			return;
		else if (!formCheck($('#cp_Bnum'), $('.error:eq(2)'), "사업자번호를"))
			return;
		else{
		$("#compSearch").attr({
			"method" : "POST",
			"action" : "/comp/compSearch.do"
		});
			$("#compSearch").submit();
		}
	});
});
	
function errCodeCheck() {
	var errCode = '<c:out value="${errCode}"/>';
	if (errCode != "") {
		switch (parseInt(errCode)) {
		case 9:
			alert("존재하지 않는 사용자 입니다.");
			break;
		}
	}

}
</script>

</head>
<body>
		<h3 class="form-signin-heading">아이디 찾기</h3>
		<div class="contentContainer">
			<div class="row">
				<form class="form-signin" id="compSearch" name="compSearch">
					<br>
					<h3>업체 아이디 찾기</h3>
					<label for="cp_Name" class="sr-only">업체명 </label>
					<input	type="text" id="cp_Name" name="cp_Name" class="form-control"	placeholder="업체명" required autofocus> 
					<label	for="cp_Ceo" class="sr-only">대표자명</label>
					<input type="text" id="cp_Ceo" name="cp_Ceo" class="form-control"	placeholder="대표자 이름" required> 
					<label	for="cp_Bnum" class="sr-only">사업자번호</label>
					<input type="text" id="cp_Bnum" name="cp_Bnum" class="form-control"	placeholder="사업자 번호 (-)포함" required> 
					<input type="button" class="btn btn-lg btn-primary btn-block" id="compSearchBtn" value="확인">
				<h6>비밀번호를 잊어버리신 경우</h6><h6>관리자에게 문의하시기 바랍니다.</h6>
				</form>
			</div>
				
			
		</div>
</body>
</html>