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
					<li><a href="${pageContext.request.contextPath}/user/login">登入</a></li>
			  		<li><a href="${pageContext.request.contextPath}/user/signup">注册</a></li>
			  	</ul>
		  	</div>		  	
		</div>
	</div>

	<div class="container container-small">
		<h1>登入
		<small>没有账号？<a href="${pageContext.request.contextPath}/user/signup">注册</a></small>
		</h1>
		<form action="${pageContext.request.contextPath}/user/checklogin" method="post">
			<div class="form-group" >
				<label>用户名/手机号</label>
				<input type="text" name="Uname" id="Uname" class="form-control">
			</div>


			<div class="form-group">
				<label>密码</label>
				<input type="password"  name="Upassword" class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-primary btn-block" type="submit">登入</button>
			</div>
			<span style="display: block;color: red;margin-top: 20px">${msg}</span>
			<div class="form-group">
				<a href="#">忘记密码？</a>
			</div>
		</form>
	</div>
	<div class="footer">
		<div class="glyphicon glyphicon-copyright-mark"></div>
		2017  拴蛋头条  中国互联网举报中心ICP证1401号
	</div>


</body>
</html>