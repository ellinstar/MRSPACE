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
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script>
   function errCodeCheck() {
      var errCode = '<c:out value="${errCode}"/>';
      if (errCode != "") {
         switch (parseInt(errCode)) {
         case 1:
            alert("아이디 혹은 비밀번호가 일치하지 않거나 존재하지 않는 회원 입니다. 다시 확인해 주세요");
            break;
         }
      }

   }

   $(document).ready(function() {
	      $("input:radio[name=member]").on('change',function() {
	    	  var member = event.target.value;
	         if (member == "mem") {
	            $("#memLogin").show();
	            $("#cmpLogin").hide();
	         } else if(member == "cmp"){
	            $("#cmpLogin").show();
	            $("#memLogin").hide();
	         }
	      });
	   });
   
</script>
</head>
<body>
   <c:if test="${login.mem_Id == null or login.mem_Id == ''}">
      <div class="contentContainer">
         <div id="memLogin">
            <form class="form-signin" id="loginForm" name="loginForm">
               <h2 class="form-signin-heading">로 그 인</h2>
               <input type="radio" name="member" value="mem" checked>일반 회원 
               <input type="radio" name="member" value="cmp">업체 회원
                <label for="mem_Id" class="sr-only">아 이 디</label> 
                <input   type="text" id="mem_Id" name="mem_Id" class="form-control" placeholder="ID" required autofocus> 
                <label for="mem_Pw" class="sr-only">비밀번호</label> 
                <input type="password" id="mem_Pw" name="mem_Pw" class="form-control" placeholder="Password" required>
               <input type="button" class="btn btn-lg btn-primary btn-block"
                  id="loginBtn" value="로그인">
                  &nbsp;<a href="/mem/memSearch.do">아이디 찾기</a>&nbsp;&nbsp;
                  <a href="/mem/pwChange.do">비밀번호 변경</a>&nbsp;&nbsp;
                  <a href="/mem/memType.do">회원가입</a>
            </form>
         </div>


          <div id="cmpLogin" style="display: none;">
           <form class="form-signin" id="comploginForm" name="comploginForm">
               <h2 class="form-signin-heading">업체 로 그 인</h2>
               <input type="radio" name="member" value="mem" >일반 회원 
               <input type="radio" name="member" value="cmp" checked>업체 회원
                <label for="cp_Id" class="sr-only">아 이 디</label> 
                <input   type="text" id="cp_Id" name="cp_Id" class="form-control" placeholder="ID" required autofocus> 
                <label for="cp_Pw" class="sr-only">비밀번호</label> 
                <input type="password" id="cp_Pw" name="cp_Pw" class="form-control" placeholder="Password" required>
               <input type="button" class="btn btn-lg btn-primary btn-block"
                  id="comploginBtn" value="로그인">
                  &nbsp;<a href="/comp/compSearch.do">아이디 찾기</a>&nbsp;&nbsp;
                  <a href="/comp/pwChange.do">비밀번호 변경</a>&nbsp;&nbsp;
                  <a href="/mem/memType.do">회원가입</a>
            </form>
         </div>
      </div>
   </c:if>


   <div>
      <c:if test="${login.mem_Id!=null and login.mem_Id!=''}">
            <legend><strong>[ ${login.mem_Name} ]님 어서오세요</strong></legend>
					<span id="memMenu" class="tac">
						<a href="/mem/logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
						<a href="/mem/memModify.do">정보수정 및 회원탈퇴</a>&nbsp;&nbsp;&nbsp;
					</span>
      </c:if>
      
      <c:if test="${login.cp_Id!=null and login.cp_Id!=''}">
            <legend><strong>[ ${login.cp_Name} ]님 어서오세요</strong></legend>
					<span id="memMenu" class="tac">
						<a href="/mem/logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
						<a href="/mem/memModify.do">정보수정 및 회원탈퇴</a>&nbsp;&nbsp;&nbsp;
					</span>
      </c:if>
      
   </div>
</body>
</html>