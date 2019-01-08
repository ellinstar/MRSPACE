<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/compCommon.js"></script>
<script type="text/javascript">
	$(function() {
		// 검색 후 검색 대상과 단어 출력
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			/* $("#search").val("<c:out value='${data.search}'/>"); */

			/* if ($("#search").val() != 'sp_Name') {
				// :contains()는 특정 테스트를 포함한 요소반환
				if ($("#search").val() == 'sp_Name')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'sp_Name')
					value = "#list tr td.name";
				$(value + ":contains('" + word + "')").each(
						function() {
							var regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).text().replace(
											regex,
											"<span class='required'>" + word
													+ "</span"));
						});
			} */
		}

		// 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정
		if ("<c:out value='${data.pageSize}' /> " != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		// 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트
		$("#pageSize").change(function() {
			goPage(1);
		});

		/* // 검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		}); */

		// 검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function() {
			if (!chkSubmit($('#keyword'), "검색어를")) {
				return;
			}
			goPage(1);
		});

		// 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 - X
		$(".goDetail").click(function() {
			var sp_num = $(this).parents("tr").attr("data-num");
			$("#sp_num").val(sp_num);
			console.log("글번호 : " + sp_num);
			// 상세 페이지로 이동하기 위해 form추가 (id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/boardDetail.do"
			});
			$("#detailForm").submit();
		});
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		$("#page").val(page);
		$("#f_Search").attr({
			"method" : "get",
			"action" : "/space/spaceList.do"
		});
		$("#f_Search").submit();
	}

	/* 전체목록 불러오기 */
	function spaceAll() {
		console.log("전체목록불러오기성공!")
		location.href = "/space/spaceList.do?cp_Num=${ cp_Num }";
	}

	/* 공간 등록하기 */
	function spaceRegister() {
		location.href = "/space/spaceRegister.do";
	}

	// 수정 버튼 클릭 메소드
	$(document).ready(function() {
		$("#spaceModify").click(function() {
			var sp_Num = $(this).parents("tr").attr("attr-Num");
			$("#sp_Num").val(sp_Num);
			console.log("공간번호 : " + sp_Num);
			// 수정 페이지로 이동하기 위해 form 추가 (id : modifyForm)
			$("#modifyForm").attr({
				"method" : "get",
				"action" : "/space/spaceModifyForm.do"
			});
			$("#modifyForm").submit();
		});
	});
</script>
<script type="text/javascript">
	document.title = 'MRSPACE : 공간목록';
</script>
</head>
<body>
	<br>
	<h1>공간목록</h1>
	<br>
	<div class="container">
		<%-- ========= 상세 페이지 이동을 위한 FORM ============= --%>
		<form name="modifyForm" id="modifyForm">
			<input type="hidden" name="sp_Num" id="sp_Num">
			<%-- <input type="hidden" name="cp_Id" id="cp_Id" value='${cplogin.cp_Id}'> --%>
		</form>

		<%-- ================== 검색기능 시작 ================= --%>
		<div class="spaceSearch">

			<form id="f_Search" name="f_Search">
				<%-- <input type="hidden" id="order_by" name="order_by" value="${data.order_by}" />
				<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}" /> --%>
				<label for="spaceListCnt">총 개수 : ${total}</label> <input
					type="button" value="전체목록" onclick="javascript:spaceAll()">
				<input type="button" value="검색" id="searchData" /> <input
					type="text" name="keyword" id="keyword" placeholder="공 간 명 검 색" />
				<input type="hidden" name="page" id="page" value="${ data.page }" />
				<input type="hidden" name="cp_Num" id="cp_Num" value="${ cp_Num }"/>
				<!-- <select name="pageSize" id="pageSize">
					<option value="3">3</option>
					<option value="5">5</option>
					<option value="7">7</option>
					<option value="10">10</option>
				</select> -->
			</form>
		</div>
		<%-- ================== 검색기능 종료 ================= --%>

		<%-- =================== 리스트 시작  ================= --%>
		<div class="spaceList">
			<table border="1" width="100%">
				<colgroup>
					<col width="7%">
					<col width="15%">
					<col width="28%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th data-value="sp_num" class="order">번호 <c:choose>
								<c:when
									test="${data.order_by=='sp_num' and  data.order_sc=='DESC'}"></c:when>
							</c:choose>
						</th>
						<th>공간명</th>
						<th>주소</th>
						<th>공간유형</th>
						<th>총 수량</th>
						<th>남은 수량</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="spList">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty spaceList}">
							<c:forEach var="space" items="${spaceList}" varStatus="status">
								<tr class="tac" data-num="${space.sp_Num}">
									<td>${count - status.index}</td>
									<td class="goDetail"><a
										href="/common/commonDetail.do?sp_Num=${space.sp_Num}">${space.sp_Name}</a></td>
									<td>${space.sp_Address}</td>
									<td>${space.sp_Type}</td>
									<td>${space.sp_Stock}</td>
									<td>${space.sp_Rest}</td>
									<td>
										<%-- <input type="hidden" value="${space.sp_Num}">
										<input type="button" id="spaceModify" value="수정"/> --%> <a
										href="/common/spaceModify2.do?sp_Num=${space.sp_Num}">수정</a>
									</td>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" class="tac">등록된 공간이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- =================== 리스트 종료  ================= --%>

		<%-- ================ 공간등록 버튼 출력 시작 =============== --%>
		<div class="contentBtn">
			<input type="button" value="등록하기" id="spaceRegister"
				onclick="javascript:spaceRegister()">
		</div>
		<%-- ================ 공간등록 버튼 출력 종료 =============== --%>

		<%-- =============== 페이지 네비게이션 시작 =============== --%>
		<div id="boardPage">
			<tag:paging page="${data.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
		<%-- =============== 페이지 네비게이션 종료 =============== --%>
	</div>
</body>
</html>