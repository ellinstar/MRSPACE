<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>


<body class="bg-dark">

    <div class="container" style="width: 100%">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Register an Account</div>
        <div class="card-body">
          <form>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="id" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="id">아이디 : ${mem.mem_Id}</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="name" class="form-control" placeholder="Last name" required="required">
                    <label for="name">이름 : ${mem.mem_Name}</label>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="phone" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="phone">연락처 : ${mem.mem_Phone}</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="job" class="form-control" placeholder="Last name" required="required">
                    <label for="job">직종 : ${mem.mem_Job}</label>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="birth" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="birth">생년월일 : ${mem.mem_Birth}</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" id="join" class="form-control" placeholder="Last name" required="required">
                    <label for="join">가입일 : ${mem.mem_Date}</label>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
                <div class="form-label-group">
                 <input type="text" id="mail" class="form-control" placeholder="Confirm password" required="required">
                 <label for="mail">이메일 : ${mem.mem_Email}</label>
               </div>
            </div>
            
            <div class="form-group">
                <div class="form-label-group">
                 <input type="text" id="lastJoin" class="form-control" placeholder="Confirm password" required="required">
                 <label for="lastJoin">최근 접속일 : ${mem.lastSuccessedLogin}</label>
               </div>
            </div>
            
            
          </form>
          <div class="text-center">
			공 간 사 용 현 황 
			<table class="table table-striped table-bordered" >
			<thead>
			<tr>
				<th>No</th>
				<th>공간명</th>
				<th>기간</th>
				<th>상태</th>
				<th>결제금액(원)</th>
				<th>잔여일</th>
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
							<td><c:out value="${reserv.res_Amount}"/></td>
							<td><c:out value="${reserv.res_Num}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			</tbody>
			</table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>