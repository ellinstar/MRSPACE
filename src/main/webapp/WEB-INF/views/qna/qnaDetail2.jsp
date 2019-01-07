<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>글상세 보기</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/qna.css" />

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	var butChk = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
	$(function() {
		$("#pwdChk").hide();

		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#updateFormBtn").click(function() {
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
			butChk = 1;
		});

		/* 삭제 버튼 클릭 시 처리 이벤트 */
		$("#qnaDeleteBtn").click(function() {
			$("#pwdChk").show();
			$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
			butChk = 2;
		});

		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		$("#pwdBtn").click(function() {
			qnaPwdConfirm();
		});

		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#qnaListBtn").click(function() {
			location.href = "/qna/qnaFixed.do";
		});
	});

	/* 비밀번호 확인 버튼 클릭시 실질적인 처리 함수 */
	function qnaPwdConfirm() {
		if (!chkSubmit($('#qna_Pw'), "비밀번호를"))
			return;
		else {
			$.ajax({
				url : "/qna/pwdConfirm.do", //전송 url
				type : "post", // 전송 시 method 방식
				data : $("#f_pwd").serialize(), //폼전체 데이터 전송
				dataType : "text",
				/* contentType : "text/html; charset=euc-kr", */
				error : function() { //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				}, //정상적으로 실행이 되었을 경우
				success : function(resultData) {
					var goUrl = ""; // 이동할 경로를 저장할 변수
					if (resultData == "실패") { // 일치하지 않는 경우
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color",
								"red");
						$("#qna_Pw").select();
					} else if (resultData == "성공") { // 일치할 경우
						$("#msg").text("");
						if (butChk == 1) {
							goUrl = "/qna/qnaUpdateForm.do";
						} else if (butChk == 2) {
							goUrl = "/qna/qnaDelete.do";
						}
						$("#f_data").attr("action", goUrl);
						$("#f_data").submit();
					}
				}
			});
		}
	}
</script>

</head>

<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>게시판 상세보기</h3>
		</div>

		<form name="f_data" id="f_data" method="POST">
			<input type="hidden" name="qna_Num" value="${detail.qna_Num}" /> <input
				type="hidden" name="page" id="page" value="${param.page}" /> <input
				type="hidden" name="pageSize" id="pageSize"
				value="${param.pageSize}" />
			<%-- <input type="hidden" name="qna_File" id="qna_File" value="${detail.qna_File}" /> --%>
		</form>

		<%-- ========= 비밀번호 확인 버튼 및 버튼 추가 시작 ====== --%>
		<table id="qnaPwdBut">
			<tr>
				<td id="btd1">
					<div id="pwdChk">
						<form name="f_pwd" id="f_pwd">
							<input type="hidden" name="qna_Num" id="qna_Num"
								value="${detail.qna_Num}" /> <label for="qna_Pw" id="l_pwd">비밀번호
								: </label> <input type="password" name="qna_Pw" id="qna_Pw" /> <input
								type="button" id="pwdBtn" value="확인" /> <span id="msg"></span>
						</form>
					</div>
				</td>
				<td id="btd2"><input type="button" value="수정"
					id="updateFormBtn"> <input type="button" value="삭제"
					id="qnaDeleteBtn"> <input type="button" value="목록"
					id="qnaListBtn"></td>
			</tr>
		</table>
		<%-- =========== 비밀번호 확인 버튼 및 버튼 추가 종료 ====== --%>

		<%-- =============== 상세 정보 보여주기 시작 ============ --%>
		<div class="contentTB">
			<table>
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr>
						<td class="ac">작성자</td>
						<td>${detail.qna_Name}</td>
						<td class="ac">작성일</td>
						<td>${detail.qna_Date}</td>
					</tr>
					<tr>
						<td class="ac">제목</td>
						<td colspan="3">${detail.qna_Title}</td>
					</tr>
					<tr>
						<td class="ac vm">내용</td>
						<td colspan="3">${detail.qna_Content}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
