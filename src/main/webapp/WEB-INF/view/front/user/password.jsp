<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<base href="<%=basePath%>">
<%--     <base href="${BaseContext}"> --%>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="static/css/base.css">
    <link rel="stylesheet" href="static/css/profile.css">
    <script src="js/jquery-1.12.4.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/messages_zh.min.js"></script>
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
	<script type="text/javascript">
	$(function(){
		$("#checkForm").validate({
			
			rules:{
				oldPassword:{
						required:true,
						minlength:3
					},
					password:{
						required:true
					},
					newPasswordAgain:{
						required:true,
						equalTo:"input[name=password]"
					}
			},
			messages:{
				oldPassword:{
							required:"请输入旧密码",
							minlength:"用户名太短"
						},
						password:{
							required:"输入新密码"
						},
						newPasswordAgain:{
							required:"确认密码",
							equalTo:"密码不一致"
						}			
			}	
		});
	});
	$(function(){
		alert(222);
		 $(":input[name=oldPassword]").blur(function(){
			$.ajax({			
				type:"get",
				dataType:"text",
				data:"password=" + $(":input[name=oldPassword]").val()+"&id="+$("#bixu").val(),
				url:"front/validate.action",
				success:function(data){
					if(data == "fail"){
						$("#only").text("输入密码错误");
						$(":input[name=oldPassword]").val("");
						$(":input[name=oldPassword]").focus();
					}else{
						$("#only").text("");
					}
				}
			});	

		});
	})
	</script> 
</head>

<body class="w100">
   <jsp:include page="uheader.jsp"></jsp:include>
    <main>
        <div class="container">
            <h2>我的资料</h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <li><a href="front/user/profile.action?id=${user.id}">更改资料</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="front/user/avatar.action">更改头像</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="front/user/password.action">密码安全</a></li>
                </ul>
                <div class="proflle_tab_body">
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                        
                           <c:if test="${empty user.headUrl}">
		                         <img id="avatar"  src="static/img/avatar_lg.png" alt="">
		                      </c:if>
		                      
		                      <c:if test="${not empty user.headUrl}">
		                         <img id="avatar" width="200px" height="200px" src="/pic/${user.headUrl}" alt="">
		                      </c:if>
                           
                        </div>
                        
                        <div class="profile_ifo_area">
                        
                         <c:if test="${not empty message}">
				            <div>
				                <strong>${message}</strong>
				            </div>
				            </c:if>
                            <form action="front/user/password.action" method="post" id="checkForm">
                                <div class="form_group">
                                    <span class="dd">旧&#x3000;密&#x3000;码：</span>
                                    <input type="password" id="oldPassword" name="oldPassword">
                                    <span id="only" style="color: red"></span>                      
                                </div>
                                <div class="form_group">
                                    <span class="dd">新&#x3000;密&#x3000;码：</span>
                                    <input type="password" id="newPassword"  name="password">
                                </div>
                                <div class="form_group">
                                    <span class="dd">确认新密码：</span>
                                    <input type="password" id="newPassword02" name="newPasswordAgain">
                                </div>
                                <div class="form_submit dd">
                                    <input type="submit" value="保&#x3000;存">
                                    <input type="hidden" name="id" id="bixu" value="${user.id}">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="ufooter.jsp"></jsp:include>
    <%@include file="../include/script.html"%>
   <script type="text/javascript">
	
   </script>
</body>
</html>