<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart','bar']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        var row = ${fn:length(list)};
    	data.addColumn("string", '업체명');
        data.addColumn('number', '누적예약수');
       
        data.addRows(row);
        <c:forEach var="list" items="${list}" varStatus="status">
        	var comp="${list.comp}"
        	var reserv = "${list.resCnt}";
        	var index = ${status.index};
        	Number(reserv);
        	data.setCell(index, 0, comp);
        	data.setCell(index, 1, reserv);
        </c:forEach>
        	

        // Set chart options
        var options = {
        			title:'업체별 예약수',
        			color: '#76a7fa',
        			opacity: 0.2,
        			height: 800,
                    chartArea:{width:'80%',height:'80%'},
                    lineWidth:3,
                    interpolateNulls: 'true'
                };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  <body>
  
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  </body>
</html>