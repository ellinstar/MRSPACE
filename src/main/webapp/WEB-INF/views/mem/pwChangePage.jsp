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
$(function() {
	$("#pwChange2Btn").click(function() {
		if (!formCheck($('#mem_Pw'), $('.error:eq(0)'), "비밀번호를"))
			return;
		else if (!inputVerify(1, '#mem_Pw', '.error:eq(1)'))
			return;
		else if (!formCheck($('#mem_PwCheck'), $('.error:eq(1)'), "비밀번호 확인을"))
			return;
		else if (!passwordCheck())
			return;
		else
			$("#pwChangeForm").attr({
			"method" : "POST",
			"action" : "/mem/pwChangePage.do"
		});
	     alert("비밀번호가 변경 되었습니다.");
		$("#pwChangeForm").submit();
	});
});

//비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck(){
	if($("#mem_Pw").val() != $("#mem_PwCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#mem_PwCheck").focus();
		$("#mem_PwCheck").val("");
		return false;
	}else{		
		return true;
	}
}

</script>
</head>
<body>
	<div id="pwChange2">
		<form class="form-signin" id="pwChangeForm" name="pwChange2">
			<h2 class="form-signin-heading">비밀번호 수정</h2>
			<input type="hidden" id="mem_Id" name="mem_Id"
				value='${memId.mem_Id}'> <label for="mem_Pw" class="sr-only">비밀번호</label>
			<input type="password" id="mem_Pw" name="mem_Pw" class="form-control"
				placeholder="passwd" required autofocus> <label
				for="mem_PwCheck" class="sr-only">비밀번호 확인</label> <input
				type="password" id="mem_PwCheck" name="mem_PwCheck"
				class="form-control" placeholder="passwd" required> <input
				type="button" class="btn btn-lg btn-primary btn-block"
				id="pwChange2Btn" value="비밀번호 변경">
		</form>
	</div>

</body>
</html>