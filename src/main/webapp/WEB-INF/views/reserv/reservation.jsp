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
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("로그인 상태를 확인 해 주세요");
<%session.removeAttribute("errCode");%>
	break;
			case 2:
				alert("예약 실패 했습니다 관리자에게 문의해 주세요.");
<%session.removeAttribute("errCode");%>
	break;
			case 3:
				alert("예약 성공 했습니다. '<br>'예약 내역은 마이페이지에서 확인 하실수 있습니다.");
<%session.removeAttribute("errCode");%>
	break;
			case 4:
				alert("예약하려는 공간의 개수가 부족합니다.");
<%session.removeAttribute("errCode");%>
	break;
			}
		}
	}

	$(function() {
		errCodeCheck();
		$("#reservBtn").click(function() {
			var result = confirm("예약 하시겠습니까?");
			if (result == true) {
				$("#reservForm").attr({
					"method" : "POST",
					"action" : "/reserv/reservation.do"
				});
				$("#reservForm").submit();
			}
		});
	});
</script>
<style>
input#reservBtn {
	width: 1040px;
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
}
</style>

<body>
	<!-- Page Content -->
	<div class="container">
		<c:if test="${reserv == null}">
			<div class="card-body">
				<form id="reservForm" name="reservForm">
					<br>
					<div class="alert alert-info" role="alert">
						<strong><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">예약 공간 </font></font></strong><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font>
					</div>
					<!-- Heading Row -->
					<div class="row my-4">
						<div class="col-lg-8">
							<!-- 공간 이미지 -->
							<img class="img-fluid rounded"
								src="/uploadStorage/space/${detail.sp_File}" alt="">
						</div>
						<!-- /.col-lg-8 -->
						<div class="col-lg-4">
							<!-- 공간이름 -->
							<h3>${detail.sp_Name}</h3>
							<!-- 공간소개 -->
							<p style="font-size: 0.95rem;">${detail.sp_Exposition}</p>
						</div>
						<!-- /.col-md-4 -->
					</div>
					<%-- 	<div class="card-header">
			<p class="text-primary m-1">
				√ 공간유형 : <strong>${detail.sp_Type}</strong>
			</p>
		</div> --%>


					<!-- /.row -->

					<!-- Call to Action Well -->
					<!-- 	<div class="card text-white bg-secondary my-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">This call to action card is a great
					place to showcase some important information or display a clever
					tagline!</p>
			</div>
		</div>
 -->

					<!-- /.row -->
					<br>
					<!-- 	<div class="card-heder">예약 하실 공간 정보</div> -->
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">공간유형</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"> ${detail.sp_Type}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">금액</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"> <fmt:formatNumber
									value="${detail.sp_Price}" />원 / 1개월</label>
						</div>(VAT포함가)
					</div>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">예약 기간＊</label> 
						</div>
						<div class="col-md-4 form-label-group">
							<input type="month" id="resUseDate" name="resUseDate"
								class="form-control">
						</div>
					</div>




					<!-- 업체 정보 -->
					<br>
					<div class="alert alert-info" role="alert">
						<strong><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">호스트 정보</font></font></strong><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font>
					</div>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">공간상호</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"></label>
						</div>
					</div>

					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">대표자명</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"> </label>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">소재지</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"> </label>
						</div>
					</div>

					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">사업자번호</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control"> </label>
						</div>
					</div>

					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="form-control">연락처</label>
						</div>
						<div class="col-md-4 form-label-group">
							<label class="form-control">${detail.cp_Phone}</label>
						</div>
					</div>

					<!-- 환불 규정 안내 -->
					<br>
					<div class="alert alert-info" role="alert">
						<strong><font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">환불규정 안내</font></font></strong><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font>
					</div>
					<p style="font-size: 0.95rem;">※이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다. 결제 후<br> 2시간 이내에는
						100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)</p>
					<p style="font-size: 0.95rem;">※이용 8일 전	총 금액의 100% 환불</p>	
					<p style="font-size: 0.95rem;">※이용 7일 전 	총 금액의 90% 환불</p>
					<p style="font-size: 0.95rem;">※이용 시작일     환불 불가</p>


					<input type="hidden" id="mem_Id" name="mem_Id"
						value="${login.mem_Id}">
					<!-- 회원아이디 -->
					<input type="hidden" id="sp_Num" name="sp_Num"
						value="${detail.sp_Num}">
					<!-- 공간번호 -->
					<input type="hidden" id="sp_Name" name="sp_Name"
						value="${detail.sp_Name}">
					<!-- 공간이름 -->
					<input type="hidden" id="sp_Stock" name="sp_Stock"
						value="${detail.sp_Stock}">
					<!-- 공간 재고 -->
					<input type="hidden" id="res_Amount" name="res_Amount"
						value="${detail.sp_Price}" readonly="readonly"> <input
						type="button" class="btn btn-primary2 btn-lg" id="reservBtn"
						name="reservBtn" value="예약 하기">

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