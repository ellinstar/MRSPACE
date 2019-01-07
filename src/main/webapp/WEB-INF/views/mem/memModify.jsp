<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Update Mem!</title>

<!-- Bootstrap core CSS -->
<link href="/resources/include/css/mem.css" rel="stylesheet">

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/modify.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("기존 비밀번호 검증에 실패하였습니다. \n기존 비밀번호를 다시 확인해 주세요. ");
				break;
			case 2:
				alert("회원정보 수정에 오류가 발생하였습니다. \n잠시 후 다시 진행해 주세요.");
				break;
			case 3:
				alert("회원정보 수정 성공.");
				break;
			case 5:
				alert("회원 탈퇴에 오류가 발생하였습니다. \n잠시 후 다시 진행해 주세요.");
				break;
			case 6:
				alert("회원탈퇴 성공.");
				break;
			}
		}
	}

	function jobCheck() {
		var job = "${mem.mem_Job}";
		$("#job").val(job).prop("selected", "true");
	}
</script>
<<<<<<< HEAD
<style type="text/css">
#mem_Delete {
	margin-left: 200px;
}
</style>
</head>
<body>
	<c:if test="${login == null and cp_Id == null}">
		<c:redirect url="/mem/login.do" />
	</c:if>
=======

<style type="text/css">
#mem_Delete {
	margin-left: 200px;
}
</style>

</head>

<body>
>>>>>>> refs/remotes/origin/상현
	<div class="contentContainer">
		<h1 class="tit_space" align="center">회원정보 수정</h1>
		<br>
		<div class="well">
			<form id="mem_Form" class="form-horizontal">

				<input type="hidden" id="mem_Job" name="mem_Job" />

				<div class="form-group form-group-sm">
					<label for="mem_Id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">${mem.mem_Id}</div>
				</div>
<<<<<<< HEAD
				<!-- <div class="form-group form-group-sm">
						<label for="mem_OldPw" class="col-sm-2 control-label">기존 비밀 번호</label>
						<div class="col-sm-3">
							<input type="password" id="mem_OldPw" name="mem_OldPw" maxlength="20" class="form-control" placeholder="기존 비밀번호 입력" >
						</div>
						<div class="col-sm-5">
							<p class="form-control-static error"></p>
						</div>
					</div> -->
				<div class="form-group form-group-sm">
					<label for="mem_Pw" class="col-sm-2 control-label">변경할 비밀
						번호</label>
					<div class="col-sm-3">
						<input type="password" id="mem_Pw" name="mem_Pw" maxlength="20"
							class="form-control" placeholder="변경할 비밀번호 입력">
=======
				<div class="form-group form-group-sm">
					<label for="mem_Pw" class="col-sm-2 control-label">변경할 비밀
						번호</label>
					<div class="col-sm-3">
						<input type="password" id="mem_Pw" name="mem_Pw" maxlength="20"
							class="form-control" placeholder="변경할 비밀번호 입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
>>>>>>> refs/remotes/origin/상현
					</div>
<<<<<<< HEAD
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
=======
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_PwCheck" class="col-sm-2 control-label">변경할
						비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="mem_PwCheck" name="mem_PwCheck"
							maxlength="20" class="form-control" placeholder="변경할 비밀번호 입력 확인">
>>>>>>> refs/remotes/origin/상현
					</div>
<<<<<<< HEAD
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_PwCheck" class="col-sm-2 control-label">변경할
						비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="mem_PwCheck" name="mem_PwCheck"
							maxlength="20" class="form-control" placeholder="변경할 비밀번호 입력 확인">
=======
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
>>>>>>> refs/remotes/origin/상현
					</div>
<<<<<<< HEAD
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
=======
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Name" class="col-sm-2 control-label">회원이름</label>
					<div class="col-sm-3">${mem.mem_Name}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">${mem.mem_Birth}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Phone" class="col-sm-2 control-label">핸드폰
						번호</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Phone" name="mem_Phone" maxlength="11"
							class="form-control" value="${mem.mem_Phone}">
>>>>>>> refs/remotes/origin/상현
					</div>
<<<<<<< HEAD
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Name" class="col-sm-2 control-label">회원이름</label>
					<div class="col-sm-3">${mem.mem_Name}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">${mem.mem_Birth}</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Phone" class="col-sm-2 control-label">핸드폰
						번호</label>
					<div class="col-sm-3">
						<input type="text" id="mem_Phone" name="mem_Phone" maxlength="11"
							class="form-control" value="${mem.mem_Phone}">
					</div>
=======
>>>>>>> refs/remotes/origin/상현
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="mem_Email" class="col-sm-2 control-label">회원
						이메일</label>
					<div class="col-sm-3">
						<input type="email" id="mem_Email" name="mem_Email" maxlength="30"
							class="form-control" value="${mem.mem_Email}">
					</div>
					<div class="col-sm-3">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="job" class="col-sm-2 control-label">직종</label>
					<div class="col-sm-2">
						<select id="job" class="form-control">
							<option value="IT개발자">IT개발자</option>
							<option value="토목/건축">토목/건축</option>
							<option value="교수/강사">교수/강사</option>
							<option value="법률/행정">법률/행정</option>
							<option value="경영/인사">경영/인사</option>
							<option value="금융/보험">금융/보험</option>
							<option value="예술/스포츠">예술/스포츠</option>
							<option value="디자이너">디자이너</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="수정하기" id="mem_Submit"
							class="btn btn-default" /> <input type="button" value="돌아가기"
							id="mem_Cancel" class="btn btn-default" /> <input type="button"
							value="회원탈퇴" id="mem_Delete" class="btn btn-default" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
