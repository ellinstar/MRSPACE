<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/include/css/comp.css" rel="stylesheet">
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/compCommon.js"></script>
<!-- <meta http-equiv="refresh" content="3; url=/space/spaceList.do"> -->

<title>회원가입 완료 화면</title>
<script type="text/javascript">
	function goList() {
		location.href = "/space/spaceList.do?cp_Num=${ cp_Num }";
	}
</script>
<style type="text/css">
#goList {
	float: right;
    position: relative;
    left: -50%;
}
</style>
<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->

<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/member.css" /> -->
</head>
<body>
	<div class="contentContainer">
		<div>
			<div class="tac">
			<br><br><br>
				<h2 class="tit_space" align="center">공간 등록 신청에 성공하였습니다.</h2>
				<br><br><br>
				<input type="button" id="goList" name="goList" onclick="javascript:goList()" value="확인"
				class="btn btn-default" />

			</div>
		</div>
	</div>
</body>
</html>