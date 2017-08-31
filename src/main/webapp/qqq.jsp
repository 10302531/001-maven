<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="js/echarts.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '课程平均播放次数'
            },
            tooltip: {},
            legend: {
                data:['平均播放次数']
            },
            xAxis: {
            	 data: ["${list[0].courseName}","${list[1].courseName}","${list[2].courseName}","${list[3].courseName}","${list[4].courseName}"]
            },
            yAxis: {},
            series: [{
                name: '次数',
                type: 'bar',
                data: [${list[0].a}, ${list[1].a}, ${list[2].a}, ${list[3].a}, ${list[4].a}]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    222222222
    
    
    
     <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:70%;height:700px;margin-left: 300px"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
        		   title: {
                       text: '课程平均播放次数'
                   },
            tooltip: {},
            legend: {
                data:['平均播放次数']
            },
            xAxis: {
                data: ["${list[0].courseName}","${list[1].courseName}","${list[2].courseName}","${list[3].courseName}","${list[4].courseName}"]
            },
            yAxis: {},
            series: [{
                name: '次数',
                type: 'bar',
                data: [${list[0].a}, ${list[1].a}, ${list[2].a}, ${list[3].a}, ${list[4].a}]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>