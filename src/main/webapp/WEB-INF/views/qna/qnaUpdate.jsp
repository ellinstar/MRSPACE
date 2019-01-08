<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>글수정 화면</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/qna.css" />

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		/* 수정 버튼 클릭 시 처리 이벤트 */
		$("#qnaUpdateBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#qna_Title'), "제목을"))
				return;
			else if (!chkSubmit($('#qna_Content'), "작성할 내용을"))
				return;
			else {
				//console.log("기본 파일명 : "+$('#qna_File').val());
				$("#f_writeForm").attr({
					"method" : "POST",
					"action" : "/qna/qnaUpdate.do"
				});
				$("#f_writeForm").submit();
			}
		});

		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#qnaListBtn").click(function() {
			location.href = "/qna/qnaList.do";
		});
	});
</script>

</head>

<body>
	<div class="contentContainer">
		<br>
		<div class="contentTit">
			<h2>게시판 글수정</h2>
		</div>
		<br>

		<div class="contentTB">
			<form id="f_writeForm" name="f_writeForm"
				enctype="multipart/form-data">
				<input type="hidden" id="qna_Num" name="qna_Num"
					value="${updateData.qna_Num}" /> <input type="hidden" name="page"
					id="page" value="${param.page}" /> <input type="hidden"
					name="pageSize" id="pageSize" value="${param.pageSize}" />

				<table>
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="ac">글번호</td>
							<td>${updateData.qna_Num}</td>
							<td class="ac">작성일</td>
							<td>${updateData.qna_Date}</td>
						</tr>
						<tr>
							<td class="ac">작성자</td>
							<td colspan="3">${updateData.qna_Name}</td>
						</tr>
						<tr>
							<td class="ac">글제목</td>
							<td colspan="3"><input type="text" name="qna_Title"
								id="qna_Title" value="${updateData.qna_Title}" /></td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td colspan="3"><textarea name="qna_Content"
									id="qna_Content">${updateData.qna_Content}</textarea></td>
						</tr>
						<tr>
							<td class="ac">비밀번호</td>
							<td colspan="3"><input type="password" name="qna_Pw"
								id="qna_Pw" /> <label>수정할 비밀번호를 입력해 주세요.</label></td>
						</tr>
				</table>
			</form>
		</div>

		<div class="contentBtn">
			<input type="button" value="수정" id="qnaUpdateBtn"
				class="btn btn-default"> <input type="button" value="목록"
				id="qnaListBtn" class="btn btn-default">
		</div>
		<br>
	</div>
</body>
</html>
