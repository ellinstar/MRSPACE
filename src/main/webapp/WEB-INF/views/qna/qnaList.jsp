<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글 목록</title>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/qna.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				var word="<c:out value='${data.keyword}' />";
				var value="";
				if(word!=""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");

					if($("#search").val()!='qna_Content'){
						//:contains()는 특정 텍스트를 포함한 요소반환 	
						if($("#search").val()=='qna_Title') 
							value = "#list tr td.goDetail";
						else if($("#search").val()=='qna_Name') 
							value="#list tr td.name";
				    	$(value+":contains('"+word+"')").each(function () {
							var regex = new RegExp(word,'gi');
							$(this).html($(this).text().replace(regex, "<span class='required'>"+word+"</span>"));
				    	});
					}
				}
				
				/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정*/
				if("<c:out value='${data.pageSize}' />"!=""){
					$("#pageSize").val("<c:out value='${data.pageSize}' />");
				}
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function() {
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					}else if($("#search").val()!="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
		
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#search").val()!="all"){
						if(!chkSubmit($('#keyword'),"검색어를")) return;
					}
					goPage(1);
				});
				
				
				$(".order").click(function(){
					var order_by = $(this).attr("data-value");
					console.log("선택값 : "+order_by);
					
					$("#order_by").val(order_by);
					if($("#order_sc").val()=='DESC'){
						$("#order_sc").val('ASC');
					} else{
						$("#order_sc").val('DESC');
					}
					goPage(1);
				});
				
				/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
				$("#pageSize").change(function() {
					goPage(1);
				});
				
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */		
				$("#insertFormBtn").click(function(){
					location.href = "/qna/qnaWriteForm.do";
				});
				
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
				$(".goDetail").click(function(){
					var qna_Num =  $(this).parents("tr").attr("data-num");	
					$("#qna_Num").val(qna_Num);
					console.log("글번호 : "+qna_Num);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
					$("#detailForm").attr({
						"method":"get",
						"action":"/qna/qnaDetail.do"
					});
					$("#detailForm").submit(); 
				});
			});
			
			
			/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */ 
			function goPage(page){ 
				if($("#search").val()=="all"){ 
					$("#keyword").val(""); 
				}
				$("#page").val(page);
				$("#f_search").attr({ 
					"method":"get", 
					"action":"/qna/qnaList.do" 
				}); 
				$("#f_search").submit();
			}

		</script>
	</head>
	<body>
		<div class="contentContainer">
			<div class="contentTit"><h3>문의 게시판</h3></div>
			
			<%-- ========= 상세 페이지 이동을 위한 FORM ============= --%>
			<form name="detailForm" id="detailForm">
					<input type="hidden" name="qna_Num" id="qna_Num">
					<input type="hidden" name="page" value="${data.page}">
					<input type="hidden" name="pageSize" value="${data.pageSize}">
			</form>
			<%-- ================== 검색기능 시작 ================= --%>
			<div id="qnaSearch">
				<form id="f_search" name="f_search">
					<input type="hidden" id="page" name="page" value="${data.page}"/>
					<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
					<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
					<table summary="검색">
						<colgroup>
							<col width="70%"></col>
							<col width="30%"></col>
						</colgroup>
						<tr>
							<td id="btd1">
								<label>검색조건</label>
								<select id="search" name="search">
									<option value="all">전체</option>
									<option value="qna_Title">제목</option>
									<option value="qna_Content">내용</option>
									<option value="qna_Name">작성자</option>
								</select>
								<input type="text" name="keyword" id="keyword" placeholder="검색어를입력하세요" />
								<input type="button" value="검색" id="searchData" />
							</td>
							<td id="btd2">한페이지에
								<select id="pageSize" name="pageSize">
									<option value="1">1줄</option>
									<option value="2">2줄</option>
									<option value="3">3줄</option>
									<option value="5">5줄</option>		
									<option value="7">7줄</option>
									<option value="10">10줄</option>				
								</select>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<%-- ================== 검색기능 종료 ================= --%>	

			<%-- =================== 리스트 시작  ================= --%>
			<div id="qnaList">
			<table summary="게시판 리스트">
				<colgroup>
					<col width="10%" />
					<col width="62%" />
					<col width="15%" />
					<col width="13%" />
				</colgroup>
				<thead>
					<tr>
						<th data-value="qna_Num" class="order">글번호
							<c:choose>
								<c:when test="${data.order_by=='qna_Num' and  data.order_sc=='ASC'}">▲</c:when>
								<c:when test="${data.order_by=='qna_Num' and  data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th>글제목</th>
						<th data-value="qna_Date" class="order">작성일
							<c:choose>
								<c:when test="${data.order_by=='qna_Date' and  data.order_sc=='ASC'}">▲</c:when>
								<c:when test="${data.order_by=='qna_Date' and  data.order_sc=='DESC'}">▼</c:when>
								<c:otherwise>▲</c:otherwise>
							</c:choose>
						</th>
						<th class="borcle">작성자</th>
					</tr>
				</thead>
				<tbody id="list">
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty qnaList}" >
						<c:forEach var="qna" items="${qnaList}"
						 varStatus="status">
							<tr class="tac" 
							data-num="${qna.qna_Num}">
								<td>
								${count - status.index}</td>
								<td class="goDetail tal">
								${qna.qna_Title}</td>
								<td>${qna.qna_Date}</td>
								<td class="name">
								${qna.qna_Name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
			</table>
			

			</div>
			<%-- =================== 리스트 종료  ================= --%>
			
			<%-- ================ 글쓰기 버튼 출력 시작 =============== --%>
			<div class="contentBtn">
				<input type="button" value="글쓰기" id="insertFormBtn">
			</div>
			<%-- ================ 글쓰기 버튼 출력 종료 =============== --%>
			
			<%-- =============== 페이지 네비게이션 시작 =============== --%>
			<div id="qnaPage">
				<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
			</div>
			<%-- =============== 페이지 네비게이션 종료 =============== --%>
		</div>
	</body>
</html>
