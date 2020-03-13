<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>


<head>
<meta charset="utf-8">
<title>某疫情调查</title>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/china.js"></script>

<style type="text/css">
	td { text-align:center; }
	table { width:366px; }
	#container2{
    	border-radius:5px;
    	-webkit-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
		-moz-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
		box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
    }
    .td1{
    	font-size:18px;
    	font-weight:700;
    }
    .td2 {
   		font-size:16px;
    	font-weight:600;
    }
    .td3 {
    	font-size:8px;
    	font-weight:500;
    }
    
}
</style>
</head>

<body>

<table><tr>
<td><img src="./pic/nowBottom.png" border="0" width="190" height="51" ; style="position:absolute; left:0px; top:0px; "></td>
<td><img src="./pic/cumulativeBottom.png" border="0" width="190" height="51" ; style="position:absolute; left:180px; top:0px; "></td>
</tr></table>

<div id="container" style="height: 305px;width:366px;">

<script type="text/javascript">
    // 全国省份列表
    var dataMap = [{ name: '北京' ,value:15 }, { name: '天津' ,value:18 }, { name: '上海' ,value:15 }, 
    	{ name: '重庆' ,value:55 }, { name: '河北' ,value:88 }, { name: '河南' ,value:152 }, { name: '云南' ,value:154 }, 
    	{ name: '辽宁' ,value:1 }, { name: '黑龙江' ,value:57 }, { name: '湖南' ,value:188 }, { name: '安徽' ,value:45 }, 
    	{ name: '山东' ,value:78 }, { name: '新疆' ,value:44 }, { name: '江苏' ,value:12 }, { name: '浙江' ,value:63 }, 
    	{ name: '江西' ,value:144}, { name: '湖北' ,value:111}, { name: '广西' ,value:32 }, { name: '甘肃' ,value:21 }, 
    	{ name: '山西' ,value:0 }, { name: '内蒙古' ,value:2122 }, { name: '陕西' ,value:77 }, { name: '吉林' ,value:24 }, 
    	{ name: '福建' ,value:551 }, { name: '贵州' ,value:132337 }, { name: '广东' ,value:66 }, { name: '青海' ,value:55 }, 
    	{ name: '西藏' ,value:4 }, { name: '四川' ,value:33 }, { name: '宁夏' ,value:22 }, { name: '海南' ,value:11 }, 
    	{ name: '台湾' ,value:10 }, { name: '香港' ,value:17 }, { name: '澳门' ,value:18 }]
    
    var option = {
        tooltip: {
            formatter: function (params) {
                var info = '<p style="font-size:10px">' + params.name 
                + '</p><p style="font-size:10px">确诊：' + params.value + ' </p>' 
                return info;
            },
            fontSize:"12px",
            backgroundColor: "rgba(55,55,55,0.8)",//提示标签背景颜色
            textStyle: { color: "#fff" }, //提示标签字体颜色
            /* triggerOn: 'click', */
            enterable:true 
        },
        
        series: [
            {
                name: '中国',
                type: 'map',
                mapType: 'china',
                
                label: {
                    normal: {
                        show: true,//显示省份标签
                        textStyle:{ fontSize:8 }
                    },
                    emphasis: {
                    	enterable:true,
                        // textStyle:{color:"#800080"}
                    }
                },
                itemStyle: {
                    normal: {
                        borderWidth: .15,//区域边框宽度
                        // borderColor: '#009fe8',//区域边框颜色
                        // areaColor:"#ffefd5",//区域颜色
                        color:function(params){
                        	if(params.value == 0){
                        		return "#FFFFFF"; 
                        	}else if(params.value >0 && params.value <10){                            
                				return "#FAEBD2";                        
                			}else if(params.value >=10 && params.value<100 ){
                				return "#E9A188";                        
                			}else if(params.value >=100 && params.value<500 ){
                				return "#D56355";
                			}else if(params.value >=500 && params.value<1000 ){
                				return "#BB3937";
                			}else if(params.value >=1000 && params.value<10000 ){
                				return "#772627";
                			}else{
                				return "#480f10"; 
                			}                   
                		}
                    },
                    emphasis: {
                        borderWidth: .5,
                        borderColor: "#FF0000",
                        areaColor: "#ffdead",
                    }
                },

                
                
                data: dataMap
            }
        ]

    };
    var myChart = echarts.init(document.getElementById('container'));
    myChart.setOption(option);

  	myChart.on('click', function (params) {
  		window.location.href = 'area.jsp?province='+params.name;
  	});
    
 
</script>
</div>
<div style="height: 20px; width:366px;">
	<p><b>实时数据:</b></p>
</div>
<div style="height:10px; width:366px;"/>
<div id="container2" style="height:140px; width:366px;padding:10px 0px 15px 0px;">
	<table>
		<tr class="td1">
			<td><b>现有确诊</b></td>
			<td><b>现有疑似</b></td>
			<td><b>现有重症</b></td>
		</tr>
		<tr class="td2">
			<td style="color:#ff5555;">54927</td>
			<td style="color:#888811;">5206</td>
			<td style="color:#aaaa33;">11633</td>
		</tr>
		<tr class="td3">
			<td>昨日-1335</td>
			<td>昨日+1614</td>
			<td>昨日-231</td>
		</tr>
	</table>
	<table>
		<tr class="td1">
			<td>累计确诊</td>
			<td>累计治愈</td>
			<td>累计死亡</td>
		</tr>
		<tr class="td2">
			<td style="color:#2288ff;">75567</td>
			<td style="color:#22bb88;">18401</td>
			<td style="color:#990000;">2239</td>
		</tr>
		<tr class="td3">
			<td>昨日+892</td>
			<td>昨日+2109</td>
			<td>昨日+118</td>
		</tr>
	</table>
</div>

<a href="medical.jsp" style="text-decoration: none;color: #000000;">
<img src="./pic/medicalBottom.png" border="0" width="152" height="50" ; style="position:absolute; left:19px; top:530px; "></img>
</a>

<a href="goout.jsp" style="text-decoration: none;color: #000000;">
<img src="./pic/goOutBottom.png" border=0 width="152" height="50" ; style="position:absolute; left:209px; top:530px; "></img>
</a>

</body>
</html>