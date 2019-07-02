<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="layui-layout layui-layout-admin" >

        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>添加新闻</legend>
            </fieldset>
            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/news/addnews" >
                <div class="layui-form-item">
                    <label class="layui-form-label">新闻标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="newsTitle" autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新闻类别</label>
                    <div class="layui-input-block">
                        <select name="newsType" lay-filter="aihao">
                            <option value=""></option>
                            <c:forEach items="${listType}" var="type">
                                <option value="${type.categoryName}">${type.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">关键字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="newsText" lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">

                    <div class="layui-input-inline">
                        <input type="text" name="imgurl" value="null" style="display: none" lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">日期选择</label>
                        <div class="layui-input-block">
                            <input type="text" name="newsCreatetime" id="date1" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <!--富文本编辑器-->

                <textarea id="newsContent" name="newsContent" class="layui-textarea layui-hide"></textarea><br>


                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="demo2">确认添加</button>
                </div>
            </form>

            <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

        </div>
    </div>
</div>

<div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
</div>
</div>

<script src="${pageContext.request.contextPath}/static/plugings/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    //
    // layui.use('layedit', function () {
    //     var layedit = layui.layedit;
    //     layedit.build('newsContent'); //建立编辑器
    //
    // });
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //图片上传接口
        layedit.set({
            uploadImage: {
                url: '${pageContext.request.contextPath}/uploadFile' //接口url
                ,type: 'post' //默认post
            }
        });
        //创建一个编辑器
        var editIndex = layedit.build('newsContent');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });

</script>
</body>
</html>