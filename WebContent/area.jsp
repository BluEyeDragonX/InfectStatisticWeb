<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>折线图</title>
	<script src="js/echarts.min.js"></script>
</head>
<body>
<div id="box" style="width:366px; height:460px;"></div>
<script>
    var myChart=echarts.init(document.getElementById("box"));
    var option={
        xAxis:{
            data:["1月21","1月22","1月23","1月24","1月25","1月26",
            	"1月27","1月28","1月29","1月30","1月31"]
        },
        yAxis:{},
        series:[{
            name:'确诊人数',
            type:'line',
            data:[1,4,5,8,9,15,44,88,94,105,222]
        }]
    };
    myChart.setOption(option);
</script>

<div style="width:366px; height:30px;
	-webkit-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
	-moz-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
	box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
	border-radius:5px;
	background:#aaaaff;">
<a href="index.jsp" style="text-decoration: none;color: #000000;">
<p style="text-align: center; padding:5px 0;">返回上一级</p>
</a>
<div>

</body>
</html>