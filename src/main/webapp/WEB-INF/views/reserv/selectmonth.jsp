<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="/resources/include/dist/js/bootstrap.min.js"/>
<script type="text/javascript">
$(document).ready(function()
		{   
		    $(".monthPicker").datepicker({
		        dateFormat: 'MM yy',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,

		        onClose: function(dateText, inst) {
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
		        }
		    });

		    $(".monthPicker").focus(function () {
		        $(".ui-datepicker-calendar").hide();
		        $("#ui-datepicker-div").position({
		            my: "center top",
		            at: "center bottom",
		            of: $(this)
		        });
		    });
		    
		  //재고 갯수 확인
		});
		function checkAvail() {
			$.ajax({
				url : "/reserv/getStock.do",  //전송 url
				type : "POST",                // 전송 시 method 방식
				data : $("#reservForm").serialize(),
				dataType : "text",
				error : function(){             //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},  
				success : function(resultData){
					$("#avail").val(resultData);
				}
				});
			};
		</script>
</head>
<body>
<form id="reservForm" name="reservForm">
<input type="hidden" id="sp_Num" name="sp_Num"value="${detail.sp_Num}">
<label for="month">Month: </label>
<input type="month"	id="month" name="month" class="monthPicker" onchange="checkAvail()" />
</form>
<label id="avail">${avail}</label>
</body>
</html>