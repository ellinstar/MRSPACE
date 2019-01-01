<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 	src="/resources/include/dist/js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#moveForm");
	$(".mem").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='mem_Id' value='"
		+ $(this).attr("href")+ "'>");
		actionForm.attr("action", "/admin/memdetail");
		actionForm.submit();
	});
});

</script>

<body>


<div class="contentContainer">
   <div class="col-md-12 main">
      <div class="page-header">
         <h3>회원 가입 현황</h3>
      </div>
      
      <div class="col-md-12">
      <!-- =======================상세보기 위한 form========================== -->
      <form id="moveForm" method="get">
      </form>
      <!-- =======================상세보기 위한 form 끝======================== -->
         <table summary="게시판 리스트"
            class="table table-striped table-bordered table-hover">
            <colgroup>
               <col width="5%">
               <col width="20%">
               <col width="10%">
               <col width="20%">
               <col width="20%">
               <col width="17%">
               
            </colgroup>
            <thead>
               <tr>
                  <th>#번호</th>
                  <th>아이디</th>
                  <th>회원이름</th>
                  <th>가입일</th>
                  <th>마지막 접속</th>
                  <th>탈퇴</th>
               </tr>
            </thead>
            <tbody id="memlist">
            <!-- 데이터 출력 -->
            <c:choose>
               <c:when test="${not empty memList}" >
                  <c:forEach var="mem" items="${memList}" varStatus="status">
                     <tr>
                        <td>${status.index + 1}</td>
                        <td>
                       <a class='mem' href='<c:out value="${mem.mem_Id}"/>'><c:out value="${mem.mem_Id}"></c:out></a>
                        </td>
                        <td><c:out value="${mem.mem_Name}"/></td>
                        <td><c:out value="${mem.mem_Date}"/></td>
                        <td><c:out value="${mem.lastSuccessedLogin}"/></td>
                        <c:if test="${mem.mem_State == 1}">
                        <td><c:out value="${mem.lastSuccessedLogin}"/></td>
                        </c:if>
                        <c:if test="${mem.mem_State == 0}">
                        <td> </td>
                        </c:if>
                     </tr>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td colspan="6" class="tac">등록된 회원이 존재하지 않습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>
            </tbody>
         </table>
      </div>
      </div>
   </div>
</body>
</html>