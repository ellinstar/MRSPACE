<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<!-- Bootstrap core JavaScript-->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<script type="text/javascript">
    	$(document).ready(function(){
    		$("#ok").click(function() {
    			
				$("#actionForm").attr("action","/admin/comp/ok");
				$("#actionForm").submit();
				alert("가입승인 완료!!");
			});
    	});
    </script>

<body class="bg-dark">

    <div class="container" style="width: 100%">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Company</div>
        <div class="card-body">
          <form>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="namel" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="namel">상호명 </label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="name" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="name">${detail.cp_Name}</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="idl" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="idl">아이디 </label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="id" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="id">${detail.cp_Id}</label>
                  </div>
                </div>
                
              </div>
            </div>
            
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="bnuml" class="form-control" placeholder="Last name" required="required">
                    <label for="bnuml">사업자</label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="bnum" class="form-control" value="" placeholder="Last name" required="required">
                    <label for="bnum">${detail.cp_Bnum}</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="ceol" class="form-control" placeholder="Last name" required="required">
                    <label for="ceol">대표자명</label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="ceo" class="form-control" placeholder="Last name" required="required">
                    <label for="ceo">${detail.cp_Ceo}</label>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="phonel" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="phonel">연락처</label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="phone" class="form-control" placeholder="First name" required="required" autofocus="autofocus">
                    <label for="phone">${detail.cp_Phone}</label>
                  </div>
                </div>
                <div class="col-md-2">
                  <div class="form-label-group">
                    <input type="text" id="emaill" class="form-control" placeholder="Last name" required="required">
                    <label for="emaill">이메일 </label>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-label-group">
                    <input type="text" id="email" class="form-control" placeholder="Last name" required="required">
                    <label for="email"> ${detail.cp_Email}</label>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-2">
                <div class="form-label-group">
                 	<input type="text" id="addl" class="form-control" placeholder="Confirm password" required="required">
                 	<label for="addl">본사주소</label>
               		</div>
            	</div>
              <div class="col-md-10">
                <div class="form-label-group">
                 	<input type="text" id="add" class="form-control" placeholder="Confirm password" required="required">
                 	<label for="add">${detail.cp_Add}</label>
               		</div>
            	</div>
            </div>
            </div>
            
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-2">
                <div class="form-label-group">
                 <input type="text" id="bankl" class="form-control" placeholder="Confirm password" required="required">
                 <label for="bankl">입금계좌 </label>
               </div>
              </div>
              <div class="col-md-10">
                <div class="form-label-group">
                 <input type="text" id="bank" class="form-control" placeholder="Confirm password" required="required">
                 <label for="bank"> ${detail.cp_Bank} ${detail.cp_Account}</label>
               </div>
              </div>
            </div>
            </div>
            
          </form>
          <form id="actionForm" >
            <input type="hidden" id=cp_Num name="cp_Num" value='<c:out value="${detail.cp_Num}"/>'/>
          </form>
          <div class="button-group ">
			<button>삭제</button>&nbsp;
			<button>반려</button>&nbsp;
			<button>접수</button>&nbsp;
			<button id="ok">승인</button>
          </div>
        </div>
      </div>
    </div>
    
  </body>

</html>