var data = {
		labels:[
			"Jan","Fab","Mar","Apr","May","Jun"
		],
		datasets:[
			{
				label:'예약건',
				data:[
					0,0,0,0,0,0
				],
				backgroundColor:[
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',                                                               
	                'rgba(255, 159, 64, 0.2)'
	                ],
				borderColor:[
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	                ],
				borderWidth:4
			}
		]
};
var option={
		responsive: false,
		scales:{
			yAxes:[{
				ticks:{
					beginAtZero:true
				}
			}]
		}
};

var ctx = document.getElementById("canvas").getContext("2d");
var myChart = new Chart(ctx,{
	type : 'line',
	data : data,
	options: options
});

var button =  document.getElementById("sendAjax")
 
button.addEventListener("click", function() {
    sendAjax('http://localhost:3000/');
})
 
function sendAjax(url) {
    var oReq = new XMLHttpRequest();
 
    oReq.open('POST', url);
    oReq.setRequestHeader('Content-Type', "application/json") // json 형태로 보낸다                         
    oReq.send();
 
    oReq.addEventListener('load', function() {
        var result = JSON.parse(oReq.responseText);
        var score = result.score;
        var comp_data = data.datasets[0].data;
 
        for (var i = 0; i < comp_data.length; i++) {
            comp_data[i] = score[i];
        }
 
        data.datasets[0].data = comp_data;
        myChart.update();
    })
}
app.post('/', function(req, res) {
	var responseData = {};
	 
	  var query =  connection.query('select to_char(res_usedate, "yyyy-mm") as res_usedate, count(res_num) as amount, cp_name from( select r.*, c.cp_name from tb_reserv r, tb_space s, tb_company c where r.sp_num=s.sp_num and s.cp_num = c.cp_num) group by cp_name, to_char(res_usedate, "yyyy-mm")', function(err,rows){ 
	    responseData.score = [];
	    if(err) throw err;
	    if(rows[0]){
	      responseData.result = "ok";
	      rows.forEach(function(val){
	        responseData.score.push(val.score);
	      })
	    }
	    else{
	      responseData.result = "none";
	      responseData.score = "";
	    }
	    res.json(responseData);
	  });
});
