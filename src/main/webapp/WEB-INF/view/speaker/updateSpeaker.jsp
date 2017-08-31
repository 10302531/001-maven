<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="margin-left: 300px;">视频管理系统</a>
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
       <li  style="margin-right: 300px;font-size:large" >
       <a class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></a>
        </li>
       </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		<div class="jumbotron" style="margin-left: 300px;margin-right: 300px;">
			  <h2>编辑主讲人-主讲人管理</h2>
			</div>
	<form class="form-horizontal">
  <div class="form-group" style="margin-left: 100px;margin-right: 300px;">
    <label for="inputEmail3" class="col-sm-2 control-label">名字</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group" style="margin-left: 100px;margin-right: 300px;">
    <label for="inputPassword3" class="col-sm-2 control-label">职业</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
   <div class="form-group" style="margin-left: 100px;margin-right: 300px;">
    <label for="inputPassword3" class="col-sm-2 control-label">头像图片</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group" style="margin-left: 100px;margin-right: 300px;">
    <label for="inputPassword3" class="col-sm-2 control-label">简介</label>
    <div class="col-sm-10">
     <textarea class="form-control" rows="3"></textarea>
    </div>
  </div>
  <div class="form-group" style="margin-left: 100px;margin-right: 300px;">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-info">保存</button>
		<a class="btn btn-info" href="javascript:history.go(-1)">返回列表</a>
    </div>
  </div>
</form>
</body>
</html>