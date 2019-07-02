<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugings/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"></jsp:include>

</div>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
            <legend>添加新闻类别</legend>
        </fieldset>
        <form class="layui-form" action="${pageContext.request.contextPath}/news/editType">

            <div class="layui-form-item">

                <div class="layui-input-inline">
                    <input type="text"  name="categoryId" style="display:none" value="${category.categoryId}" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">类别名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="categoryName" value="${category.categoryName}" required lay-verify="required" placeholder="请输入更改类别" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>

            <div class="layui-form-item">

                <div class="layui-input-inline">
                    <input type="text"  name="categoryUrl" style="display:none" value="null" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>
            <div class="layui-form-item">

                <div class="layui-input-inline">
                    <input type="text"  name="categoryImgurl" style="display:none" value="null" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>







            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
</div>
</div>
<script src="${pageContext.request.contextPath}/static/plugings/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('form', function(){
        var form = layui.form;

    });

    layui.use('element',function () {
        var element=layui.element;
    });
</script>
</body>
</html>