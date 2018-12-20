<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글쓰기 화면</title>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/qna.css" />
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#qnaInsertBtn").click(function(){
					//입력값 체크
					if (!chkSubmit($('#qna_Name'),"이름을"))	return;
					else if (!chkSubmit($('#qna_Title'),"제목을"))	return;
					else if (!chkSubmit($('#qna_Content'),"작성할 내용을"))	return;
					/* else if (!chkSubmit($('#file'),"첨부파일을"))	return;
					else if (!chkFile($('#file'))) return; */
					else if (!chkSubmit($('#qna_Pw'),"비밀번호를"))	return;
					else {
						/* if($('#file').val()!=""){
							if(!chkFile($('#file'))) return;
						}  */
						$("#f_writeForm").attr({
							"method":"POST",
							"action":"/qna/qnaInsert.do"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#qnaListBtn").click(function(){
					location.href="/qna/qnaList.do";
				});
			});
		</script>
	</head>
	<body>	
		<div class="contentContainer">
			<div class="contentTit"><h3>게시판 글작성</h3></div>
	
			<div class="contentTB">
				<form id="f_writeForm" name="f_writeForm">
					<table id="qnaWrite">
						<colgroup>
							<col width="17%" />
							<col width="83%" />
						</colgroup>
						<tr>
							<td class="ac">작성자</td>
							<td><input type="text" name="qna_Name" id="qna_Name"></td>
						</tr>
						<tr>
							<td class="ac">글제목</td>
							<td><input type="text" name="qna_Title" id="qna_Title"></td>
						</tr>
						<tr>
							<td class="ac vm">내용</td>
							<td><textarea name="qna_Content" id="qna_Content"></textarea></td>
						</tr>
						<!-- <tr>
							<td class="ac">첨부파일</td>
							<td><input type="file" name="file" id="file"></td>
						</tr> --> 
						<tr>
							<td class="ac">비밀번호</td>
							<td><input type="password" name="qna_Pw" id="qna_Pw" ></td>
						</tr>	
					</table>
				</form>
			</div>
				
			<div class="contentBtn">
				<input type="button" value="저장" class="but" id="qnaInsertBtn">
				<input type="button" value="목록" class="but" id="qnaListBtn">
			</div>
		</div>
	</body>
</html>