<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>副页</title>
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
					<c:if test="${sessionScope.user==null}">
						<li><a href="${pageContext.request.contextPath}/user/login">登入</a></li>
						<li><a href="${pageContext.request.contextPath}/user/signup">注册</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
						<li><a>欢迎</a></li>
						<li  style="color: red"><a>${user.uname}</a></li>
						<li><a href="${pageContext.request.contextPath}/user/loginout/${user.uid}">退出</a></li>
						<li><a href="#">个人信息</a></li>

					</c:if>
				</ul>
		  	</div>		  	
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h1 class="news-title">
					${news.newsType}
				</h1>
				<%--<div class="news-status">--%>
				<%--25K阅读  35分之前发布--%>
					<%--<div class="label label-default">教育</div>--%>
					<%--<div class="label label-default">情感</div>--%>
				<%--</div>--%>
				<div class="news-content">
					${news.newsContent}
				</div>
				<div class="bottom" >
					<div class="clearfix">
						　　　　

						<div class="comments" >
							<p style="color: #8a6d3b">发表评论</p>
							<form action="${pageContext.request.contextPath}/comment/addcomment/${news.newsId}" onsubmit="return check()">
							<textarea name="commentContext"  required cols="60" rows="10" placeholder="请输入你想评论的内容"></textarea>
								<input name="newsId" style="display: none" value="${news.newsId}">
								<input name="Uname" style="display: none" value="${sessionScope.user.uname}">
							<input type="submit" value="提交">
							</form>
						</div>

						<div >
							<ul>
								<c:forEach items="${commentList}" var="obj">
									<li>
										<p style="color: #01AAED" >评论用户名：${obj.uname} </p>
											<div style="color:#000;">${obj.commentContext}</div>
										<p style="color: #ac2925"><fmt:formatDate value="${obj.commentTime}" pattern="yyyy-MM-dd HH:mm:ss"  ></fmt:formatDate>
												</p>
									</li>
								</c:forEach>
							</ul>
						</div>

					</div>

				</div>

			</div>
			<div class="col-md-4">
				<div class="side-bar-card">
					<div class="card-title">相关推荐</div>
					<div class="card-body">
						<div class="list">
							<c:forEach items="${newsType}" var="obj">
								<div class="item">
									<div class="title"><a href="${pageContext.request.contextPath}/news/newsdetail/${obj.newsId}">${obj.newsTitle}</a> </div>
									<div class="desc">${obj.newsText}</div>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>
				<div class="side-bar-card">
					<div class="card-title">
						最新新闻
					</div>
					<div class="card-body">
						<div class="list">
							<c:forEach items="${newsRand}" var="obj">
								<div class="item">
									<div class="title"><a href="${pageContext.request.contextPath}/news/newsdetail/${obj.newsId}">${obj.newsTitle}</a> </div>
									<div class="desc">${obj.newsText}</div>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	<div class="footer">
		<div class="glyphicon glyphicon-copyright-mark"></div>
		2017  拴蛋头条  中国互联网举报中心ICP证1401号
	</div>

	<script>

		function check() {
			var flag="<%=session.getAttribute("user")%>"

			if(flag=="null")
			{
				alert("请先登录");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>