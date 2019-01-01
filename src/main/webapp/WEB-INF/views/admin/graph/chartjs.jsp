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

<body>
 
 
 
            <div id="graph" style="width: 80%; margin: 30px;">
                <div>
                    <canvas id="canvas" height="350" width="600"></canvas>
                </div>
            </div>
 
 
<script type="text/javascript">
var ctx = document.getElementById("canvas");
/* var ctx = document.getElementById("canvas").getContext("2d");
var ctx = $("#canvas");
var ctx = "canvas"; */
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

</script>
</body>
</html>