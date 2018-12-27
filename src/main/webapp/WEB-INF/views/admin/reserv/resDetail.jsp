<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<style type="text/css">
.card-register {
  max-width: 50rem;
}
label, input{
	text-align: center;
}
.label{
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
        <div class="card-header">Register Detail</div>
        <div class="card-body">
          <form>
            <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">예약번호 </label>
                </div>
                <div class="col-md-4 form-label-group">
                	<input type="text" id="num" class="form-control" placeholder="Last name" required="required">
                    <label for="num">${res.res_Num}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">회원ID </label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="id" class="form-control" placeholder="Last name" required="required">
                    <label for="id">${res.mem_Id}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">예약자 이름 </label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="name" class="form-control" placeholder="Last name" required="required">
                    <label for="name">${mem.mem_Name}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">예약자 연락처 </label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="phone" class="form-control" placeholder="Last name" required="required">
                    <label for="phone">${mem.mem_Phone}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">공간명</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="spName" class="form-control" placeholder="Last name" required="required">
                    <label for="spName">${sp.sp_Name}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">공간유형</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="type" class="form-control" placeholder="Last name" required="required">
                    <label for="type">${sp.sp_Type}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">예약신청일자</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="date" class="form-control" placeholder="Last name" required="required">
                    <label for="date">${res.res_Date}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">업체수락일자</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="commit" class="form-control" placeholder="Last name" required="required">
                    <label for="commit">${res.res_Date}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">이용기간</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="use" class="form-control" placeholder="Last name" required="required">
                    <label for="use">${res.res_UseDate}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">예약진행상태</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="state" class="form-control" placeholder="Last name" required="required">
                    <label for="state">${res.res_State}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">결제일자</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="pay" class="form-control" placeholder="Last name" required="required">
                    <label for="pay">${res.res_Date}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">결제금액</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="amount" class="form-control" placeholder="Last name" required="required">
                    <label for="amount">${res.res_Amount}</label>
                </div>
            </div>
             <div class="form-group form-row">
                <div class="col-md-2 form-label-group">
                    <label class="label">업체명</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="comp" class="form-control" placeholder="Last name" required="required">
                    <label for="comp">${sp.cp_Name}</label>
                </div>
                <div class="col-md-2 form-label-group">
                    <label class="label">업체연락처</label>
                </div>
                <div class="col-md-4 form-label-group">
                    <input type="text" id="cpPhone" class="form-control" placeholder="Last name" required="required">
                    <label for="cpPhone">${sp.cp_Phone}</label>
                </div>
            </div>
            
            
          </form>
          <a href="/admin/reserv" class="btn btn-default">확인</a>
        </div>
      </div>
    </div>
  </body>
</html>