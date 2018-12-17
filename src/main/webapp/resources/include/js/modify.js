$(function(){
	errCodeCheck();
	jobCheck();
	
	var message = [/*"기존 비밀번호를 입력해 주세요.",*/
	               "영문/숫자/특수문자. 8 ~ 20자로 입력해 주세요.",
	               "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
	               "(-) 제외 입력. 예시) 01012345678",
	               "(@) 포함 10~30자. 이메일형식   예(hongkildong@naver.com)"];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$('#mem_OldPw, #mem_Pw, #mem_PwCheck, #mem_Phone, #mem_Email').bind("focus",function(){
		var idx = $("#mem_OldPw, #mem_Pw, #mem_PwCheck, #mem_Phone, #mem_Email").index(this);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});	
	
	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#mem_Submit").click(function(){
		//입력값 체크
		/*if (!formCheck($('#mem_OldPw'), $('.error:eq(0)'), "기존 비밀번호를"))	return;
		else if (!inputVerify(1,'#mem_OldPw', '.error:eq(0)'))	return;*/
		/*else */if (!formCheck($('#mem_Phone'), $('.error:eq(2)'), "휴대폰 번호를"))	return;
		else if (!inputVerify(4,'#mem_Phone', '.error:eq(2)'))	return;
		else if (!formCheck($('#mem_Email'), $('.error:eq(3)'), "이메일 주소를"))	return;
		else if (!inputVerify(5,'#mem_Email', '.error:eq(3)'))	return;
		else { 			
			if($('#mem_Pw').val()!=""){
				if (!inputVerify(1,'#mem_Pw', '.error:eq(0)'))	return;
			}
			if($('#mem_PwCheck').val()!=""){
				if (!inputVerify(1,'#mem_PwCheck', '.error:eq(1)'))	return;
			}
			if($('#mem_Pw').val()!="" && $('#mem_PwCheck').val()!=""){
				if (!passwordCheck()) return;
			}
			$("#mem_Job").val($("#job").val());
			$("#mem_Form").attr({
				"method":"post",
				"action":"/mem/memModify.do"
			});
			$("#mem_Form").submit();
			alert("회원정보수정 성공")
		}
	});	
	
	$("#mem_Cancel").click(function(){
		history.back();
	});
	
	// 회워탈퇴
	$("#mem_Delete").click(function(){
		var retVal = confirm("정말 탈퇴하시겠습니까 ?")
		if (retVal == true) {
			alert("탈퇴가 완료되었습니다.")
			location.href="/mem/memDelete.do";
		} 
	});
});

function passwordCheck(){
	if($("#mem_Pw").val() != $("#mem_PwCheck").val()){
		alert("비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.");
		$("#mem_Pw").val("");
		$("#mem_PwCheck").val("");
		$("#mem_Pw").focus();
		return false;
	}		
	return true;
}


