<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
$(function() {
   /* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */      
   $("#mem_Id").click(function(){
      // 상세 페이지로 이동하기 위해 form 추가  
      $("#move").attr({
         "method":"get",
         "action":"/admin/memdetail"
      });
      $("#move").submit(); 
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
         <table summary="게시판 리스트"
            class="table table-striped table-bordered table-hover">
            <colgroup>
               <col width="3%">
               <col width="20%">
               <col width="20%">
               <col width="25%">
               <col width="25%">
               <col width="7%">
               
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
                       
                        <form name="move" id="move">
                        <input type="text" readonly value='${mem.mem_Id}' id="mem_Id" name="mem_Id">
                        </form>
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