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
							<li>欢迎<a style="color: red">${user.uname}</a> </li>
							<li><a href="${pageContext.request.contextPath}/user/loginout/${user.uid}">退出</a></li>
							<li><a href="#">个人信息</a></li>
			  	</ul>
		  	</div>		  	
		</div>
	</div>

	<div class="container container-small">

		<form action="${pageContext.request.contextPath}/user/Useredit/${usernews.uid}" method="post">
			<div class="form-group">

				<input class="form-control" style="display: none" name="Uid" type="text"  value="${usernews.uid}">
			</div>

			<div class="form-group">
				<label>用户名</label>
				<input class="form-control" name="Uname" value="${usernews.uname}" type="text" placeholder="请输入用户名"  required pattern="[a-z0-9A-Z]{6,16}" title="帐号应为6-16位的字母或数字">
			</div>
			<div class="form-group">
				<label>手机号</label>
				<input type="text" name="Uphone" value="${usernews.uphone}" class="form-control" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" title="手机号格式不正确" required placeholder="请输入手机号">
			</div>

			<div class="form-group">
				<label>密码</label>
				<input type="password" name="Upassword" value="${usernews.upassword}" class="form-control" required placeholder="请输入密码">
			</div>

			<div class="form-group" >
				<label class="radio-inline">
					<input type="radio" value="男" name="Sex"  checked>男性
				</label>

				<label class="radio-inline">
					<input type="radio" value="女" name="Sex"  >女性
				</label>
			</div>

			<div class="form-group">
				<button class="btn btn-primary btn-block" type="submit">确认修改</button>

			</div>

		</form>




	</div>
	<div class="footer">
		<div class="glyphicon glyphicon-copyright-mark"></div>
		2019 web
	</div>
</body>
</html>