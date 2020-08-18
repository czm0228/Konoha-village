<%--
  Created by IntelliJ IDEA.
  User: 陈志明
  Date: 2020/7/4
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<html>
<head>
    <title>注册成功</title>
</head>
<style type="text/css">

    body {
        background: url("../../img/zcbj.jpg");
        background-size: 1920px 935px;
    }

    .zc {
        position: absolute;
        left: 850px;
        bottom: 500px;
        text-align: center;
        line-height: 15px;
        border-radius: 15px;
        border: 2px solid #00bfff;
        box-shadow: 0px 0px 10px 5px #00bfff;
        padding: 20px;
        width: 200px;
        height: 50px;
    }

    .tiao {
        position: absolute;
        left: 850px;
        bottom: 420px;
        text-align: center;
        border-radius: 15px;
        border: 2px solid #00bfff;
        box-shadow: 0px 0px 10px 5px #00bfff;
        width: 240px;
        height: 50px;
    }
    .button {
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        border: solid 1px #00bfff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
        -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
        color: #00bfff;
        padding: 8px 12px;
        text-decoration: none;
        position: absolute;
        left: 910px;
        bottom: 350px;
    }
    .button:hover{
        color: #209CFF;
    }

</style>

<body>

<div class="zc"><h1>注册成功!</h1></div>
<br/>
<div class="tiao">
    <span id="time">5</span>
    <p style="display: inline-block">秒之后跳转到登录页面</p>
</div>

<a href="/login"  class="button">点击立即登录</a>

</body>
</html>

<script type="text/javascript">

    /* window.onload = function () {
         setTimeout(changeTime, 1000);
     }
     function changeTime() {
         var time = document.getElementById("time").innerHTML;
         time = parseInt(time);
         time--;
         if (time <= 0) {
             var url = "/login";
             window.location = url;
         } else {
             document.getElementById("time").innerHTML= time;
             setTimeout(changeTime, 1000);
         }
     }*/
</script>