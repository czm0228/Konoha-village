<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/4
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>房屋租赁系统</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
    <script language="javascript">
        if (top != window)
            top.location.href = window.location.href;
    </script>
    <script type="text/javascript">
        $(function () {

           /* $("#login").click(function () {

                var username=$("#username").val();
                var password=$("#password").val();
                var type=$("input[name='type']:checked").val();
                if(username ==null || username==""){
                    alert("用户名不能为空！")
                }else if(password ==null || password==""){
                    alert("密码不能为空！")
                }else {

                    $.ajax({
                        url:"/queryUser",
                        data:{"userName":username,"password":password,"type":type},
                        success:function (result) {
                            /!*console.log(result);*!/
                            if(result==null || result==""){
                                alert("用户名密码错误!")
                            }else{
                                if(result.type==0){
                                    window.location.href="";
                                }else {
                                    window.location.href="frameTenant";
                                }
                            }
                        }

                    })
                }

            })*/

        })
    </script>
</head>
<body style="background: url(../../img/3.jpg);background-size:cover;">
<div class="wrapper">

    <div class="container">
        <h1>房屋租赁网站</h1>
        <form class="form" id="loginform" action="/queryUser" method="post">
            <div style="color: red;position: absolute; top: -10px; left: 239px;">${requestScope.exception.message}</div>
            <div><input type="text" name="userName" id="username" placeholder="用户名" value="${param.userName}"></div>
            <div><input type="password" id="password" name="password" placeholder="密码"></div>
            <div>
                <%-- <label class="radio inline">
                     <input id="admin" type="radio" name="type" value="admin"/> 房东
                 </label>--%>
                <label class="radio inline">
                    <input id="zuke" type="radio" name="type" value="1" checked/> 租客
                </label>
                <label class="radio inline">
                    <input id="superadmin" type="radio" name="type" value="0"/>管理员
                </label>
                &nbsp;&nbsp;&nbsp;&nbsp;<a href="/register">没有账号？点我</a>
            </div>
            <button type="submit" id="login">登录</button>
        </form>

    </div>
</div>

</body>
</html>
