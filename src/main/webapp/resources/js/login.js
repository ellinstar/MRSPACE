$(function() {
	// 아래 함수는 서버로 받아 온 코드값에 대한 처리 함수(login.jsp 파일에 정의.)
	errCodeCheck();
	$('#mem_Id, #mem_Pw').bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});

	/* 로그인 버튼 클릭 시 처리 이벤트 */
	/*
	 * 함수명: formCheck(유효성 체크 대상, 출력 영역, 메시지 내용)
	 * /*if(!formCheck($('#keyword'),$('#msg'),"검색어를")) return;
	 */
	$("#loginBtn").click(function() {
		if (!formCheck($('#mem_Id'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0, '#mem_Id', '.error:eq(0)'))
			return;
		else if (!formCheck($('#mem_Pw'), $('.error:eq(1)'), "비밀번호를"))
			return;
		else if (!inputVerify(1, '#mem_Pw', '.error:eq(1)'))
			return;
		else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/mem/login.do"
			});
			$("#loginForm").submit();
		}
	});

	$("#comploginBtn").click(function() {
		$("#comploginForm").attr({
			"method" : "POST",
			"action" : "/comp/login.do"
		});
		$("#comploginForm").submit();
	});

	/* 회원가입 버튼 클릭 시 처리 이벤트 */
	$("#joinBtn").click(function() {
		location.href = "/mem/memType.do";
	});
});
