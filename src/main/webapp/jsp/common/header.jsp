<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/1
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <%--<li class="layui-nav-item"><a href="">控制台</a></li>--%>
        <%--<li class="layui-nav-item"><a href="">商品管理</a></li>--%>
        <%--<li class="layui-nav-item"><a href="">用户</a></li>--%>
        <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;">其它系统</a>--%>
            <%--<dl class="layui-nav-child">--%>
                <%--<dd><a href="">邮件管理</a></dd>--%>
                <%--<dd><a href="">消息管理</a></dd>--%>
                <%--<dd><a href="">授权管理</a></dd>--%>
            <%--</dl>--%>
        <%--</li>--%>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${pageContext.request.contextPath}/${sessionScope.m.imgurl}" class="layui-nav-img">
                贤心
            </a>

        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/manager/managernews">个人信息</a></li>


        </li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/manager/managerout">退了</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">新闻类别</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/jsp/addcategory.jsp">增加类别</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/news/listType">类别管理</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/news/newsType">添加新闻</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/news/newsList">新闻列表</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/comment/commentlist">评论列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/jsp/addUser.jsp">添加用户</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/user/listuser">编辑用户</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/news/type/all">前台</a></dd>
                </dl>
            </li>

        </ul>
    </div>