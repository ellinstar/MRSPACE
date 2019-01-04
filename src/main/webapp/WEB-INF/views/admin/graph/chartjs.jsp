<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
</head>
<c:set value="${cpNum}" var="cpNum"/>
<script type="text/javascript">
	$(document).ready(function() {
		
		var form = $("#form");
		
		//버튼을 누르면 차트가 그려진다
		//$("#btn").click(function() {
			//chartLabels = [];// list.toArray(new String[list.statsDate]);
			//chartData = [];//list.toArray(new String[list.statsAmount]);
			
			//getJson으로 데이터 받음
			$.getJSON("./graph",function(data) {
				var chartLabels = [];
				var chartData=[];
				var cpName=[];
				$.each(data, function(inx, obj) {
					chartLabels.push(obj.statsDate);
					chartData.push(obj.statsAmount);
					cpName.push(obj.statsLabel);
				});
				console.log(chartLabels)
				createChart();
			});
			
	//	});
		
		function createChart() {
			var ctx = document.getElementById("canvas").getContext("2d");
			
			var myChart = new Chart(ctx,{
				type : 'line',
				data : lineChartData,
				options:{
					responsive: false,
					scales:{
						yAxes:[{
							ticks:{
								beginAtZero:true
							}
						}]
					}
				}
			});
		}
		
		var button = document.gtElementById("sendAjax")
		button.addE
	});
</script>
<body>

 	<!-- =====================콤보박스================================= -->
	<%-- <form id='form' action="/admin/cpgraph" method="get" class="form-label-group form-row " >
		<select name="cpNum" id="cpNum" class="select" data-live-search="true">
			<option value="0">전체</option>
			<c:forEach var="cp" items="${cp}">
			<option class="font-weight-bold" value="<c:out value='${cp.cp_Num}'/>"><c:out value='${cp.cp_Name}'/></option>
			</c:forEach>
		</select>
		<button id="btn" class="btn">보기</button>
		</form> --%>
	<!-- =====================콤보박스================================= -->
 
 
            <div id="graph" style="width: 80%; margin: 30px;">
                <div>
                    <canvas id="canvas" height="350" width="600"></canvas>
                </div>
            </div>
 
 
<!-- <script type="text/javascript">
var ctx = document.getElementById("canvas");

var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
var canvas = new Chart(ctx, {
	type: "line",
	data: {
		labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		datasets:[{
			label : 'red',
			data: [12, 19, 3],
			backgroundColor:'rgba(255, 99, 132, 0.2)',
			borderColor:'rgba(255, 99, 132, 1)',
			borderWidth:1,
			fill:false
		
		},{
			label : 'blue',
			data: [3, 19, 20],
			backgroundColor:[
				'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)'
			],
			borderColor:[
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)'
			],
			borderWidth:1,
			fill:false
		}]
	},
	options:{
		scales:{
			yAxes:[{
				ticks:{
					beginAtZero:true
				}
			}]
		}
	}
});

</script> -->
</body>
</html>