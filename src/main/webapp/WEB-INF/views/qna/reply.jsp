<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>댓글</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/reply.css" />

<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	var replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", pwdConfirm = 0, btnKind = "";
	$(function() {
		/** 기본 덧글 목록 불러오기 */
		var qna_Num = "<c:out value='${detail.qna_Num}' />";
		listAll(qna_Num)
	});

	// 리스트 요청 함수
	function listAll(qna_Num) {
		$("#comment_list").html("");
		var url = "/rep/all/" + qna_Num + ".do";
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var rep_num = this.rep_num;
				var rep_name = this.rep_name;
				var rep_content = this.rep_content;
				var rep_date = this.rep_date;
				addNewItem(rep_num, rep_name, rep_content, rep_date);
			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}

	/** 새로운 글을 화면에 추가하기 위한 함수*/
	function addNewItem(rep_num, rep_name, rep_content, rep_date) {

		// 새로운 글이 추가될 li태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", rep_num);
		new_li.addClass("comment_item");

		// 작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		// 작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(rep_name);

		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + rep_date + " ");

		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rep_content);

		// 조립하기
		writer_p.append(name_span).append(date_span)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
	
</script>

</head>

<body>
	<div id="replyContainer">
		<h1></h1>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>
</body>
</html>
