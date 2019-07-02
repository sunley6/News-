<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>登入</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugings/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/news.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugings/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugings/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<div class="navbar-brand">
					<img src="${pageContext.request.contextPath}/static/plugings/image/timg%20.jpg" alt="mkm" height="56" width="200">
				</div>
		  	</div>
		  	<label for="toggle-checkbox" id="toggle-label" class="visible-xs-inline-block">MENU</label>
		  	<input type="checkbox" id="toggle-checkbox" class="hidden">
		  	<div class="hidden-xs">
		  		<ul class="nav navbar-nav">
			  		<li class="active"><a href="${pageContext.request.contextPath}/news/type/all">首页</a></li>

			  	</ul>
			  	<ul class="nav navbar-nav navbar-right">
							<li><a>欢迎</a></li>
							<li><a style="color: red">${user.uname}</a> </li>
							<li><a href="${pageContext.request.contextPath}/user/loginout/${user.uid}">退出</a></li>
							<li><a href="#">个人信息</a></li>
			  	</ul>
		  	</div>		  	
		</div>
	</div>

	<div class="container container-small">


			<div class="tab-content" >
				<label>用户名</label>
				<input disabled type="text" name="Uname" value="${usernews.uname}" class="form-control">
			</div>
		<div class="tab-content" >
			<label>联系方式</label>
			<input type="text"  disabled  name="Uphone" value="${usernews.uphone}" class="form-control">
		</div>

		<div class="tab-content" >
			<label>密码</label>
			<input  disabled type="text" name="Uname" value="${usernews.upassword}" class="form-control">
		</div>
		<div class="tab-content" >
			<label>性别</label>
			<input  disabled type="text" name="Sex" value="${usernews.sex}" class="form-control">
		</div>

		<div class="button">
			<a href="${pageContext.request.contextPath}/user/editUserNews/${usernews.uid}">修改个人信息</a>
		</div>





	</div>
	<div class="footer">
		<div class="glyphicon glyphicon-copyright-mark"></div>
		2019 web
	</div>
</body>
</html>