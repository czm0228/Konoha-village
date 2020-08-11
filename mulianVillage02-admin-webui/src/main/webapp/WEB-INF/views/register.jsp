<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/4
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>房屋租赁系统</title>
    <link rel="stylesheet" type="text/css" href="../../css/styles.css">
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
    <script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>


        <script type="text/javascript">

            $(function () {

                /*点击注册*/
                $("#register").click(function () {
                    var username=$("#username").val();
                    var password=$("#password").val();
                    var phoneNumber=$("#phoneNumber").val();
                    var code=$("#code").val();
                    var type=$("#zuke").val();
                    if(username==null || username==""){
                        alert("用户名不能为空!")
                    }else if(password==null || password==""){
                        alert("密码不能为空!")
                    }else if(phoneNumber==null || phoneNumber==""){
                        alert("手机号码不能为空!")
                    }else if(code==null || code==""){
                        alert("验证码不能为空!")
                    }else {
                   /* alert(username+" "+password+" "+phoneNumber+" "+code)*/
                    $.ajax({
                        url:"/saveUser",
                        data:$("form").serialize(),
                        success:function (result) {
                                 alert(result)
                            if(result=="注册成功!"){
                                     window.location.href="/success";
                            }
                        }

                    })
                    }


                })


                /*点击获取验证码*/
                $("#checkCode").click(function () {
                    var phone=$("#phoneNumber").val();

                   if(!(/^0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/.test(phone))){
                        alert("手机号码有误，请重填");
                        return false;
                    }
                    $.ajax({
                        url:"/getCode",
                        data:{"phone":phone},
                        type:"post",
                        success:function (result) {
                           /* alert(result)*/
                            if(result){
                                alert("发送成功!")
                                settime($("#checkCode"));
                            }else {
                                alert("该手机号码已被注册!")
                            }
                        }
                    })
                })


                /*对获取验证码进行处理*/
                var countdown=60;
                function settime(obj) {
                    if (countdown == 0) {
                        obj.attr("disabled",false);
                        obj.text("重新发送");
                        countdown = 60;
                        return;
                    } else {
                        obj.attr("disabled", true);
                        obj.text("重新发送(" + countdown + ")") ;
                        countdown--;
                    }

                    setTimeout(function () {
                            settime(obj)
                        }
                        , 1000)
                }


            })




    </script>
</head>
<body style="background: url( ../../img/3.jpg);background-size:cover;">
<div class="wrapper">

    <div class="container">
        <h1>房屋租赁网站</h1>
        <%--action="/RegisterServlet"--%>
        <form class="form" id="registerform" action="#" method="post">
            <div style="position: absolute;top: -10px;left: 255px; color: red"><strong>${requestScope.msg!=null? msg:""}</strong></div>
            <div style="display: inline-block"><input type="text" name="userName" id="username" placeholder="用户名" value="${param.username}" required></div>
            <div><input type="password" id="password" name="password" placeholder="密码"  value="${param.password}" required></div>
                <div><input type="text" id="phoneNumber" name="phoneNumber"  placeholder="手机号码" value="${param.phoneNumber}" required></div>
                <div><input type="text" id="code" name="code"  placeholder="验证码" style="width: 130px; display: inline-block;"  required>
                    <button type="button" class="getCode"  style="width: 120px; font-size: 15px;" id="checkCode">获取验证码</button></div>
            <div>
              <%--  <label class="radio inline">
                    <input id="admin" type="radio" name="type" value="admin"  /> 房东
                </label>--%>
                <label class="radio inline">
                    <input id="zuke" type="radio" name="type" value="0"  checked/> 租客
                </label>
            </div>
            <button type="button" id="register">注册</button>
        </form>
    </div>
</div>
</body>

</html>
