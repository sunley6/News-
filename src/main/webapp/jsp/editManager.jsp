<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/9
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugings/layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"></jsp:include>

</div>
<div class="layui-body">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>完善个人信息</legend>
    </fieldset>
    <div class="layui-row">
        <div class="layui-col-md6">
            <form class="layui-form" action="${pageContext.request.contextPath}/manager/manageredit" method="post" charset="utf-8" target="_parent">
                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <input type="text" name="Mid" required  lay-verify="required" value="${manager.mid }" autocomplete="off" readonly="readonly" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">登录名</label>
                    <div class="layui-input-block">
                        <input type="text" name="Mname" required  lay-verify="required" value="${manager.mname}" autocomplete="off"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="text" name="Mpassword" required  lay-verify="required" value="${manager.mpassword}" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-upload">
                    <label class="layui-form-label">头像:</label>

                    <div class="layui-upload layui-input-block">

                        <input type="hidden" name="imgurl" id="imgurl" value="${manager.imgurl}" required lay-verify="required" />
                        <button type="button" class="layui-btn layui-btn-primary" id="fileBtn"><i class="layui-icon">&#xe67c;</i>选择文件</button>
                        <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 20px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="btn1" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

            </form>

        </div>
        <div class="layui-col-md3">
            <div class="layui-upload layui-col-lg-offset2">
                <div class="layui-upload-list">
                    <img class="layui-upload-img"  src="${manager.imgurl}" style="width: 50%">
                    <p id="demoText"></p>
                    <button type="button" class="layui-btn" id="test1">头像</button>
                </div>
            </div>
        </div>
    </div>





</div>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/plugings/layui/layui.js"></script>
<script type="text/javascript">

    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use('upload',function(){
        var upload = layui.upload;
        upload.render({
            elem: '#fileBtn'
            ,url: '${pageContext.request.contextPath}/uploadFile'
            ,accept: 'file'
            ,auto: false,
            aysc:false
            ,bindAction: '#uploadBtn'
            ,done: function(res){

                $("[name=imgurl]").val(res.data.src)
            }
        });
    });



</script>

</body>
</html>