<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ok").click(function() {

			$("#actionForm").attr("action", "/admin/space/ok");
			$("#actionForm").submit();
			alert("공간 등록 승인 완료!!");
		});
	});
</script>
<style type="text/css">
label, input {
	text-align: center;
}

.label {
	background-color: #EAEAEA;
}

.form-control {
	border-color: #EAEAEA;
	border: 0.1;
}
</style>
</head>
<body class="bg-dark">
	<div class="container" style="width: 100%">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">Space</div>
			<div class="card-body">
				<form>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="label">업체명</label>
						</div>
						<div class="col-md-4 form-label-group">
							<input type="text" id="cpname" class="form-control"
								placeholder="First name"> <label for="cpname">${detail.cp_Name}</label>
						</div>
						<div class="col-md-2 form-label-group">
							<label class="label">공간명 </label>
						</div>
						<div class="col-md-4 form-label-group">
							<input type="text" id="name" class="form-control"
								placeholder="First name"> <label for="name">${detail.sp_Name}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col-md-2 form-label-group">
							<label class="label">공간유형 </label>
						</div>
						<div class="col-md-4 form-label-group">
							<input type="text" id="type" class="form-control"
								placeholder="First name"> <label for="type">${detail.sp_Type}</label>
						</div>
						<div class="col-md-2 form-label-group">
							<label class="label">수량 </label>
						</div>
						<div class="col-md-4 form-label-group">
							<input type="text" id="stock" class="form-control"
								placeholder="First name"> <label for="stock">${detail.sp_Stock}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<div class="col-md-2">
							<div class="form-label-group">
								<label class="label">위치 </label>
							</div>
						</div>
						<div class="col-md-10">
							<div class="form-label-group">
								<input type="text" id="add" class="form-control"
									placeholder="First name"> <label for="add">${detail.sp_Address}</label>
							</div>
						</div>
					</div>
					<div class="form-group form-row"">
						<label class="label col-md-12">공간 소개 </label>
						<div class="col-md-12 form-label-group">
							<input type="text" id="expo" class="form-control"
								placeholder="Confirm password" required="required" style="min-height: 200px;"> <label
								for="expo">${detail.sp_Exposition}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<label class="label col-md-12 ">공간 서비스 </label>
						<div class="col-md-12 form-label-group">
							<input type="text" id="serv" class="form-control"
								placeholder="Confirm password" required="required" style="min-height: 200px;"> <label
								for="serv">${detail.sp_Service}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<label class="label col-md-12">교통편</label>
						<div class="col-md-12 form-label-group">
							<input type="text" id="traf" class="form-control"
								placeholder="First name" required="required" style="min-height: 200px;"> <label
								for="traf">${detail.sp_Traffic}</label>
						</div>
					</div>
					<div class="form-group form-row">
						<label class="label col-md-12">사진</label>
						<div class="col-md-12 form-label-group">
							<img src="/uploadStorage/space/${detail.sp_File}"
								style="width: 100%">
						</div>
					</div>

				</form>
			</div>

			<form id="actionForm">
				<input type="hidden" id=sp_Num name="sp_Num"
					value='<c:out value="${detail.sp_Num}"/>' />
			</form>
			<!-- <button>삭제</button>&nbsp;
		<button>반려</button>&nbsp;
		<button>접수</button>&nbsp; -->
			<button id="ok" class="btn btn-default">승인</button>
		</div>
	</div>


</body>
</html>