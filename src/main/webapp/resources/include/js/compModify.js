$(document)
		.ready(
				function() {
					bankCheck();
					errCodeCheck();

					var message = [ "영문/숫자/특수문자. 8 ~ 20자로 입력해 주세요.",
							"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.", "", "", "" ];

					$(".pwError").html(message[0]);
					$(".pw2Error").html(message[1]);
					$(".accountError").html(message[2]);
					$(".phoneError").html(message[3]);
					$(".emailError").html(message[4]);

					$("#cp_Pw").bind("focus", function() {
						$(".pwError").html(message[0]);
					});
					$("#cp_PwCheck").bind("focus", function() {
						$(".pwCheckError").html(message[1]);
					});
					$("#cp_Account").bind("focus", function() {
						$(".accountError").html(message[2]);
					});
					$("#cp_Phone").bind("focus", function() {
						$(".phoneError").html(message[3]);
					});
					$("#cp_Email").bind("focus", function() {
						$(".emailError").html(message[4]);
					});

					$('#cp_Pw, #cp_Pw2, #cp_Account, #cp_Phone, #cp_Email')
							.bind(
									"focus",
									function() {
										var index = $(
												"#cp_Pw, #cp_Pw2, #cp_Account, #cp_Phone, #cp_Email")
												.index(this);

										/*$(this).parents("#comp_Form").find(
												".error".html(message[index]));*/

									});

					/* 확인 버튼 클릭 시 처리 이벤트 */
					$("#comp_Submit").click(
							function() {
								
								/*if (!formCheck($('#cp_Pw'), $('.pwError'),
										"비밀번호를"))
									return;
								else if (!pwVerify(".pwError"))
									return;
								else if (!formCheck($('cp_PwCheck'),
										$('.pwCheckError'), "비밀번호 확인을"))
									return;
								else if (!pwVerify(".pw2Error"))
									return;*/
								if (!passwordCheck())
									return;
								else if (!formCheck($('#cp_Account'),
										$('.accountError'), "입금계좌를"))
									return;
								else if (!formCheck($('#cp_Phone'),
										$('.phoneError'), "연락처를"))
									return;
								else if (!formCheck($("#cp_Email"),
										$('.emailError'), "이메일 주소를"))
									return;
								else if (!emailVerify('.emailError'))
									return;
								else
									$("#cp_Bank").val($("#cp_Bank1").val());
									$("#comp_Form").attr({
										"method" : "POST",
										"action" : "/comp/compModify.do"
									});
								$("#comp_Form").submit();
							});
					$("#comp_Cancel").click(function() {
						history.back();
					});

				});

function passwordCheck() {
	if ($("#cp_Pw").val() != $("#cp_PwCheck").val()) {
		alert("비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.");
		$("#cp_Pw").val("");
		$("#cp_PwCheck").val("");
		$("#cp_Pw").focus();
		return false;
	}
	return true;
}
