<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugings/layui/css/layui.css">


</head>
<body>

<br/><br/><br/>
<form class="layui-form" action="" method="post">

    <%
        String id=request.getParameter("id");

    %>

    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <input type="hidden" name="id" style="width:200px;" autocomplete="off" value="<%=id%>" class="layui-input">
        </div>
    </div>

    <%
        String Uname=request.getParameter("Uname");

    %>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="Uname" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="<%=Uname%>">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>

    <%
        String Upassword=request.getParameter("Upassword");

    %>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="Upassword"value="<%=Upassword%>" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">6-12位</div>
    </div>

    <%
        String Sex=request.getParameter("Sex");

    %>
    <div class="layui-form-item">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="Sex" value="<%=Sex%>" title="男">
            <input type="radio" name="Sex" value="<%=Sex%>" title="女" checked>
        </div>
    </div>

    <%
        String Uphone=request.getParameter("Uphone");

    %>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="Uphone" value="<%=Uphone%>" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>

        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/static/plugings/layui/layui.js"></script>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>

<script>
    //JavaScript代码区域
    layui.use('form', function(){
        var form = layui.form;

    });

    layui.use('element',function () {
        var element=layui.element;
    });



</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //自定义验证规则
        /* form.verify({
          title: function(value){
            if(value.length < 5){
              return '标题至少得5个字符啊';
            }
          }
          ,pass: [/(.+){6,12}$/, '密码必须6到12位']
          ,content: function(value){
            layedit.sync(editIndex);
          }
        }); */

        //监听提交

        form.on('submit(demo1)', function(data){
            console.info(data);
            var json = JSON.stringify(data.field);
            console.info(json);
            $.ajax({
                url:'${pageContext.request.contextPath}/user/m3',
                type:'POST',
                data:'{json:'+json+'}',
                contentType:'text/json',
                success:function (msg) {

                }
            });
            return false;
        });
    });
</script>




</body>
</html>
