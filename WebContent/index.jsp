<%@page import="province.pojo.Province"%>
<%@page import="java.util.List"%>
<%@page import="province.dao.ProvinceDAOImpl"%>
<%@page import="province.dao.ProvinceDAO"%>
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
<div>
	<%	
		Province[] prov = new Province[34];
		int cc = 0,ccf = 0,sc = 0,curec = 0,dc = 0;
		int i = 0;
		ProvinceDAO provinceDAO = new ProvinceDAOImpl();
		List<Province> provinces = provinceDAO.list();
		for(Province province:provinces){
       		prov[i] = province;
       		cc += prov[i].getConfirmed();
       		ccf += prov[i].getCurrentConfirmed();
       		sc += prov[i].getSuspected();
       		curec += prov[i].getCured();
       		dc += prov[i].getDead();
       		i++;
       	}

	%>
</div>
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

<table>
	<tr>
		<td>
			<a href="index.jsp">
				<img src="./pic/nowbottom.png" border="0" width="190" height="51" ; style="position:absolute; left:0px; top:0px; ">
			</a>
		</td>
		<td>
			<a href="index.jsp?flag=cumulative">
				<img src="./pic/cumulativebottom.png" border="0" width="190" height="51" ; style="position:absolute; left:180px; top:0px; "></td>
			</a>
		</tr>
</table>

<div id="container" style="height: 305px;width:366px;">



