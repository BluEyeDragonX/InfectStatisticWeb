<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="province.pojo.Province"%>
<%@page import="java.text.DateFormat,java.text.ParseException
,java.text.SimpleDateFormat,java.util.Date,java.text.ParseException,java.util.Calendar"%>
<%@page import="province.dao.ProvinceDAOImpl"%>
<%@page import="province.dao.ProvinceDAO"%>

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
<% 
	Province[] prov = new Province[30];
	String[] d = new String[30];
	Date today = new Date();//获取今天的日期
	Calendar c = Calendar.getInstance();
	c.setTime(today);
	c.add(Calendar.DAY_OF_MONTH, -31);//一个月前
	Date day = c.getTime();
	SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd");//日期格式
	String date = sformat.format(day);
	String pr =request.getParameter("province");
	ProvinceDAO provinceDAO = new ProvinceDAOImpl();
	
	int i = 0;
	if(pr!=null) {
		while(i<30){
			Province provinces = provinceDAO.findProvince(date, pr);
			c.add(Calendar.DAY_OF_MONTH, 1);//加一天
			day = c.getTime();
			date = sformat.format(day);
			prov[i] = provinces;
			d[i] = date;
			i++;	
		}

	}
	
%>
var myChart=echarts.init(document.getElementById("box"));
var option={
	legend: {
           data:['确诊人数','治愈人数','死亡人数']
    },
		 
    xAxis:{
        data:["<%=d[0]%>","<%=d[1]%>","<%=d[2]%>","<%=d[3]%>","<%=d[4]%>",
        	"<%=d[5]%>","<%=d[6]%>","<%=d[7]%>","<%=d[8]%>","<%=d[9]%>",
        	"<%=d[10]%>","<%=d[11]%>","<%=d[12]%>","<%=d[13]%>","<%=d[14]%>",
        	"<%=d[15]%>","<%=d[16]%>","<%=d[17]%>","<%=d[18]%>","<%=d[19]%>",
        	"<%=d[20]%>","<%=d[21]%>","<%=d[22]%>","<%=d[23]%>","<%=d[24]%>",
        	"<%=d[25]%>","<%=d[26]%>","<%=d[27]%>","<%=d[28]%>","<%=d[29]%>",],
        axisLabel: {
        	interval : 0,
        	show : false,
		}
    },
    
    yAxis:{},
    
    series:[{
        name:'确诊人数',
        type:'line',
        areaStyle: {normal: {}},
        data:[<%=prov[0].getCurrentConfirmed()%>,<%=prov[1].getCurrentConfirmed()%>,<%=prov[2].getCurrentConfirmed()%>,
        	<%=prov[3].getCurrentConfirmed()%>,<%=prov[4].getCurrentConfirmed()%>,<%=prov[5].getCurrentConfirmed()%>,
        	<%=prov[6].getCurrentConfirmed()%>,<%=prov[7].getCurrentConfirmed()%>,<%=prov[8].getCurrentConfirmed()%>,
        	<%=prov[9].getCurrentConfirmed()%>,<%=prov[10].getCurrentConfirmed()%>,<%=prov[11].getCurrentConfirmed()%>,
        	<%=prov[12].getCurrentConfirmed()%>,<%=prov[13].getCurrentConfirmed()%>,<%=prov[14].getCurrentConfirmed()%>,
        	<%=prov[15].getCurrentConfirmed()%>,<%=prov[16].getCurrentConfirmed()%>,<%=prov[17].getCurrentConfirmed()%>,
        	<%=prov[18].getCurrentConfirmed()%>,<%=prov[19].getCurrentConfirmed()%>,<%=prov[20].getCurrentConfirmed()%>,
        	<%=prov[21].getCurrentConfirmed()%>,<%=prov[22].getCurrentConfirmed()%>,<%=prov[23].getCurrentConfirmed()%>,
        	<%=prov[24].getCurrentConfirmed()%>,<%=prov[25].getCurrentConfirmed()%>,<%=prov[26].getCurrentConfirmed()%>,
        	<%=prov[27].getCurrentConfirmed()%>,<%=prov[28].getCurrentConfirmed()%>,<%=prov[29].getCurrentConfirmed()%>,],
    },
    {
        name:'治愈人数',
        type:'line',
        areaStyle: {normal: {}},
        data:[<%=prov[0].getCured()%>,<%=prov[1].getCured()%>,<%=prov[2].getCured()%>,
        	<%=prov[3].getCured()%>,<%=prov[4].getCured()%>,<%=prov[5].getCured()%>,
        	<%=prov[6].getCured()%>,<%=prov[7].getCured()%>,<%=prov[8].getCured()%>,
        	<%=prov[9].getCured()%>,<%=prov[10].getCured()%>,<%=prov[11].getCured()%>,
        	<%=prov[12].getCured()%>,<%=prov[13].getCured()%>,<%=prov[14].getCured()%>,
        	<%=prov[15].getCured()%>,<%=prov[16].getCured()%>,<%=prov[17].getCured()%>,
        	<%=prov[18].getCured()%>,<%=prov[19].getCured()%>,<%=prov[20].getCured()%>,
        	<%=prov[21].getCured()%>,<%=prov[22].getCured()%>,<%=prov[23].getCured()%>,
        	<%=prov[24].getCured()%>,<%=prov[25].getCured()%>,<%=prov[26].getCured()%>,
        	<%=prov[27].getCured()%>,<%=prov[28].getCured()%>,<%=prov[29].getCured()%>,],
    },
    {
        name:'死亡人数',
        type:'line',
        areaStyle: {normal: {}},
        data:[<%=prov[0].getDead()%>,<%=prov[1].getDead()%>,<%=prov[2].getDead()%>,
        	<%=prov[3].getDead()%>,<%=prov[4].getDead()%>,<%=prov[5].getDead()%>,
        	<%=prov[6].getDead()%>,<%=prov[7].getDead()%>,<%=prov[8].getDead()%>,
        	<%=prov[9].getDead()%>,<%=prov[10].getDead()%>,<%=prov[11].getDead()%>,
        	<%=prov[12].getDead()%>,<%=prov[13].getDead()%>,<%=prov[14].getDead()%>,
        	<%=prov[15].getDead()%>,<%=prov[16].getDead()%>,<%=prov[17].getDead()%>,
        	<%=prov[18].getDead()%>,<%=prov[19].getDead()%>,<%=prov[20].getDead()%>,
        	<%=prov[21].getDead()%>,<%=prov[22].getDead()%>,<%=prov[23].getDead()%>,
        	<%=prov[24].getDead()%>,<%=prov[25].getDead()%>,<%=prov[26].getDead()%>,
        	<%=prov[27].getDead()%>,<%=prov[28].getDead()%>,<%=prov[29].getDead()%>,],
    }],
    

    tooltip : {
    	formatter: function (params) { // params的个数等于折线的条数（对多条折线数据进行加单位，就需要遍历）
    		var info = '<p style="font-size:10px">' + params[0].name 
             + '</p><p style="font-size:10px">确诊人数：' + params[0].value + ' </p>' 
             + '</p><p style="font-size:10px">治愈人数：' + params[1].value + ' </p>' 
             return info;
     	},
        trigger: 'item',
        fontSize:"12px",
        backgroundColor: "rgba(55,55,55,0.8)",//提示标签背景颜色
        textStyle: { color: "#fff" }, //提示标签字体颜色
        /* triggerOn: 'click', */
        trigger: 'axis',
        enterable:true 
       	
    },
    
    
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