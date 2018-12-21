<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function reservationCheck(){
		alert($("#resUseDate").val());
		$.ajax({
			url : "/reserv/getStock.do",  //전송 url
			type : "post",                // 전송 시 method 방식
			data : $("#reservForm").serialize(),   //폼전체 데이터 전송
			error : function(){alert('시스템 오류 입니다. 관리자에게 문의 하세요');},
			success : function(resultData){
				if(resultData < 0)
				{
					alert('대여 가능한 공간이 부족합니다.');
				}
			}			
		})
	}
</script>
</head>
<body>
<form id="reservForm" name="reservForm">
<input type="hidden" id="sp_Num" name="sp_Num"value="${detail.sp_Num}">
<input type="month"	id="resUseDate" name="resUseDate" onchange="reservationCheck()" >
</form>
</body>
</html>