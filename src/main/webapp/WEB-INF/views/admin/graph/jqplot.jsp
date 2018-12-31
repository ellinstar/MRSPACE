<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.js"></script>
<!-- JQ-PLOT의 CSS를 설정 -->  
<link class="include" rel="stylesheet" type="text/css" href="/resources/graph/jquery.jqplot.css"/>  
<!-- JQ-PLOT의 기본 설정 -->  
<script type="text/javascript" src="/resources/graph/jquery.jqplot.js"></script>


<script type="text/javascript">
$(function() {
    //X,Y 쌍으로 배열의 형태로 차례대로 값을 넣습니다.
    
    //id가 graphDiv인 곳에 그래프로 나타낼 Line을 넣어 표현한다.
	$.jqplot('graphDiv', [[1,2,3,4,5,300,30]]);
			/*{   
		title:'<<통계>>'
        axes:{//축 옵션
          xaxis:{//x축 옵션
        	  label : '날짜',
               // 날짜 형태로 입력을 하기위해서는 Date형식의 Renderer을 사용합니다.
               renderer:$.jqplot.DateAxisRenderer,
               tickOptions:{ // 축에관한 옵션                    
                   // 입력된 값이 날짜형태로 인식되기 위해서 format 형식을 정해주고 입력값도
                   // yyyy/mm/dd 형식으로 입력해야만 정상적으로 나타납니다.
                     formatString:'%y/%m/%d'
               } 
           },
           yaxis:{ //y축 옵션
        	   label: '선호도',
        	   min : 0, //최소값
        	   max : 100, //최대값
        	   numberTicks : 11, //인위적으로 축을 나누는 개수
        	   tickOptions:{
        		   fontString : '%1f'//소수점 1째 자리까지 표기
        	   }
           
           }
        },
        
  }); */
 });
</script>
</head>
<body>
<body>  
     //그래프를 출력할 Div를 생성
     <div id="graphDiv"></div>    
</body> 
</body>
</html>
