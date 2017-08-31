<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
 	 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-1.12.4.min.js"></script>
</head>
<body>
			<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header"  style="margin-left: 300px">
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
		        <li><a href="${pageContext.request.contextPath}/admin/videoList.action">视频管理 <span class="sr-only">(current)</span></a></li>
		        <li class="active"><a href="${pageContext.request.contextPath}/admin/speakerList.action">主讲人管理</a></li>
		        <li><a href="${pageContext.request.contextPath}/admin/courseList.action">课程管理</a></li>
		        <li><a href="${pageContext.request.contextPath}/admin/analyse.action">统计分析</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		       <li ><a href="#">admin</a></li>  
		       <li  style="margin-right: 300px;font-size:large" >
		       <a class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></a>
		        </li>   
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
			<div class="jumbotron" style="margin-left: 300px;margin-right: 300px;" >
			  <h1>主讲人列表-主讲人管理</h1>
			</div>
			<a href="${pageContext.request.contextPath}/admin/addSpeaker.action"  class="btn btn-primary" style="margin-left: 300px">添加演讲人</a>
			<div class="pull-right">
			<form class="form-inline" action="${pageContext.request.contextPath}/admin/speakerList.action">
			  <div class="form-group">
			    <label for="exampleInputName2">名称</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="主讲人名称" name="speakerName" value="${speakername}">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputEmail2">职位</label>
			    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="主讲人职位" name="speakerJob" value="${speakerjob}">
			  </div>
			  <button type="submit" class="btn btn-primary" style="margin-right: 300px">查询</button>
			</form>
			</div>
		<div style="margin-left: 300px;margin-right: 300px">
			<table class="table table-hover" >		
				<thead>
					<tr>
						<th>序号</th>
						<th>名称</th>
						<th>职位</th>
						<th>简介</th>
						<th>编辑</th>
						<th>删除</th>			
					</tr>		
				</thead>
				<tbody>
					 <c:forEach var="speaker" items="${page.rows}" varStatus="status">
					<tr>
						<th scope="row">${ status.count+(page.page-1)*10 }</th>
						<td>${speaker.speakerName}</td>	
						<td>${speaker.speakerJob}</td>
						<td>${speaker.speakerDescr}</td>
						<td><a class="glyphicon glyphicon-edit" aria-hidden="true"></a></td>
						<td>   		
						<a class="glyphicon glyphicon-trash" aria-hidden="true"></a>                	
						</td>
					</tr>	
					 </c:forEach>						
				</tbody>	
		</table>
		</div>
</body>
</html>