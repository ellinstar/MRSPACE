
$(function() {
	// 찜목록 버튼
	$("#like").click(function() {
		var retVal = confirm("확인을 누르시면 찜 목록에 저장됩니다.")
		if (retVal == true) {
			$("#like_Form").attr({
				"method" : "post",
				"action" : "/reserv/likeInsert.do"
			});
			$("#like_Form").submit();
		}
	});
});