<script type="text/javascript">
    // 全国省份列表
    
    <%	
    	String flag =request.getParameter("flag");
    	if(flag!=null && flag.equals("cumulative")) {
    %>
    var dataMap = [
		{ name: '湖北' ,value:<%=prov[0].getCurrentConfirmed()%> },
		{ name: '北京' ,value:<%=prov[1].getCurrentConfirmed()%>},
		{ name: '香港' ,value:<%=prov[2].getCurrentConfirmed()%>},
	 	{ name: '广东' ,value:<%=prov[3].getCurrentConfirmed()%>},
		{ name: '甘肃' ,value:<%=prov[4].getCurrentConfirmed()%>},
		{ name: '四川' ,value:<%=prov[5].getCurrentConfirmed()%>},
		{ name: '台湾' ,value:<%=prov[6].getCurrentConfirmed()%>},
		{ name: '黑龙江' ,value:<%=prov[7].getCurrentConfirmed()%>},
		{ name: '上海' ,value:<%=prov[8].getCurrentConfirmed()%>},
		{ name: '浙江' ,value:<%=prov[9].getCurrentConfirmed()%>},
		{ name: '山东' ,value:<%=prov[10].getCurrentConfirmed()%>},
		{ name: '辽宁' ,value:<%=prov[11].getCurrentConfirmed()%>},
		{ name: '陕西' ,value:<%=prov[12].getCurrentConfirmed()%>},
		{ name: '湖南' ,value:<%=prov[13].getCurrentConfirmed()%>},
		{ name: '广西' ,value:<%=prov[14].getCurrentConfirmed()%>},
		{ name: '重庆' ,value:<%=prov[15].getCurrentConfirmed()%>},
		{ name: '贵州' ,value:<%=prov[16].getCurrentConfirmed()%>},
		{ name: '宁夏' ,value:<%=prov[17].getCurrentConfirmed()%>},
		{ name: '内蒙古' ,value:<%=prov[18].getCurrentConfirmed()%>},
		{ name: '河南' ,value:<%=prov[19].getCurrentConfirmed()%>},
		{ name: '河北' ,value:<%=prov[20].getCurrentConfirmed()%>},
		{ name: '云南' ,value:<%=prov[21].getCurrentConfirmed()%>},
		{ name: '海南' ,value:<%=prov[22].getCurrentConfirmed()%>},
		{ name: '江苏' ,value:<%=prov[23].getCurrentConfirmed()%>},
		{ name: '天津' ,value:<%=prov[24].getCurrentConfirmed()%>},
		{ name: '吉林' ,value:<%=prov[25].getCurrentConfirmed()%>},
		{ name: '安徽' ,value:<%=prov[26].getCurrentConfirmed()%>},
		{ name: '江西' ,value:<%=prov[27].getCurrentConfirmed()%>},
		{ name: '福建' ,value:<%=prov[28].getCurrentConfirmed()%>},
		{ name: '山西' ,value:<%=prov[29].getCurrentConfirmed()%>},
		{ name: '新疆' ,value:<%=prov[30].getCurrentConfirmed()%>},
		{ name: '青海' ,value:<%=prov[31].getCurrentConfirmed()%>},
		{ name: '澳门' ,value:<%=prov[32].getCurrentConfirmed()%>},
		{ name: '西藏' ,value:<%=prov[33].getCurrentConfirmed()%>},]
    <%
    	} else {
    %>
    var dataMap = [
		{ name: '湖北' ,value:<%=prov[0].getConfirmed()%> },
		{ name: '北京' ,value:<%=prov[1].getConfirmed()%>},
		{ name: '香港' ,value:<%=prov[2].getConfirmed()%>},
		{ name: '广东' ,value:<%=prov[3].getConfirmed()%>},
		{ name: '甘肃' ,value:<%=prov[4].getConfirmed()%>},
		{ name: '四川' ,value:<%=prov[5].getConfirmed()%>},
	 	{ name: '台湾' ,value:<%=prov[6].getConfirmed()%>},
	 	{ name: '黑龙江' ,value:<%=prov[7].getConfirmed()%>},
		{ name: '上海' ,value:<%=prov[8].getConfirmed()%>},
	   	{ name: '浙江' ,value:<%=prov[9].getConfirmed()%>},
	  	{ name: '山东' ,value:<%=prov[10].getConfirmed()%>},
	  	{ name: '辽宁' ,value:<%=prov[11].getConfirmed()%>},
	  	{ name: '陕西' ,value:<%=prov[12].getConfirmed()%>},
	  	{ name: '湖南' ,value:<%=prov[13].getConfirmed()%>},
	  	{ name: '广西' ,value:<%=prov[14].getConfirmed()%>},
	   	{ name: '重庆' ,value:<%=prov[15].getConfirmed()%>},
	 	{ name: '贵州' ,value:<%=prov[16].getConfirmed()%>},
	 	{ name: '宁夏' ,value:<%=prov[17].getConfirmed()%>},
		{ name: '内蒙古' ,value:<%=prov[18].getConfirmed()%>},
	 	{ name: '河南' ,value:<%=prov[19].getConfirmed()%>},
	 	{ name: '河北' ,value:<%=prov[20].getConfirmed()%>},
		{ name: '云南' ,value:<%=prov[21].getConfirmed()%>},
	 	{ name: '海南' ,value:<%=prov[22].getConfirmed()%>},
	   	{ name: '江苏' ,value:<%=prov[23].getConfirmed()%>},
	  	{ name: '天津' ,value:<%=prov[24].getConfirmed()%>},
	  	{ name: '吉林' ,value:<%=prov[25].getConfirmed()%>},
	 	{ name: '安徽' ,value:<%=prov[26].getConfirmed()%>},
		{ name: '江西' ,value:<%=prov[27].getConfirmed()%>},
		{ name: '福建' ,value:<%=prov[28].getConfirmed()%>},
	  	{ name: '山西' ,value:<%=prov[29].getConfirmed()%>},
		{ name: '新疆' ,value:<%=prov[30].getConfirmed()%>},
	  	{ name: '青海' ,value:<%=prov[31].getConfirmed()%>},
	  	{ name: '澳门' ,value:<%=prov[32].getConfirmed()%>},
	  	{ name: '西藏' ,value:<%=prov[33].getConfirmed()%>},]
   			
    <%
    	}
    %>

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
			<td style="color:#ff5555;">52425</td>
			<td style="color:#888811;">245</td>
			<td style="color:#aaaa33;">0</td>
		</tr>
		<tr class="td3">
			<td>+3757</td>
			<td>+103</td>
			<td>0</td>
		</tr>
	</table>
	<table>
		<tr class="td1">
			<td>累计确诊</td>
			<td>累计治愈</td>
			<td>累计死亡</td>
		</tr>
		<tr class="td2">
			<td style="color:#2288ff;">61243</td>
			<td style="color:#22bb88;">6629</td>
			<td style="color:#990000;">2189</td>
		</tr>
		<tr class="td3">
			<td>昨日+4237</td>
			<td>昨日+207</td>
			<td>昨日+273</td>
		</tr>
	</table>
</div>


<table>
	<tr>
		<td>
			<img src=./pic/medicalBottom.png border=0 width="152" height="50" ; style="position:absolute; left:19px; top:530px; ">
		</td>
		<td>
			<img src=./pic/goOutBottom.png border=0 width="152" height="50" ; style="position:absolute; left:209px; top:530px; ">
		</td>
	</tr>
</table>
<div>

<a href="medical.jsp" style="text-decoration: none;color: #000000;">
	<img src="./pic/medicalbottom.png" border="0" width="152" height="50" ; style="position:absolute; left:19px; top:530px; "/>
</a>

<a href="goout.jsp" style="text-decoration: none;color: #000000;">
	<img src="./pic/gooutbottom.png" border=0 width="152" height="50" ; style="position:absolute; left:209px; top:530px; "/>
</a>


</div>
</body>
</html>