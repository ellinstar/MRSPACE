// 비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck() {
	if ($("#cp_Pw").val() != $("#cp_Pw2").val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#cp_Pw").focus();
		$("#cp_Pw2").val("");
		return false;
	} else {
		return true;
	}
}
// 아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var cp_id = $("#cp_Id").val();
	var cp_pw = $("#cp_Pw").val();
	if (cp_pw.indexOf(cp_id) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#cp_Pw").val("");
		$("#cp_Pw").focus();
		return false;
	} else {
		return true;
	}
}

$(document).ready(function() {
var idConfirm = 1;
var bNumConfirm = 1;
	errCodeCheck();
	// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = [ "영문,숫자만 가능. 6~12자로 입력해 주세요.",
					"영문,숫자,특수문자만. 8~20자 입력해 주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"한글/영문. 2~20자로 입력해주세요.",
					"한글/영문. 2~10자로 입력해주세요.",
					"시/군/도 포함 정확한 주소를 입력해주세요.",
					"(-)를 포함해서 입력해주세요. ",
					"정확한 은행과 계좌번호를 입력해주세요.",
					"(-) 제외 입력. 예시) 01012345678",
					"(@) 포함 10~30자. 이메일형식 예) hongkildong@naver.com " ];
/*
 * 3. 비밀번호와 비밀번호 확인란은 값이 일치해야 합니다. 
 * 7. - 포함해서 입력해 주세요. 예시) 000-00-00000
 * 9. -포함 입력해 주세요. 예시) 010-1234-5678
 * 10. 이메일 형식을 맞춰주세요.
 *  */
	$(".idError").html(message[0]);
	$(".pwError").html(message[1]);
	$(".pw2Error").html(message[2]);
	$(".nameError").html(message[3]);
	$(".ceoError").html(message[4]);
	$(".addError").html(message[5]);
	$(".bnumError").html(message[6]);
	$(".accountError").html(message[7]);
	$(".phoneError").html(message[8]);
	$(".emailError").html(message[9]);
	
	$("#cp_Id").bind("focus", function() {
		$(".idError").html(message[0]);
	});
	$("#cp_Pw").bind("focus", function() {
		$(".pwError").html(message[1]);
	});
	$("#cp_Pw2").bind("focus", function() {
		$(".pw2Error").html(message[2]);
	});
	$("#cp_Name").bind("focus", function() {
		$(".nameError").html(message[3]);
	});
	$("#cp_Bnum").bind("focus", function() {
		$(".bnumError").html(message[6]);
	});
	$("#cp_Phone").bind("focus", function() {
		$(".phoneError").html(message[8]);
	});
	
	$(
			'#cp_Id, #cp_Pw, #cp_Pw2, #cp_Name, #cp_Ceo, #cp_Add, #cp_Bnum, #cp_Account, #cp_Phone, #cp_Email')
			.bind("focus",
					function() {
						var index = $(
								"#cp_Id, #cp_Pw, #cp_Pw2, #cp_Name, #cp_Ceo, #cp_Add, #cp_Bnum, #cp_Account, #cp_Phone, #cp_Email")
								.index(this);
						// console.log("대상 : " + cp_num );
						$(this).parents("#myForm").find(".error").html(
								message[index]);
					});

	// 아이디 중복체크
	$("#idConfirmBtn")
			.click(
					function() {
						if (!formCheck($('#cp_Id'), $('.idError'), "아이디를")) {
							return;
						} else if (!idVerify('.idError')) {
							return;
						} else {
							var cp_Id = $("#cp_Id").val();
							$
									.ajax({
										url : "/comp/cp_IdConfirm.do",
										type : "post",
										data : "cp_Id="+cp_Id,
										error : function() {
											alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
										},
										success : function(resultData) {
											console.log("resultData : " + resultData);
											if (resultData == "1") {
												$("#cp_Id")
														.parents("#myForm")
														.find(".idError")
														.html(
																"현재 사용 중인 아이디입니다.");
											} else if (resultData == "2") {
												$("#cp_Id").parents("#myForm")
														.find(".idError")
														.html("사용 가능한 아이디입니다.");
												idConfirm = 2;
											}
										}
									});
						}
					});

	// 사업자번호 중복체크
	$("#bNumConfirmBtn").click(function() {
				if (!formCheck($('#cp_Bnum'), $('.bnumError'), "사업자번호를")) {
					return;
				} else if (!bNumVerify('.bnumError')) {
					return;
				} else {
					var cp_Bnum = $("#cp_Bnum").val();
					$
							.ajax({
								url : "/comp/cp_BnumConfirm.do",
								type : "post",
								data : "cp_Bnum="+cp_Bnum,
								error : function() {
									alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
								},
								success : function(resultData) {
									console.log("resultData : "+ resultData);
									if (resultData == "1") {
										$("#cp_Bnum")
												.parents("#myForm")
												.find(".bnumError")
												.html(
														"이미 등록된 사업자번호입니다.");
									} else if (resultData == "2") {
										$("#cp_Bnum").parents("#myForm")
												.find(".bnumError")
												.html("사용 가능한 사업자번호입니다.");
										bNumConfirm = 2;
									}
								}
							});
				}
			});
	
	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#join").click(function() {
		// 입력값 체크
		if (!formCheck($('#cp_Id'), $('.idError'), "아이디를"))
			return;
		else if (!idVerify('.idError'))
			return;
		else if (!formCheck($('#cp_Pw'), $('.pwError'), "비밀번호를"))
			return;
		else if (!pwVerify('.pwError'))
			return;
		else if (!idPwdCheck())
			return;
		else if (!formCheck($('#cp_Pw2'), $('.pw2Error'), "비밀번호 확인을"))
			return;
		else if (!pwVerify('.pw2Error'))
			return;
		else if (!passwordCheck())
			return;
		else if (!formCheck($('#cp_Name'), $('.nameError'), "업체명을"))
			return;
		else if (!formCheck($('#cp_Ceo'), $('.ceoError'), "대표자명을"))
			return;
		else if (!formCheck($('#cp_Add'), $('.addError'), "소재지를"))
			return;
		else if (!formCheck($('#cp_Bnum'), $('.bnumError'), "사업자번호를"))
			return;
		else if (!bNumVerify($(".bnumError")))
			return;
		else if (!formCheck($('#cp_Account'), $('.accountError'), "입금계좌를"))
			return;
		else if (!formCheck($('#cp_Phone'), $('.phoneError'), "연락처를"))
			return;
		else if (!telVerify('.phoneError'))
			return;
		else if (!formCheck($('#cp_Email'), $('.emailError'), "이메일 주소를"))
			return;
		else if (!emailVerify('.emailError'))
			return;
		else if (idConfirm != 2) {
			alert("아이디 중복체크를 진행해 주세요.");
			return;
		} else if (bNumConfirm != 2) {
			alert("사업자번호 중복체크를 진행해 주세요.");
			return;
		} else {
					$("#myForm").attr({
						"method" : "POST",
						"action" : "/comp/compJoin.do"
					});
					$("#myForm").submit();
		}
	});
	// 취소 버튼 클릭 시
	$("#cp_Cancel").click(function(){
		history.back();
	});
	
});
