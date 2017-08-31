<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="zpd" uri="http://zhiyou100.com/common/" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">	
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-confirm.css">
  <script type="text/javascript"> 
  var num = 0;
  function checkAllElement(ele){
		 $("input[name=blankCheckbox]").prop("checked",ele.checked);
		 if(ele.checked){
			 deleteNum = $("input[name=blankCheckbox]").length;
		 }else{
			 deleteNum = 0;
		 }
		 $("span").text(deleteNum);
		
	 }
	//document.getElementsByName("san")[0].innerHTML = num;

 function findAll(){
	num=0;
	 var arr = document.getElementsByName("blankCheckbox");	 
	 var b = 0;
	 for(var i = 0; i < arr.length; i++){
		 if(arr[i].checked){
			 num++;
		 }else{
			 b = i;
			 $("input[name=main]").prop("checked",false);
			// document.getElementsByName("main")[0].checked = false;
		 }	 
	 }
	 if(num==10){
		 $("input[name=main]").prop("checked",true);
		// document.getElementsByName("main")[0].checked = true;
	 }
	 $("span").text(num);
	 //document.getElementsByName("san")[0].innerHTML = num;
 }
 function ordelete(){
	 if(num==0){
		 $.alert({
			    title: '删你麻痹',
			    content: '没有还删?',
			});
	 }else{		
		 $.confirm({
			    title: '全部删除!',
			    content: '大兄弟这可是全删,手下留情哦',
			    buttons: {
			        确定: {
			            text: '确定',
			            btnClass: 'btn-blue',
			            keys: ['enter', 'shift'],
			            action: function(){
			                $.alert('真的要删除吗');
			                $("#Delete01").submit();
			            }
			        },
			/*         取消: function () {
			            $.alert('Canceled!');
			        }, */
			        取消: function () {
			            $.alert('取消了哦!');
			        }
			    }
			});
		 
		// document.getElementsByName("Delete01")[0].submit();	 
	 }
 }
  </script>  
</head>
<body>
		<!-- 引入公用的导航信息 -->
	<jsp:include page="/WEB-INF/view/header.jsp">
		<jsp:param value="video" name="fromJsp"/>
	</jsp:include>
	
		<div class="jumbotron" style="margin-left: 300px;margin-right: 300px;" 	>
			  <h1>视频列表-视频管理</h1>
			</div>
				<a class="btn btn-primary" style="margin-left: 300px;" href="${pageContext.request.contextPath}/admin/addVideo.action">添加视频</a>
				<a class="btn btn-primary" type="button" onclick="ordelete()">
				  批量删除 <span class="badge" name ="san">0</span>
				</a>
			<div class="pull-right" style="margin-right: 300px ;">
			<form class="form-inline" action="${pageContext.request.contextPath}/admin/videoList.action ">
			  <div class="form-group">
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="视频标题" name="title" value="${title}">
			  </div>
				<select name="speecher" class="form-control">
				<%-- <c:forEach var="video" items="${page.rows}" varStatus="status">
					<option value="${ video.speaker_id">${ video.speakerName}</option>
				</c:forEach> --%>
				<option value="">请选择主讲人</option>
				<c:forEach items="${list1}" var="list">
					<option value="${list.id}" ${speecher eq list.id ? "selected":""}>${list.speakerName}</option>	
				</c:forEach>
				</select>
				<select name="course" class="form-control">
					<option value="">请选择课程</option>
					<c:forEach items="${list2}" var="list">
					<option value="${list.id}" ${course eq list.id ? "selected":""}>${list.courseName}</option>	
				</c:forEach>
				</select>
			  <button type="submit" class="btn btn-primary">查询</button>
			</form>
			</div>
		<div style="margin-left: 300px;margin-right: 300px;">
		<form class="form-inline" action="${pageContext.request.contextPath}/admin/aaa.action " id="Delete01">
			<table class="table table-hover" >		
				<thead>
					<tr>
						<th>
							<div class="checkbox" >
							  <label>
							    <input type="checkbox" onclick="checkAllElement(this)" name ="main" value="option1" aria-label="...">
							  </label>
							</div>
						</th>
						<th>序号</th>
						<th>名称</th>
						<th>介绍</th>
						<th>讲师</th>
						<th>课程</th>
						<th>时长</th>		
						<th>播放次数</th>	
						<th>编辑</th>	
						<th>删除</th>	
					</tr>		
				</thead>
				<tbody>
						 <c:forEach var="video" items="${page.rows}" varStatus="status">
					<tr>
						<th>
							<div class="checkbox">
							  <label>
							    <input type="checkbox" name="blankCheckbox" onclick="findAll()" value="${video.id}" aria-label="...">
							  </label>
							</div>
						</th>
						<th scope="row">${ status.count+(page.page-1)*10 }</th>
						<td>${ video.videoTitle }</td>	
						<td>${ video.videoDescr }</td>
						<td>${ video.speakerName}</td>
						<td>${ video.courseName }</td>
						<td>${ video.videoLength }</td>
						<td>${ video.videoPlayTimes }</td>
						<td><a href="<c:url value="/admin/updateVideo.action?id=${video.id}"/>" class="glyphicon glyphicon-edit " aria-hidden="true"></a></td>
						<td><a class="glyphicon glyphicon-trash" data-toggle="modal" data-target="#myModal${video.id }" ></a>
							<div class="modal fade" id="myModal${video.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">确认框</h4>
							      </div>
							      <div class="modal-body">
							                确认删除么
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>    
							        <a class="btn btn-primary" href="<c:url value="/admin/deleteVideo.action?id=${video.id }" />">确定</a>	       	
							      </div>
							    </div>
							  </div>
							</div>
						</td>				
					</tr>	
					  </c:forEach>			
					<input hidden="submit">
					</form>
				</tbody>	
		</table>
		</div>
		<div style="margin-left: 300px;margin-right: 300px;">
		<zpd:page url="${pageContext.request.contextPath}/admin/videoList.action"></zpd:page>
		</div>
</body>
</html>