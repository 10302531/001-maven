<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">	
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
   <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/echarts.js"></script>
</head>
<body>
				  <nav class="navbar navbar-inverse">
			  <div class="container-fluid" >
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header" style="margin-left: 300px">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="#">视频管理系统</a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="${pageContext.request.contextPath}/admin/videoList.action">视频管理 <span class="sr-only">(current)</span></a></li>
			        <li><a href="${pageContext.request.contextPath}/admin/speakerList.action">主讲人管理</a></li>
			        <li><a href="${pageContext.request.contextPath}/admin/courseList.action">课程管理</a></li>
			        <li><a href="${pageContext.request.contextPath}/admin/analyse.action">统计分析</a></li>
			      </ul>
			      <ul class="nav navbar-nav navbar-right">
			       <li ><a href="#">${admin.loginName}</a></li>  
			       <li  style="margin-right: 300px;font-size:large" >
			       <a class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></a>
			        </li>      
			      </ul>
			    </div><!-- /.navbar-collapse -->                                       
			  </div><!-- /.container-fluid -->
			</nav>
			<div class="jumbotron" style="margin-left: 300px;margin-right: 300px;" 	>
						  <h1>统计-统计分析</h1>
			</div> 
     <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
  <div id="main" style="width: 60%;height:700px;margin-left: 300px;"></div>
    <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text:''
            },
            tooltip: {},
            legend: {
                data:['课程平均播放次数']
            },
            xAxis: {
            	 data: ["${courseName}"]
            },
            yAxis: {},
            series: [{
               	color:'blue',
            	name: '课程平均播放次数',
                type: 'bar',
                data: [${playTimes}]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>

</body>
</html>