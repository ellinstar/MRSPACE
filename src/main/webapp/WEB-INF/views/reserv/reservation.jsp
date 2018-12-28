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

<div class="container">
	<c:if test="${reserv == null}">	
	<div class="card-heder">예약 하실 공간 정보</div>	
	<div class="card-body">
		<form id="reservForm" name="reservForm">
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">공간명</label>
			</div>
			<div class="col-md-4 form-label-group">
				<label class="form-control">${detail.sp_Name}</label>
			</div>
		</div>
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">가격</label>
			</div>
			<div class="col-md-4 form-label-group">
				<label class="form-control">${detail.sp_Price}</label>
			</div>
		</div>
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">사용 기간</label>
			</div>
			<div class="col-md-4 form-label-group">
				<input type="month"	id="resUseDate" name="resUseDate" class="form-control"> 
			</div>
		</div>
		<input type="hidden" id="mem_Id" name="mem_Id" value="${login.mem_Id}"><!-- 회원아이디 -->
		<input type="hidden" id="sp_Num" name="sp_Num"value="${detail.sp_Num}"><!-- 공간번호 -->
		<input type="hidden" id="sp_Name" name="sp_Name"value="${detail.sp_Name}"><!-- 공간이름 -->
		<input type="hidden" id="sp_Stock" name="sp_Stock"value="${detail.sp_Stock}"><!-- 공간 재고 -->
		<input type="hidden" id="res_Amount" name="res_Amount" value="${detail.sp_Price}" readonly="readonly">
		<input type="button" id="reservBtn" name="reservBtn" value="예약">
	</form>
	</div>
	</c:if>
	<c:if test="${reserv != null}">
	<div class="card-heder">예약 정보 확인</div>	
	<div class="card-body">
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">공간명</label>
			</div>
			<div class="col-md-4 form-label-group">
				<label class="form-control">${detail.sp_Name}</label>
			</div>
		</div>
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">이용 월</label>
			</div>
			<div class="col-md-4 form-label-group">
				<label class="form-control">${reserv.resUseDate}</label>
			</div>
		</div>
		<div class="form-group form-row">
			<div class="col-md-2 form-label-group">
				<label class="form-control">결제금액</label>
			</div>
			<div class="col-md-4 form-label-group">
				<label class="form-control">${detail.sp_Price}</label>
			</div>
		</div>
	</div>
	</c:if>
</div>
</body>
</html>