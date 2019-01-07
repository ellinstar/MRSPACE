<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<style type="text/css">
.card-register {
  max-width: 80rem;
}
label, input{
	text-align: center;
}
.label{
	color: white;
	background-color: #EAEAEA;
}
.form-control{
	border-color: #EAEAEA;
	border: 0.1;
}
</style>
</head>
<body class="bg-dark">

    <div class="container" style="width: 100%">
      <div class="card card-register mx-auto mt-8">
        <div class="card-header">Register an Account</div>
        <div class="card-body">
          <form>
            <div class="form-group form-row">
                <div class="col-md-1 form-label-group">
                    <label class="label">아이디 </label>
                </div>
                <div class="col-md-5 form-label-group">
                	<input type="text" id="id" class="form-control" placeholder="Last name" required="required">
                    <label for="id">${mem.mem_Id}</label>
                </div>
                <div class="col-md-1 form-label-group">
                    <label class="label">이름 </label>
                </div>
                <div class="col-md-5 form-label-group">
                    <input type="text" id="name" class="form-control" placeholder="Last name" required="required">
                    <label for="name">${mem.mem_Name}</label>
                </div>
            </div>
            
            <div class="form-group form-row">
                <div class="col-md-1 form-label-group">
                    <label class="label">연락처 </label>
                </div>
                <div class="col-md-5 form-label-group">
                    <input type="text" id="phone" class="form-control" placeholder="First name" required="required">
                    <label for="phone">${mem.mem_Phone}</label>
                </div>
                <div class="col-md-1 form-label-group">
                    <label class="label">직종 </label>
                </div>
                <div class="col-md-5 form-label-group">
                   <input type="text" id="job" class="form-control" placeholder="Last name" required="required">
                    <label for="job">${mem.mem_Job}</label>
                </div>
            </div>
            
            <div class="form-group form-row">
            	<div class="col-md-1  form-label-group">
                 <label class="label">이메일 </label>
               </div>
                <div class="col-md-5 form-label-group">
                 <input type="text" id="mail" class="form-control" placeholder="Confirm password" required="required">
                 <label for="mail">${mem.mem_Email}</label>
               </div>
                
                <div class="col-md-1 form-label-group">
                    <label class="label">가입일</label>
                </div>
                <div class="col-md-5 form-label-group">
                    <input type="text" id="join" class="form-control" placeholder="Last name" required="required">
                    <label for="join">${mem.mem_Date}</label>
                </div>
            </div>
            
            <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">생년월일</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="birth" class="form-control" placeholder="First name" required="required">
                    <label for="birth">${mem.mem_Birth}</label>
                </div>
                <div class="col-md-2  form-label-group">
                 <label class="label">최근 접속일 </label>
               </div>
                <div class="col-md-4 form-label-group">
                <input type="text" id="lastJoin" class="form-control" placeholder="Confirm password" required="required">
                 <label for="lastJoin">${mem.lastSuccessedLogin}</label>
               </div>
            </div>
            
            
          </form>
          <div class="text-center">
			<h4>공 간 사 용 현 황</h4> 
			<table class="table table-striped table-bordered" >
			<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="30%">
					<col width="10%">
					<col width="20%">
				</colgroup>
			<thead>
			<tr>
				<th>No</th>
				<th>공간명</th>
				<th>기간</th>
				<th>상태</th>
				<th>결제금액(원)</th>
			</tr>
			</thead>
			<tbody>
			
			<c:choose>
				<c:when test="${not empty reservlist }">
					<c:forEach var="reserv" items="${reservlist}">
						<tr data-num="${reserv.res_Num}">
							<td><c:out value="${reserv.res_Num}"/></td>
							<td><c:out value="${reserv.sp_Name}"/></td>
							<td><c:out value="${reserv.resUseDate}"/></td>
							<td><c:out value="${reserv.res_State}"/></td>
							<td><fmt:formatNumber value="${reserv.res_Amount}"/> </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">예약 이력이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
			</table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>