<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
</head>
<c:set value="${cp_Num}" var="cpNum"/>
<script type="text/javascript">
	$(document).ready(function() {
		var chartLabels = [];
		var chartData=[];
		var month="";
		var cpNum = '<c:out value="${cpNum}"/>';
		function createChart() {
			var ctx = document.getElementById("canvas").getContext("2d");
			LineChartDemo = Chart.Line(ctx,{
				data : lineChartData,
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
		}
		
		$("#btn").click(function() {
			chartLabels = [];
			chartData = [];
			
			//getJson으로 데이터 받음
			$.getJSON("./cpgraph",{
				cpNum : cpNum,
				month : month
			}, function(data) {
				$.each(data, function(key, value) {
					chartLabels.push(value.statsDate);
					chartData.push(value.statsAmont);
				});
				lineChartData = {
						labels : chartLabels,
						datasets:[{
							label : "월별 예약 수",
							backgroundColor:'rgba(255, 99, 132, 0.2)',
							borderColor:'rgba(255, 99, 132, 1)',
							borderWidth:4,
							fill:false,
							data : chartData
						}]
				}
				createChart();
			});
		})
		
	})
</script>
<body>

 	<!-- =====================콤보박스================================= -->
	<form id='form' action="/admin/cpgraph" method="get" class="form-label-group form-row " >
		<select name="cp_Num" id="cp_Num" class="select" data-live-search="true">
			<option selected disabled>업체명선택</option>
			<option value="0">전체</option>
			<c:forEach var="cp" items="${cp}">
			<option class="font-weight-bold" value="<c:out value='${cp.cp_Num}'/>"><c:out value='${cp.cp_Name}'/></option>
			</c:forEach>
		</select>
		<button id="btn" class="btn">보기</button>
		</form>
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