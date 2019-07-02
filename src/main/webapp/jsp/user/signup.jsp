<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>注册</title>
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
		<h1>注册
		<small>没有账号？<a href="${pageContext.request.contextPath}/user/login">登入</a></small>
		</h1>
		<form action="${pageContext.request.contextPath}/user/register" onsubmit="return check()">
			<div class="form-group">
				<label>用户名</label>
				<input class="form-control" name="Uname" id="Uname" type="text" placeholder="请输入用户名"  required pattern="[a-z0-9A-Z]{6,16}" title="帐号应为6-16位的字母或数字">
				<span id="Result"></span>
			</div>
			<div class="form-group">
				<label>手机号</label>
				<input type="text" name="Uphone" id="Uphone" class="form-control" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" title="手机号格式不正确" required placeholder="请输入手机号">
				<span id="Result1"></span>
			</div>

			<div class="form-group">
				<label>密码</label>
				<input type="password" name="Upassword" class="form-control" required placeholder="请输入密码">
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
				<button class="btn btn-primary btn-block" type="submit">注册</button>
				<button class="btn btn-primary btn-block" type="reset">重置</button>
			</div>

		</form>
	</div>
	<div class="footer">
		<div class="glyphicon glyphicon-copyright-mark"></div>
		2019 web
	</div>
	<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js" type="text/javascript"> </script>
	<script type="text/javascript">
		var f1;
		var f2;
		$("#Uname").blur(function () {
			var Uname=$.trim($("#Uname").val());

			var data={Uname:Uname};
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/isEdit",
				data:{'Uname':Uname},
				dataType:'text',
				success:function (msg) {
					if (msg.trim()=="ok"){
						$('#Result').html("该用户名已经存在请更改");
						$('#Result').css("color","red");
						f1=true;

					}else {
						$('#Result').html("OK");
						$('#Result').css("color","green");
						f1=false;
					}

				}
			});
		});
		$("#Uphone").blur(function () {
			var Uname=$.trim($("#Uphone").val());

			var data={Uname:Uname};
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/isEdit",
				data:{'Uname':Uname},
				dataType:'text',
				success:function (msg) {
					if (msg.trim()=="ok"){
						$('#Result1').html("该电话已经存在请更改");
						$('#Result1').css("color","red");
						f2=true;

					}else {
						$('#Result1').html("OK");
						$('#Result1').css("color","green");
						f2=false;
					}

				}
			});
		});


		function check() {
				if (f2||f1) {
					alert("请重新提交数据不符合要求");
					return false;
				}

				return true;

		}




	</script>



</body>
</html>