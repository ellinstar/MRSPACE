<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("로그인 상태를 확인 해 주세요");
				<%session.removeAttribute("errCode"); %>
				break;
			case 2:
				alert("예약 실패 했습니다 관리자에게 문의해 주세요.");
				<%session.removeAttribute("errCode"); %>
				break;
			case 3:
				alert("예약 성공 했습니다. '<br>'예약 내역은 마이페이지에서 확인 하실수 있습니다.");
				
				<%session.removeAttribute("errCode"); %>
				break;
			case 4:
				alert("예약하려는 공간의 개수가 부족합니다.");
				<%session.removeAttribute("errCode"); %>
				break;
			}
		}
	}

	$(function() {
		errCodeCheck();
		$("#reservBtn").click(function() {
			var result = confirm("예약 하시겠습니까?");
			if(result == true){
			$("#reservForm").attr({
				"method" : "POST",
				"action" : "/reserv/reservation.do"
			});
			$("#reservForm").submit();
			}
		});
	});
</script>

<body>
	<c:if test="${reserv == null}">	
	<form id="reservForm" name="reservForm">
		<input type="hidden" id="mem_Id" name="mem_Id" value="${login.mem_Id}">
		<input type="hidden" id="sp_Num" name="sp_Num"value="${detail.sp_Num}">
		<input type="hidden" id="sp_Stock" name="sp_Stock"value="${detail.sp_Stock}">
		<input type="month"	id="resUseDate" name="resUseDate"> 
		<input type="text"	id="res_Amount" name="res_Amount" value="${detail.sp_Price}" readonly="readonly">
		<input type="button" id="reservBtn" name="reservBtn" value="예약">
	</form>
</c:if>
	
	<c:if test="${reserv != null}">
	<p>예약 정보 </p>
		<p>공간명 : ${detail.sp_Name}</p>
		<p>이용달 : ${reserv.resUseDate}</p>
		<p>결제 금액 : ${detail.sp_Price}</p>
	</c:if>
</body>
</html>