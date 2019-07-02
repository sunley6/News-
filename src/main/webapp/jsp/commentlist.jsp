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

<div class="layui-body layui-layout-admin" >
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">

        <table class="layui-table" lay-data="{page:true, id:'idTest'}" lay-filter="demo" >


            <thead>
            <tr>
                <%--<th width="15%">用户ID</th>--%>
                <%--<th width="15%">用户名</th>--%>
                <%--<th width="15%">密码</th>--%>
                <%--<th width="15%">联系方式</th>--%>
                <%--<th width="15%">性别</th>--%>
                <%--<th width="25%">操作</th>--%>
                    <th lay-data="{field:'id', width:80, sort: true, fixed: true}">评论ID</th>
                    <th lay-data="{field:'commentContext', width:150}">评论内容</th>
                    <th lay-data="{field:'newsId', width:150, }">新闻id</th>
                    <th lay-data="{field:'Uname', width:200}">评论者</th>
                    <th lay-data="{field:'commentTime',width:150}">评论时间</th>

                    <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
            </tr>
            </thead>
            <tbody >
           <c:forEach items="${commentList}" var="obj">
               <tr>
                   <td>${obj.commentId}</td>
                   <td>${obj.commentContext}</td>
                   <td>${obj.newsId}</td>
                   <td>${obj.uname}</td>
                   <td>${obj.commentTime}</td>


               </tr>
           </c:forEach>


            </tbody>
        </table>

        <script type="text/html" id="barDemo">


            <a  class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del" id="del">删除</a>

        </script>
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
    layui.use('table', function(){
        var table = layui.table;



        table.on('tool(demo)', function(obj){
            var data = obj.data;


            if(obj.event === 'del'){

                layer.confirm('真的删除行么', function(index){
                    var userid=data.id;
                     obj.del();
                     alert(userid);
                     layer.close(index);

                    //确定删除
                    $.ajax({
                        data : {'commentId':data.id},
                        url : "${pageContext.request.contextPath }/comment/commentdel",
                        type : "post",

                        success : function (data) {


                        }
                    })
                });
            } else if(obj.event === 'edit'){
                var userid=data.id;

                <%--layer.open({--%>
                    <%--type: 2,--%>

                    <%--//title: title, //不显示标题栏--%>
                    <%--closeBtn: 2,--%>
                    <%--area: ['680px', '90%'],--%>
                    <%--shade: 0.8,--%>
                    <%--id: (new Date()).valueOf(), //设定一个id，防止重复弹出 时间戳1280977330748--%>
                    <%--//btn: ['保存', '取消'],--%>
                    <%--btnAlign: 'r',--%>
                    <%--moveType: 1, //拖拽模式，0或者1--%>
                    <%--content: '${pageContext.request.contextPath}/jsp/m2.jsp?id=' + data.id+"&Uname="+ data.Uname--%>
                        <%--+"&Upassword="+ data.Upassword+ "&Sex=" + data.Sex + "&Uphone=" + data.Uphone,--%>
                  <%----%>

                <%--});--%>


                $.ajax({
                    url : "${pageContext.request.contextPath }/news/editNewsInfo",
                    type : "post",
                    data : {'newsId':data.id},
                    success : function (data) {

                           location.href="${pageContext.request.contextPath}/jsp/editnews.jsp";

                    }
                })
            }

            return false;
        });

    });




    layui.use('element', function(){
        var element = layui.element;

    });

    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'padding' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
            ,limit:5
        });
    });





</script>


</body>
</html>