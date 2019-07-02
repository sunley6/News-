<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>dfsf</h4>
<input type="text" id="Uname" name="Uname">
<span id="Result"></span>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js" type="text/javascript"> </script>
<script type="text/javascript">

    $("#Uname").blur(function () {
        var Uname=$.trim($("#Uname").val());
        alert(Uname);
        var data={Uname:Uname};
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/user/isEdit",
            data:{'Uname':Uname},
            dataType:'text',
            success:function (msg) {
                alert("gsg"+msg);
                if (msg.trim()=="ok"){
                    $('#Result').html("Hello <b>world</b>!");
                    $('#Result').css("color","red");

                }else {
                   $('#Result').html("不可以");
                    $('#Result').css("color","green");
               }

            }
        });
    });
</script>
</body>
</html>
