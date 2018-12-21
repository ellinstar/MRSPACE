/* 함수명: chkSubmit(유효성 체크 대상, 메시지 내용) 
 * 출력영역: alert으로.
 * 예시 : if(!chkSubmit($('#keyword'),"검색어를")) return;
 * */
function chkSubmit(item, msg) {
	if (item.val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/*
 * 함수명: checkForm(유효성 체크 대상, 메시지 내용) 출력영역: placeholder 속성을 이용. 예시 :
 * if(!chkSubmit($('#keyword'),"검색어를")) return;
 */
function checkForm(item, msg) {
	var message = "";
	if (item.val().replace(/\s/g, "") == "") {
		message = msg + " 입력해 주세요.";
		item.attr("placeholder", message);
		return false;
	} else {
		return true;
	}
}

/*
 * 함수명: formCheck(유효성 체크 대상, 출력 영역, 메시지 내용) 출력영역: 매개변수 두번째 출력영역에. 예시 :
 * if(!formCheck($('#keyword'),$('#msg'),"검색어를")) return;
 */
function formCheck(main, item, msg) {
	if (main.val().replace(/\s/g, "") == "") {
		item.css("color", "#000099").html(msg + " 입력해 주세요");
		main.val("");
		return false;
	} else {
		return true;
	}
}

var idPattern = "[A-z|0-9].{5,11}";
var pwPattern = "((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})";
var telPattern = "(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})";
var bNumPattern = "^\\d{3}-\\d{2}-\\d{5}";
var emailPattern = "^[A-z|0-9]([A-z|0-9]*)(@)([A-z]*)(\.)([A-z]*)$";
					// ^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$

function idVerify(printarea) {
	var data_regExp = new RegExp(idPattern);
	var match = data_regExp.exec($("#cp_Id").val());
	if (match == null) {
		$(printarea).html("입력한 값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$("#cp_Id").val("");
		return false;
	} else {
		return true;
	}
}
function pwVerify(printarea) {
	var data_regExp = new RegExp(pwPattern);
	var match = data_regExp.exec($("#cp_Pw").val());
	if (match == null) {
		$(printarea).html("입력한 값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$("#cp_Pw").val("");
		return false;
	} else {
		return true;
	}
}
function telVerify(printarea) {
	var data_regExp = new RegExp(telPattern);
	var match = data_regExp.exec($("#cp_Phone").val());
	if (match == null) {
		$(printarea).html("입력한 값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$("#cp_Phone").val("");
		return false;
	} else {
		return true;
	}
}
function bNumVerify(printarea) {
	var data_regExp = new RegExp(bNumPattern);
	var match = data_regExp.exec($("#cp_Bnum").val());
	if (match == null) {
		$(printarea).html("입력한 값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$("#cp_Bnum").val("");
		return false;
	} else {
		return true;
	}
}
function emailVerify(printarea) {
	var data_regExp = new RegExp(emailPattern);
	var match = data_regExp.exec($("#cp_Email").val());
	if (match == null) {
		$(printarea).html("입력한 값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$("#cp_Email").val("");
		return false;
	} else {
		return true;
	}
}