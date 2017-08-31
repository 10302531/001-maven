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
 	 <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid" style="margin-left: 300px" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
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
        <li class="active"><a href="#">视频管理 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">主讲人管理</a></li>
        <li><a href="#">课程管理</a></li>
        <li><a href="#">统计分析</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <li ><a href="#">admin</a></li>  
       <li  style="margin-right:300px;font-size: large;" >
       <a class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></a>
        </li>   
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		<div class="jumbotron" style="margin-left:300px;margin-right:300px">
			  <h2>编辑视频信息-视频管理</h2	>
			</div>
	<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/updateVideo.action" method="post">
  <div class="form-group" style="margin-left:200px;margin-right: 300px">
    <label for="inputEmail3" class="col-sm-2 control-label">视频标题</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" placeholder="Email" name="videoTitle" value="${video.videoTitle}">
    </div>
  </div>
   <div class="form-group" style="margin-right: 300px;margin-left: 200px">
    <label for="inputEmail3" class="col-sm-2 control-label">主讲人</label>
  <div class="col-sm-10" >
    <select  class="form-control" name="speakerId">
    	<c:forEach items="${list1}" var="list">
  	<option value="${list.id}" ${video.speakerId eq list.id ? "selected":""}>${list.speakerName}</option>
  	</c:forEach>
	</select>
  </div>
   </div>
   <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <label for="inputPassword3" class="col-sm-2 control-label">所属课程</label>
    <div class="col-sm-10">
     <select  class="form-control" name="courseId">
      	<c:forEach items="${list2}" var="list">
  	<option value="${list.id}" ${video.courseId eq list.id ? "selected":""}>${list.courseName}</option>
  	</c:forEach>
  		</select>
    </div>
  </div>
   <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <label for="inputPassword3" class="col-sm-2 control-label">视频时长</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword3" placeholder="Password" name="videoLength" value="${video.videoLength}">
    </div>
  </div>
   <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <label for="inputPassword3" class="col-sm-2 control-label">封面图片</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword3" placeholder="Password" name="videoImageUrl" value="${video.videoImageUrl}">
    </div>
  </div>
   <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <label for="inputPassword3" class="col-sm-2 control-label">视频播放地址</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword3" placeholder="Password" name="videoUrl" value="${video.videoUrl}">
    </div>
  </div>
  <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <label for="inputPassword3" class="col-sm-2 control-label">视频简介</label>
    <div class="col-sm-10">
     <textarea class="form-control" rows="3" name="videoDescr">${video.videoDescr}</textarea>
    </div>
  </div>
  <div class="form-group" style="margin-left: 200px;margin-right: 300px">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-info">保存</button>
		<a class="btn btn-info" href="javascript:history.go(-1)">返回</a>
    </div>
  </div>
  <input type="hidden" name="id" value="${video.id}">
</form>

</body>
</html>