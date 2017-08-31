<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 - 智游客户关系管理系统</title>
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    <style>
    	body {
	margin: 0;
    background-color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 200px;
     margin-bottom: 200px;
}
input[type=submit] {
    width: 100%;
    height: 40px;
    line-height: 40px;
    font-size: 16px;
    background-color: green;
    border: none;
    color: #fff;
    padding: 0;
    margin: 5px 0;
    cursor: pointer;
}
    	   </style>
</head>
<body>
<div class="">
        <img src="${pageContext.request.contextPath }/image/logo.png" alt="智游"/>
        <form action="${pageContext.request.contextPath }/user/login.action" method="post">
            <div>
               <input type="text" class="form-control" placeholder="用户名" name="loginName">
            </div>
            <div>
               <input type="text" class="form-control" placeholder="密码" name="loginPwd">
            </div>           
            <div >
	  	 <input type="submit" value="登录"> 
            </div> 
        </form>
    </div>
</body>
</html>