<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>课程列表-课程管理</title>
 	 <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery-1.12.4.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="margin-left: 300px">
      <a class="navbar-brand" href="#">视频管理系统</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" > 
      <ul class="nav navbar-nav">
	        <li><a href="${pageContext.request.contextPath}/admin/videoList.action">视频管理 <span class="sr-only">(current)</span></a></li>
			<li><a href="${pageContext.request.contextPath}/admin/speakerList.action">主讲人管理</a></li>
		    <li class="active"><a href="${pageContext.request.contextPath}/admin/courseList.action">课程管理</a></li>
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
			<div class="row">
			  <div class="col-md-8 col-md-offset-2">
			  <div class="jumbotron" >
			  <h2 align="center">课程列表-课程管理</h2>
			</div>  
			  </div>
			</div>
			<a href="${pageContext.request.contextPath}/admin/addCourse.action" class="btn btn-primary" style="margin-left: 320px">添加课程</a>
			<div class="row">
			  <div class="col-md-8 col-md-offset-2">
			<table class="table table-hover">		
				<thead>
					<tr>
						<th>序号</th>
						<th>标题</th>
						<th>学科</th>
						<th>简介</th>
						<th>编辑</th>
						<th>删除</th>			
					</tr>		
				</thead>
				<tbody>
				 <c:forEach var="course" items="${page.rows}" varStatus="status">
					<tr>
						<th scope="row">${ status.count+(page.page-1)*10 }</th>
						<td>${course.courseName}</td>	
						<td>${course.subjectName}</td>
						<td>${course.courseDescr}</td>
						<td><a href="<c:url value="/admin/updateCourse.action?id=${course.id}"/>" class="glyphicon glyphicon-edit " aria-hidden="true"></a></td>
						<td><a href="<c:url value="/admin/deleteCourse.action?id=${course.id}"/>" class="glyphicon glyphicon-trash" aria-hidden="true"></a></td>		
					</tr>
					</c:forEach>
				</tbody>	
				</table>
			  </div>
			</div>
</body>
</html>