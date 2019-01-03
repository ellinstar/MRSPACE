<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.highcharts.com/highcharts.src.js"></script>
<script type="text/javascript">
$(function () {
    var data = [10.5, 9, 11];
    $('#container').highcharts({
        title: {
            text: '월별온도',
            x: -20 //center
        },
        subtitle: {
            text: 'Modified by 스미',
            x: -20
        },
        xAxis: {
            categories: ['1월','2월','3월'] 
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name : '서울',
            data : data
        }]
    });
});


</script>
</head>
<body>
<div id="chartArea"></div>
</body>
</html>