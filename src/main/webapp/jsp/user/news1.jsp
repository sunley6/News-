<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugings/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/news.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/plugings/bootstrap/css/bootstrap.css">
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

					<li style="left: 150px;margin-top: 5px">
						<div class="search-bar" >
                            <input type="text" id="searchname" name="searchname" >
                            <button onclick="finds()" id="click" value="搜索">搜索</button>
						</div>
					</li>
					<li style="left: 160px;margin-top: 10px" class="active">


					</li>


			  	</ul>

			  	<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.user==null}">
			  		<li><a href="${pageContext.request.contextPath}/user/login">登入</a></li>
			  		<li><a href="${pageContext.request.contextPath}/user/signup">注册</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
						<li><a>欢迎</a></li>
						<li><a style="color: red">${user.uname}</a></li>
						<li><a href="${pageContext.request.contextPath}/user/loginout/${user.uid}">退出</a></li>
					</c:if>
			  	</ul>
		  	</div>		  	
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group side-bar hidden-xs">
					<c:forEach items="${listCategory}" var="obj">
                        <a href="${pageContext.request.contextPath}/news/type/${obj.categoryName}" class="list-group-item active">${obj.categoryName}</a>
                    </c:forEach>


				</div>
			</div>
			<div class="col-md-7">

				<div class="pagination" >
					<div>
					<c:forEach items="${newsList1}" var="obj">
					<div class="news-list-item clearfix">
						<div class="col-xs-5">
                            <c:if test="${obj.imgurl=='null'}">11<img src="/upload/2019/6/20190612020044147.jpg" class="img-responsive" /></c:if>
                            <c:if test="${obj.imgurl!='null'}">${obj.imgurl}</c:if>
						</div>
						<div class="col-xs-7">


							<a class="title" href="${pageContext.request.contextPath}/news/newsdetail/${obj.newsId}">
								${obj.newsTitle}
							</a>

							<div class="info">

							${obj.newsText}
						</div>
						</div>

					</div>
					</c:forEach>
					</div>
                    <div>

                            <span>显示${pageInfo.startRow }到${pageInfo.endRow}共${pageInfo.total}条</span>

                            <a href="${pageContext.request.contextPath}/news/type/${name}?PageNum=1">首页 </a>

                            <c:choose>

                            <c:when test="${pageInfo.hasPreviousPage }">

                            <a href="${pageContext.request.contextPath}/news/type/${name}?PageNum=${pageInfo.pageNum-1}">上一页 </a>

                            </c:when>

                            <c:otherwise>

                            <span>上一页</span>

                            </c:otherwise>

                            </c:choose>

                            <c:forEach var="item" items="${pageInfo.navigatepageNums}">

                            <c:choose>

                            <c:when test="${pageInfo.pageNum == item }">

                            <span class="current">${pageInfo.pageNum }</span>

                            </c:when>

                            <c:otherwise>

                            <a href="${pageContext.request.contextPath}/news/type/${name}?PageNum=${item}">${item}</a>

                            </c:otherwise>

                            </c:choose>

                            </c:forEach>

                            <c:choose>

                            <c:when test="${!pageInfo.isLastPage }">

                            <a href="${pageContext.request.contextPath}/news/type/${name}?PageNum=${pageInfo.pageNum+1}">下一页 </a>

                            <a href="${pageContext.request.contextPath}/news/type/${name}?PageNum=${pageInfo.pages}">尾页</a>

                            </c:when>

                            <c:otherwise>

                            <span>下一页</span>

                            <span>尾页</span>

                            </c:otherwise>

                            </c:choose>

                    </div>
                    </div>

				</div>


			<div class="col-md-3">
				<div class="search-bar">
					<input type="search" placeholder="搜索" class="form-control"/>
				</div>
				<div class="side-bar-card flag clearfix">
					<div class="col-xs-5">
						<img src="./image/youhai.png"/>
					</div>
					<div class="col-xs-7">
						<div class="text-lg">有害信息举报专区</div>
						<div>举报电话：12377</div>
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


							<div class="item">
								<div class="title">网站最大的特色是悬浮于视频上方的实时评论功能，爱好者称其为“ 弹幕”。</div>
								<div class="desc">15K新闻 1K评论</div>
							</div>
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
<script src="${pageContext.request.contextPath}/static/plugings/jquery/pagination/jquery.pagination.js" type="text/javascript"></script>
	<%--<script>--%>
		<%--$(".#").pagination({--%>
			<%--totalData:9,--%>
			<%--pageCount:5,--%>
			<%--showData:3,--%>
			<%--current: 1,--%>
			<%--jump: true,--%>
			<%--coping: true,--%>
			<%--isHide:true,--%>
			<%--count: 2,--%>
			<%--homePage: '首页',--%>
			<%--endPage: '末页',--%>
			<%--prevContent: '上页',--%>
			<%--nextContent: '下页',--%>
			<%--callback: pageCallback //pageCallback() 为翻页调用次函数。--%>
		<%--});--%>
		<%--function pageCallback(api) {--%>
			<%--var pageNo=1 //当前页码--%>
			<%--if(api){--%>
				<%--pageNo=api.getCurrent()  //获取当前代码--%>
			<%--}--%>
			<%--console.log(pageNo);--%>
		<%--}--%>


	<%--</script>--%>

	<script>
		function finds(){

			var searchname =$('input[name=searchname]').val();
			url='${pageContext.request.contextPath}/news/mohufind/'+searchname;

			window.location.href=url;
		}
	</script>
</body>
</html>