// 비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck(){
	if($("#mem_Pw").val() != $("#mem_PwCheck").val()){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#mem_PwCheck").focus();
		$("#mem_PwCheck").val("");
		return false;
	}else{		
		return true;
	}
}

var idConfirm = 1;
$(function(){
	errCodeCheck();
	// 사용자에게 요구사항에 대한 문자열로 배열 초기화. 
	var message = ["영문/숫자. 8~20자로 입력해 주세요",
	               "영문/숫자/특수문자. 8~20자로 입력해 주세요",
	               "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
	               "한글/영문. 2~10자로 입력해주세요",
	               "년월일 순으로 8개의 숫자로 입력. 예(19900218)",
	               "(-) 제외 입력. 예시) 01012345678",
	               "(@) 포함 10~30자. 이메일형식 예) hongkildong@naver.com "];
	
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$('#mem_Id, #mem_Pw, #mem_PwCheck, #mem_Name, #mem_Birth, #mem_Phone, #mem_Email').bind("focus",function(){
		var idx = $("#mem_Id, #mem_Pw, #mem_PwCheck, #mem_Name, #mem_Birth, #mem_Phone, #mem_Email").index(this);
		//console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	$("#idConfirmBtn").click(function(){
		if (!formCheck($('#mem_Id'), $('.error:eq(0)'), "아이디를"))	return;
		else if (!inputVerify(0,'#mem_Id', '.error:eq(0)'))	return;
		else{
			$.ajax({
				url : "/mem/memIdConfirm.do",  
				type : "post",                
				data : "mem_Id="+$("#mem_Id").val(),
				error : function(){
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData){
					console.log("resultData : "+resultData);
					if(resultData=="1"){
						$("#mem_Id").parents(".form-group").find(".error").html("현재 사용 중인 아이디입니다.");
					}else if(resultData=="2"){
						$("#mem_Id").parents(".form-group").find(".error").html("사용 가능한 아이디입니다.");
						idConfirm = 2;
					}
				}
			});
		}
	});
	
	/* 회원가입 버튼 클릭 시 처리 이벤트 */
	$("#mem_Submit").click(function(){
		//입력값 체크
		if (!formCheck($('#mem_Id'), $('.error:eq(0)'), "아이디를"))	return;
		else if (!inputVerify(0,'#mem_Id', '.error:eq(0)'))	return;
		else if (!formCheck($('#mem_Pw'), $('.error:eq(1)'), "비밀번호를"))	return;
		else if (!inputVerify(1,'#mem_Pw', '.error:eq(1)'))	return;
		else if (!formCheck($('#mem_PwCheck'), $('.error:eq(2)'), "비밀번호 확인을"))	return;
		else if (!inputVerify(1,'#mem_PwCheck', '.error:eq(2)'))	return;
		else if (!passwordCheck()) return;
		else if (!formCheck($('#mem_Name'), $('.error:eq(3)'), "이름을"))	return;
		else if (!inputVerify(2,'#mem_Name', '.error:eq(3)'))	return;
		else if (!formCheck($('#mem_Birth'), $('.error:eq(4)'), "생년월일을"))	return;
		else if (!inputVerify(3,'#mem_Birth', '.error:eq(4)'))	return;
		else if (!formCheck($('#mem_Phone'), $('.error:eq(5)'), "핸드폰 번호를"))	return;
		else if (!inputVerify(4,'#mem_Phone', '.error:eq(5)'))	return;
		else if (!formCheck($('#mem_Email'), $('.error:eq(6)'), "이메일 주소를"))	return;
		else if (!inputVerify(5,'#mem_Email', '.error:eq(6)'))	return;
		else if (idConfirm!=2){ alert("아이디 중복 체크 진행해 주세요."); return;}		
		else {  
			
			$("#mem_Job").val($("#job").val());
			$("#mem_Form").attr({
				"method":"post",
				"action":"/mem/memJoin.do"
			});
			$("#mem_Form").submit();
			alert("회원가입 성공")
		}
	});
	
	$("#mem_Cancel").click(function(){
		history.back();
	});
});
